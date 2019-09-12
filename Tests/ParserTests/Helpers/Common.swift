import XCTest
import Core
import Lexer
@testable import Parser

/// Shared test helpers.
internal protocol Common: ASTMatcher { }

extension Common {

  // MARK: - Creation

  /// Create parser for given tokens..
  internal func createExprParser(_ tokens: Token...) -> Parser {
    return self.createParser(mode: .eval, tokens: tokens)
  }

  /// Create parser for given tokens.
  internal func createStmtParser(_ tokens: Token...) -> Parser {
    return self.createParser(mode: .fileInput, tokens: tokens)
  }

  private func createParser(mode: ParserMode, tokens: [Token]) -> Parser {
    let lexer = FakeLexer(tokens: tokens)
    return Parser(mode: mode, tokenSource: lexer)
  }

  internal func token(_ kind: TokenKind,
                      start: SourceLocation,
                      end: SourceLocation) -> Token {
    return Token(kind, start: start, end: end)
  }

  // MARK: - Parse

  internal func parseExpr(_ parser: inout Parser,
                          file:    StaticString = #file,
                          line:    UInt         = #line) -> Expression? {
    do {
      let ast = try parser.parse()
      return self.matchExpression(ast, file: file, line: line)
    } catch {
      XCTAssert(false, "\(error)", file: file, line: line)
      return nil
    }
  }

  internal func parseStmt(_ parser: inout Parser,
                          file:    StaticString = #file,
                          line:    UInt         = #line) -> Statement? {
    do {
      let ast = try parser.parse()
      guard let statements = self.matchModule(ast, file: file, line: line) else {
        return nil
      }

      guard statements.count == 1 else {
        let msg = "Got \(statements.count) statements (expected 1)."
        XCTAssert(false, msg, file: file, line: line)
        return nil
      }

      return statements[0]
    } catch {
      XCTAssert(false, "\(error)", file: file, line: line)
      return nil
    }
  }

  // MARK: - Errors

  internal func error(_ parser: inout Parser,
                      file:    StaticString = #file,
                      line:    UInt = #line) -> ParserError? {
    do {
      let result = try parser.parse()
      XCTAssert(false, "Successful parse: \(result)", file: file, line: line)
      return nil
    } catch let error as ParserError {
      return error
    } catch {
      XCTAssert(false, "\(error)", file: file, line: line)
      return nil
    }
  }
}
