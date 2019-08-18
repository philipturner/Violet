import Lexer
import Foundation

// In CPython:
// Python -> ast.c
//  parsestrplus(struct compiling *c, const node *n)

extension Parser {

  // MARK: - Bytes

  internal mutating func bytesPlus() throws -> Expression {
    assert(self.isBytes(self.peek))

    let start = self.peek.start
    var end = self.peek.end
    var data = Data()

    while case let TokenKind.bytes(b) = self.peek.kind {
      data.append(b)
      end = self.peek.end
      try self.advance()
    }

    if self.isString(self.peek) || self.isFormatString(self.peek) {
      throw self.error(.mixBytesAndNonBytesLiterals)
    }

    return self.expression(.bytes(data), start: start, end: end)
  }

  // MARK: - String

  /// For normal strings and f-strings, concatenate them together.
  /// - Note:
  /// - String - no f-strings.
  /// - FormattedValue - just an f-string (with no leading or trailing literals).
  /// - JoinedStr - if there are multiple f-strings or any literals involved.
  internal mutating func strPlus() throws -> Expression {
    assert(self.isString(self.peek) || self.isFormatString(self.peek))

    let start = self.peek.start
    var end   = self.peek.end
    var string = FString()

    while self.isString(self.peek) || self.isFormatString(self.peek) {
      switch self.peek.kind {
      case let .string(s):
        string.append(s)
      case let .formatString(s):
        do {
        try string.appendFormatString(s)
        } catch let error as FStringError {
          throw self.error(.fStringError(error))
        }
      default: // should not happen
        assert(false)
      }

      end = self.peek.end
      try self.advance() // needed?
    }

    if self.isBytes(self.peek) {
      throw self.error(.mixBytesAndNonBytesLiterals)
    }

    let group = try string.compile()
    return self.expression(.string(group), start: start, end: end)
  }

  // MARK: - Is xxx

  private func isBytes(_ token: Token) -> Bool {
    if case TokenKind.bytes = token.kind {
      return true
    }
    return false
  }

  private func isString(_ token: Token) -> Bool {
    if case TokenKind.string = token.kind {
      return true
    }
    return false
  }

  private func isFormatString(_ token: Token) -> Bool {
    if case TokenKind.formatString = token.kind {
      return true
    }
    return false
  }
}
