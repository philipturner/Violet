import Foundation

// MARK: - Parse

internal func parse(url: URL) -> [Entity] {
  do {
    let content = try String(contentsOf: url, encoding: .utf8)
    let lexer = Lexer(source: content)
    let parser = Parser(lexer: lexer)
    return parser.parse()
  } catch {
    printErr("Unable to read '\(url)'")
    exit(EXIT_FAILURE)
  }
}

// MARK: - Streams

internal func withRedirectedStandardOutput(to file: URL, f: () -> Void) {
  freopen(file.path, "w", stdout)
  defer { fclose(stdout) }

  f()
}

internal func printErr(_ msg: String) {
  guard let data = msg.data(using: .utf8) else { return }
  FileHandle.standardError.write(data)
}

// MARK: - Join

extension Array where Element == String {

  /// The same as `self.joined(separator:_)`, but less typing.
  internal func joined(_ separator: String = "") -> String {
    return self.joined(separator: separator)
  }
}

// MARK: - Header

internal func createHeader(inputFile: URL) -> String {
  return """
  // This file was auto-generated by Elsa from '\(inputFile.lastPathComponent).'
  // DO NOT EDIT!

  """
}

// MARK: - Doc

func printDoc(_ doc: String?, indent: String) {
  guard let doc = doc else { return }

  let split = doc.split(separator: "\n",
                        maxSplits: .max,
                        omittingEmptySubsequences: false)

  for line in split {
    let doc = line.isEmpty ? "///" : "/// " + line
    print("\(indent)\(doc)")
  }
}

// MARK: - String utils

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

private let vowels = Set<String>(["a", "e", "i", "o", "u"])

internal func isVowel(_ c: String) -> Bool {
  return vowels.contains(c)
}

// Not ultra-correct, but better than nothing.
internal func getArticle(_ s: String) -> String {
  guard let first = s.first else {
    return ""
  }

  return isVowel(String(first)) ? "an" : "a"
}

// MARK: - has subclass

func hasSubclass(class def: ClassDef, in other: [Entity]) -> Bool {
  let className = def.name

  for entity in other {
    switch entity {
    case let .class(c):
      if c.bases.contains(className) {
        return true
      }
    case .enum,
         .struct:
      break
    }
  }

  return false
}
