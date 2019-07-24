// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Core

public enum LexerErrorKind: Equatable {

  /// Unexpected end of file
  case eof

  /// Inconsistent mixing of tabs and spaces
  case tabSpace
  /// Too many indentation levels
  case tooDeep
  /// No matching outer block for dedent
  case dedent

  /// Invalid character in identifier
  case identifier(UnicodeScalar)

  /// EOL in single-quoted string
  case unfinishedShortString
  /// EOF in triple-quoted string
  case unfinishedLongString
  /// Unable to decode string escape sequence
  case unicodeEscape
  /// Bytes can only contain ASCII literal characters
  case badByte(UnicodeScalar)

  /// Digit is required after underscore
  case danglingIntegerUnderscore
  /// Character 'x' is not an valid integer digit
  case invalidIntegerDigit(NumberType, UnicodeScalar)
  /// Unable to parse integer from 'x'
  case unableToParseInteger(NumberType, String)

  /// Character 'x' is not an valid decimal digit
  case invalidDecimalDigit(UnicodeScalar)
  /// Unable to parse integer from 'x'
  case unableToParseDecimal(String)

  /// Error in decoding into Unicode
  // case decode
  /// Unexpected characters after a line continuation
  // case lineCont
  /// Ill-formed single statement input
  // case badSingle
}

extension LexerErrorKind: CustomStringConvertible {
  public var description: String {
    switch self {
    case .eof:
      return "Unexpected end of file"

    case .tabSpace:
      return "Inconsistent mixing of tabs and spaces"
    case .tooDeep:
      return "Too many levels of indentation"
    case .dedent:
      return "Unindent does not match any outer indentation level"

    case .identifier(let c):
      return "Invalid character '\(c)' (unicode: \(c.debugDescription)) in identifier"

    case .unfinishedShortString:
      return "EOL while scanning string literal"
    case .unfinishedLongString:
      return "EOF while scanning triple-quoted string literal"
    case .badByte(let c):
      return "Invalid character '\(c)' (value: \(c.value). " +
             "Bytes can only contain ASCII literal characters"
    case .unicodeEscape:
      return "Unable to decode string escape sequence"

    case .danglingIntegerUnderscore:
      return "Digit is required after underscore"
    case let .invalidIntegerDigit(type, c):
      return "Character '\(c)' is not valid \(type) digit."
    case let .unableToParseInteger(type, s):
      return "Unable to parse \(type) integer from '\(s)'"

    case .invalidDecimalDigit(let c):
      return "Character '\(c)' is not valid decimal digit."
    case .unableToParseDecimal(let s):
      return "Unable to parse decimal from '\(s)'"

//    case .decode: return "Error in decoding into Unicode"
//    case .lineCont: return "Unexpected characters after a line continuation"
//    case .badSingle: return "Ill-formed single statement input"
    }
  }
}
