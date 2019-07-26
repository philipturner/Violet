// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// swiftlint:disable force_try

import Foundation

let elsaDir = URL(fileURLWithPath: #file).deletingLastPathComponent()
let sourceFile = elsaDir.appendingPathComponent("ast.letitgo", isDirectory: false)
let source = try! String(contentsOf: sourceFile, encoding: .utf8)

let parserDir = elsaDir.deletingLastPathComponent().appendingPathComponent("Parser")
let targetFile = parserDir.appendingPathComponent("AST.swift")

freopen(targetFile.path, "w", stdout)
defer { fclose(stdout) }

var lexer = Lexer(source: source)
//lexer.dumpTokens()
var parser = Parser(lexer: lexer)
let entities = parser.parse()

emitHeader(sourceFile: sourceFile, command: "ast")
emitCode(entities: entities)
