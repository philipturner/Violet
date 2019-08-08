import XCTest
@testable import Lexer

/// Use 'python3 -m tokenize -e file.py' for python reference.
class IntegerTests: XCTestCase, Common {

  // MARK: - Decimal integer

  func test_decimal_zero() {
    let s = "0"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 1))
    }
  }

  func test_decimal_zero_withUnderscores() {
    let s = "0_000_000"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 9))
    }
  }

  /// Test case from:
  /// https://docs.python.org/3/reference/lexical_analysis.html#integer-literals
  func test_decimal() {
    let s = "2147483647"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 2_147_483_647)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 10))
    }
  }

  /// Test case from:
  /// https://docs.python.org/3/reference/lexical_analysis.html#integer-literals
  func test_decimal_withUnderscores() {
    let s = "100_000_000_000"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 100_000_000_000)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 15))
    }
  }

  func test_decimal_maxInt64() {
    let s = "9223372036854775807"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 9_223_372_036_854_775_807)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 19))
    }
  }

  // MARK: - Binary integer

  /// Test case from:
  /// https://docs.python.org/3/reference/lexical_analysis.html#integer-literals
  func test_binary() {
    let s = "0b100110111"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0b100110111)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 11))
    }
  }

  /// Test case from:
  /// https://docs.python.org/3/reference/lexical_analysis.html#integer-literals
  func test_binary_withUnderscores() {
    let s = "0b_1110_0101"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0b1110_0101)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 12))
    }
  }

  // MARK: - Octal integer

  /// Test case from:
  /// https://docs.python.org/3/reference/lexical_analysis.html#integer-literals
  func test_octal() {
    let s = "0o177"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0o177)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 5))
    }
  }

  /// Test case from (I added underscores):
  /// https://docs.python.org/3/reference/lexical_analysis.html#integer-literals
  func test_octal_withUnderscores() {
    let s = "0o_37_7"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0o377)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 7))
    }
  }

  // MARK: - Hex integer

  /// Test case from:
  /// https://docs.python.org/3/reference/lexical_analysis.html#integer-literals
  func test_hex() {
    let s = "0xdeadBEEF"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0xdeadbeef)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 10))
    }
  }

  func test_hex_withUnderscores() {
    let s = "0x_01_23_45_67_89_ac"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0x01_23_45_67_89_ac)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 20))
    }
  }

  func test_hex_zero() {
    let s = "0x0"
    var lexer = Lexer(for: s)

    if let token = self.getToken(&lexer) {
      XCTAssertInt(token.kind, 0x0)
      XCTAssertEqual(token.start, SourceLocation(line: 1, column: 0))
      XCTAssertEqual(token.end,   SourceLocation(line: 1, column: 3))
    }
  }

  func test_hex_lastUnderscore_isNotAPartOfTheNumber() {
    let s = "0x123_"
    var lexer = Lexer(for: s)

    if let error = self.error(&lexer) {
      XCTAssertEqual(error.kind, LexerErrorKind.danglingIntegerUnderscore)
      XCTAssertEqual(error.location, SourceLocation(line: 1, column: 6))
    }
  }
}
