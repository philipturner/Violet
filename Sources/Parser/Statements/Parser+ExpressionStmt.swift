import Core
import Lexer

// In CPython:
// Python -> ast.c
//  ast_for_expr_stmt(struct compiling *c, const node *n)

extension Parser {

  /// ```c
  /// expr_stmt: testlist_star_expr (
  ///   annassign
  ///   | augassign (yield_expr|testlist)
  ///   | ('=' (yield_expr|testlist_star_expr))*
  /// )
  /// annassign: ':' test ['=' test]
  /// testlist_star_expr: (test|star_expr) (',' (test|star_expr))* [',']
  /// augassign: ('+=' | '-=' | '*=' | '@=' | '/=' | '%=' | '&=' | '|=' | '^=' |
  /// '<<=' | '>>=' | '**=' | '//=')
  /// ```
  internal func exprStmt(closingTokens: [TokenKind]) throws -> Statement {
    // FIRST(n) == '('
    let isFirstInParen = self.peek.kind == .leftParen

    var firstClosing = closingTokens
    firstClosing.append(.equal)

    let firstStart = self.peek.start
    let firstList = try self.testListStarExpr(closingTokens: firstClosing)
    let first = firstList.toExpression(start: firstStart)

    switch self.peek.kind {
    case .colon:
      return try self.parseAnnAssign(target: first,
                                     isTargetInParen: isFirstInParen)

    case let tokKind where Parser.augAssign[tokKind] != nil:
     return try self.parseAugAssign(target: first,
                                    closingTokens: closingTokens)

    default:
      return try self.parseNormalAssign(firstTarget: first,
                                        closingTokens: closingTokens)
    }
  }

  // MARK: - Annotated assignment

  /// ```c
  /// expr_stmt: testlist_star_expr (
  ///   annassign
  ///   (...)
  /// )
  /// annassign: ':' test ['=' test]
  /// ```
  private func parseAnnAssign(target: Expression,
                              isTargetInParen: Bool) throws -> Statement {
    try self.checkAnnAssignTarget(target)

    let isTargetIdentifier = self.isIdentifierExpr(target)
    let isSimple = isTargetIdentifier && !isTargetInParen

    assert(self.peek.kind == .colon)
    try self.advance() // :

    let annotation = try self.test()

    var value: Expression?
    if try self.consumeIf(.equal) {
      value = try self.test()
    }

    let kind = StatementKind.annAssign(target: target,
                                       annotation: annotation,
                                       value: value,
                                       isSimple: isSimple)

    let start = target.start
    let end = value?.end ?? annotation.end
    return self.statement(kind, start: start, end: end)
  }

  private func checkAnnAssignTarget(_ target: Expression) throws {
    let loc = target.start

    switch target.kind {

    case let .identifier(name):
      try self.checkForbiddenName(name, location: loc)

    case let .attribute(_, name):
      try self.checkForbiddenName(name, location: loc)

    case .subscript:
      break

    case .list:
      throw self.error(.annAssignmentWithListTarget, location: loc)
    case .tuple:
      throw self.error(.annAssignmentWithTupleTarget, location: loc)
    default:
      throw self.error(.illegalAnnAssignmentTarget, location: loc)
    }
  }

  private func isIdentifierExpr(_ e: Expression) -> Bool {
    if case ExpressionKind.identifier = e.kind {
      return true
    }
    return false
  }

  // MARK: - Augumented assignment

  /// ```c
  /// augassign: ('+=' | '-=' | '*=' | '@=' | '/=' | '%=' | '&=' | '|=' | '^=' |
  ///             '<<=' | '>>=' | '**=' | '//=')
  /// ```
  private static let augAssign: [TokenKind:BinaryOperator] = [
    .plusEqual: .add, // +=
    .minusEqual: .sub, // -=
    .starEqual: .mul, // *=
    .atEqual: .matMul, // @=
    .slashEqual: .div, // /=
    .percentEqual: .modulo, // %=

    .amperEqual: .bitAnd, // &=
    .vbarEqual: .bitOr, // |=
    .circumflexEqual: .bitXor, // ^=

    .leftShiftEqual: .leftShift, // <<=
    .rightShiftEqual: .rightShift, // >>=
    .starStarEqual: .pow, // **=
    .slashSlashEqual: .floorDiv // //=
  ]

  /// expr_stmt: testlist_star_expr augassign (yield_expr|testlist)
  private func parseAugAssign(target: Expression,
                              closingTokens: [TokenKind]) throws -> Statement {

    try self.checkAugAssignTarget(target)

    let op = Parser.augAssign[self.peek.kind]
    assert(op != nil)
    try self.advance() // op

    let value = try self.parseAugAssignValue(closingTokens: closingTokens)

    // swiftlint:disable:next force_unwrapping
    let kind = StatementKind.augAssign(target: target, op: op!, value: value)
    return self.statement(kind, start: target.start, end: value.end)
  }

  private func checkAugAssignTarget(_ target: Expression) throws {
    switch target.kind {
    case .identifier,
         .attribute,
         .subscript:
      break
    default:
      throw self.error(.illegalAugAssignmentTarget, location: target.start)
    }
  }

  /// `yield_expr|testlist`
  private func parseAugAssignValue(closingTokens: [TokenKind]) throws -> Expression {
    if let e = try self.yieldExprOrNop(closingTokens: closingTokens) {
      return e
    }

    let listStart = self.peek.start
    let list = try self.testList(closingTokens: closingTokens)
    return list.toExpression(start: listStart)
  }

  // MARK: - Normal assignment

  /// `expr_stmt: testlist_star_expr ('=' (yield_expr|testlist_star_expr))*
  private func parseNormalAssign(firstTarget: Expression,
                                 closingTokens: [TokenKind]) throws -> Statement {

    var elements = [Expression]()

    var elementClosing = closingTokens
    elementClosing.append(.equal)

    while self.peek.kind == .equal {
      try self.advance() // =

      if let yield = try self.yieldExprOrNop(closingTokens: elementClosing) {
        elements.append(yield)
      } else {
        let testStart = self.peek.start
        let test = try self.testListStarExpr(closingTokens: elementClosing)
        elements.append(test.toExpression(start: testStart))
      }
    }

    guard let value = elements.last else {
      // Just an expr, without anything else. It does not even matter
      // (unless it has an side-effect like exception...).
      return self.statement(.expr(firstTarget),
                            start: firstTarget.start,
                            end: firstTarget.end)
    }

    let targets = NonEmptyArray(first: firstTarget, rest: elements.dropLast())
    try self.checkNormalAssignTargets(targets)

    let kind = StatementKind.assign(targets: targets, value: value)
    return self.statement(kind, start: firstTarget.start, end: value.end)
  }

  private func isYieldExpr(_ e: Expression) -> Bool {
    if case ExpressionKind.yield = e.kind {
      return true
    }
    return false
  }

  private func checkNormalAssignTargets(_ targets: NonEmptyArray<Expression>) throws {
    for expr in targets {
      if self.isYieldExpr(expr) {
        throw self.error(.assignmentToYield, location: expr.start)
      }
    }
  }
}
