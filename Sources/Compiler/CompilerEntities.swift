import Core
import Parser
import Bytecode

// TODO: Do something with this
internal enum SpecialIdentifiers {
  /// Name of the AST root scope
  internal static let top = "top"

  /// Name of the lambda scope
  internal static let lambda = "lambda"

  /// Name of the list comprehension scope
  internal static let listcomp = "listcomp"
  /// Name of the set comprehension scope
  internal static let setcomp  = "setcomp"
  /// Name of the dict comprehension scope
  internal static let dictcomp = "dictcomp"
  /// Name of the generator expression scope
  internal static let genexpr  = "genexpr"

  internal static let __class__ = "__class__"
  internal static let __annotations__ = "__annotations__"
  internal static let __future__ = "__future__"

  internal static let assertionError = "AssertionError"
  internal static let `return` = "return"
}

public enum ExpressionContext {
  case store
  case load
  case del
}

internal enum BlockType {
  case loop(startLabel: Label)
  case except
  case finallyTry
  case finallyEnd

  internal var isLoop: Bool {
    switch self {
    case .loop: return true
    case .except, .finallyTry, .finallyEnd: return false
    }
  }
}

/// The following items change on entry and exit of scope.
/// They must be saved and restored when returning to a scope.
internal final class CompilerUnit {

  internal let scope: SymbolScope
  internal let codeObject: CodeObject

  /// Name of the class that we are currently filling (if any).
  /// Mostly used for mangling.
  internal let className: String?

  internal init(codeObject: CodeObject,
                scope:      SymbolScope,
                className:  String?) {
    self.codeObject = codeObject
    self.scope = scope
    self.className = className
  }
}
