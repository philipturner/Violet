private let argNames: [String: String] = [
  "AST":                "ast",
  "StatementKind":      "stmt",
  "ExpressionKind":     "expr",
  "UnaryOperator":      "op",
  "BooleanOperator":    "op",
  "BinaryOperator":     "op",
  "ComparisonOperator": "op",
  "DictionaryElement":  "element",
  "StringGroup":        "group",
  "ConversionFlag":     "flag",
  "SliceKind":          "slice",
  "Vararg":             "arg",

  "Statement":         "stmt",
  "Alias":             "alias",
  "WithItem":          "item",
  "ExceptHandler":     "handler",
  "Expression":        "expr",
  "ComparisonElement": "stmt",
  "Slice":             "slice",
  "Comprehension":     "comprehension",
  "Arguments":         "args",
  "Arg":               "arg",
  "Keyword":           "keyword"
]

internal func emitPass(entities: [Entity]) {
  print("import Foundation")
  print("import Core")
  print("import Lexer")
  print()

  print("// swiftlint:disable function_body_length")
  print("// swiftlint:disable cyclomatic_complexity")
  print("// swiftlint:disable file_length")
  print()

  print("public class ASTValidationPass: ASTPass {")
  print()
  print("  public typealias PassResult = Void")
  print()

  for entity in entities {
    switch entity {
    case let .enum(e): emitEnum(e)
    case let .struct(s): emitStruct(s)
    }
  }

  print("}")
}

private func emitEnum(_ enumDef: EnumDef) {
  let argName = argNames[enumDef.name] ?? camelCase(enumDef.name)
  let accessModifier = enumDef.name == "AST" ? "public" : "private"
  print("  \(accessModifier) func visit(_ \(argName): \(enumDef.name)) throws {")

  print("    switch \(argName) {")
  for caseDef in enumDef.cases {
    if caseDef.properties.isEmpty {
      print("    case .\(caseDef.name):")
      print("      break")
      print()
    } else {
      let properties = caseDef.properties
        .enumerated()
        .map {
          $0.element.name ??
          argNames[$0.element.type] ??
          (caseDef.properties.count == 1 ? "value" : "value\($0.offset)")
        }
        .map(escaped)
        .joined(", ")

      print("    case let .\(caseDef.name)(\(properties)):")
      print("      break")
      print()
    }
  }
  print("    }")

  print("  }")
  print()
}

private func emitStruct(_ structDef: StructDef) {
  let argName = argNames[structDef.name] ?? camelCase(structDef.name)
  print("  private func visit(_ \(argName): \(structDef.name)) throws {")
  print("  }")
  print()
}
