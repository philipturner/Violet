import Foundation

extension Array where Element == String {

  /// The same as `self.joined(separator:_)`, but less typing.
  internal func joined(_ separator: String = "") -> String {
    return self.joined(separator: separator)
  }
}

internal func parenthesize<T>(_ value: T) -> String {
  return "(" + String(describing: value) + ")"
}

internal func pascalCase(_ s: String) -> String {
  let first = s.first?.uppercased() ?? ""
  return first + s.dropFirst()
}

internal func camelCase(_ s: String) -> String {
  let first = s.first?.lowercased() ?? ""
  return first + s.dropFirst()
}

internal func repeating(_ s: String, count: Int) -> String {
  return String(repeating: s, count: count)
}

/// https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html
private let swiftKeywords = Set<String>([
  "associatedtype", "class", "deinit", "enum", "extension", "fileprivate",
  "func", "import", "init", "inout", "internal", "let", "open", "operator",
  "private", "protocol", "public", "static", "struct", "subscript", "typealias",
  "var,", "break", "case", "continue", "default", "defer", "do", "else",
  "fallthrough", "for", "guard", "if", "in", "repeat", "return", "switch",
  "where", "while", "as", "Any", "catch", "false", "is", "nil", "rethrows",
  "super", "self", "Self", "throw", "throws", "true", "try"
])

/// Escape Swift keyword
internal func escaped(_ name: String) -> String {
  return swiftKeywords.contains(name) ? "`\(name)`" : name
}
