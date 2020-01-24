import Core
import Lexer

// In CPython:
// Python -> ast.c
//  ast_for_funcdef_impl(struct compiling *c, const node *n0, ...)
//  ast_for_classdef(struct compiling *c, const node *n, ...)

extension Parser {

  // MARK: - Function

  /// `funcdef: 'def' NAME parameters ['->' test] ':' suite`
  internal func funcDef(isAsync:    Bool = false,
                        start:      SourceLocation? = nil,
                        decorators: [Expression] = []) throws -> Statement {
    assert(self.peek.kind == .def)

    let start = start ?? self.peek.start
    try self.advance() // def

    let nameLocation = self.peek.start
    let name = try self.consumeIdentifierOrThrow()
    try self.checkForbiddenName(name, location: nameLocation)

    let args = try self.parameters()

    var returns: Expression?
    if try self.consumeIf(.rightArrow) {
      returns = try self.test()
    }

    try self.consumeOrThrow(.colon)
    let body = try self.suite()

    let kindArgs = FunctionDefArgs(name: name,
                                   args: args,
                                   body: body,
                                   decorators: decorators,
                                   returns: returns)

    let kind: StatementKind = isAsync ?
      .asyncFunctionDef(kindArgs) :
      .functionDef(kindArgs)

    return self.statement(kind, start: start, end: body.last.end)
  }

  // MARK: - Class

  /// `classdef: 'class' NAME ['(' [arglist] ')'] ':' suite`
  internal func classDef(start:      SourceLocation? = nil,
                         decorators: [Expression] = []) throws -> Statement {
    assert(self.peek.kind == .class)

    let start = start ?? self.peek.start
    try self.advance() // class

    let nameLocation = self.peek.start
    let name = try self.consumeIdentifierOrThrow()
    try self.checkForbiddenName(name, location: nameLocation)

    let args = try self.parseBaseClass()
    try self.consumeOrThrow(.colon)
    let body = try self.suite()

    let kindArgs = ClassDefArgs(name: name,
                                bases: args?.args ?? [],
                                keywords: args?.keywords ?? [], // PEP3115
                                body: body,
                                decorators: decorators)

    let kind = StatementKind.classDef(kindArgs)

    let end = body.last.end
    return self.statement(kind, start: start, end: end)
  }

  private func parseBaseClass() throws -> CallIR? {
    guard self.peek.kind == .leftParen else {
      return nil
    }

    try self.advance() // (

    // empty parens -> no base class
    if try self.consumeIf(.rightParen) {
      return nil
    }

    let result = try self.argList(closingToken: .rightParen, isBaseClass: true)
    try self.consumeOrThrow(.rightParen)
    return result
  }
}
