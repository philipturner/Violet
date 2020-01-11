import Foundation
import Bytecode
import Objects

// In CPython:
// Python -> ceval.c

// swiftlint:disable file_length

/// Result of running of a single instruction.
internal enum InstructionResult {
  /// Instruction executed succesfully.
  case ok
  /// Instruction requested a `return` from a current frame.
  case `return`
  /// Builtin mudule raised an error.
  case builtinError(PyErrorEnum)
  /// User raised error using `raise` instruction.
  case userError
}

internal class Frame {

  /// Code to run.
  internal let code: CodeObject
  /// Parent frame.
  internal let parent: Frame?

  /// Python state.
  internal let context: PyContext
  /// Built-in functions.
  internal var builtins: Builtins {
    return self.context.builtins
  }

  /// The main data frame of the stack machine.
  internal var stack = ObjectStack()

  /// Local variables.
  internal var localSymbols: Attributes
  /// Global variables.
  internal var globalSymbols: Attributes
  /// Builtin symbols (most of the time `self.builtins.__dict__`).
  internal var builtinSymbols: Attributes
  /// Free variables (variables from upper scopes).
  internal lazy var freeVariables = [String: PyObject]()
  /// Function args and local function variables.
  ///
  /// We could use `self.localSymbols` but that would be `O(1)` with
  /// massive constants (array is like dictionary but with lower constants).
  internal lazy var fastLocals = [PyObject?](repeating: nil,
                                             count: code.varNames.count)

  #warning("Remove this")
  internal var standardOutput: FileHandle {
    return FileHandle.standardOutput
  }

  /// Index of the next instruction to run.
  internal var nextInstructionIndex = 0

  /// PyFrameObject* _Py_HOT_FUNCTION
  /// _PyFrame_New_NoTrack(PyThreadState *tstate, PyCodeObject *code,
  internal init(context: PyContext,
                code: CodeObject,
                locals: Attributes,
                globals: Attributes,
                parent: Frame?) {
    self.code = code
    self.parent = parent
    self.context = context
    self.localSymbols = locals
    self.globalSymbols = globals
    self.builtinSymbols = Frame.getBuiltins(context: context,
                                            globals: globals,
                                            parent: parent)
  }

  private static func getBuiltins(context: PyContext,
                                  globals: Attributes,
                                  parent: Frame?) -> Attributes {

    if parent == nil || parent?.globalSymbols !== globals {
      if let module = globals.get(key: "__builtins__") as? PyModule {
        return context.builtins.getDict(module)
      }
    }

    let module = context.builtinsModule
    return context.builtins.getDict(module)
  }

  // MARK: - Run

  internal func run() {
    while self.nextInstructionIndex != self.code.instructions.endIndex {
      _ = self.executeInstruction()
    }
  }

  private func fetchInstruction() -> Instruction {
    assert(self.nextInstructionIndex >= 0)
    assert(self.nextInstructionIndex < self.code.instructions.count)

    let instr = self.code.instructions[self.nextInstructionIndex]
    self.nextInstructionIndex += 1
    return instr
  }

  // swiftlint:disable:next function_body_length
  private func executeInstruction(extendedArg: Int = 0) -> InstructionResult {
    let instruction = self.fetchInstruction()

    // According to CPython doing single switch will trash our jump prediction
    // (unles you have the same opcode multiple times in a row).
    // It is a valid concern, but we don't care about this (for now).
    switch instruction {
    case .nop:
      return .ok
    case .popTop:
      return self.popTop()
    case .rotTwo:
      return self.rotTwo()
    case .rotThree:
      return self.rotThree()
    case .dupTop:
      return self.dupTop()
    case .dupTopTwo:
      return self.dupTopTwo()
    case .unaryPositive:
      return self.unaryPositive()
    case .unaryNegative:
      return self.unaryNegative()
    case .unaryNot:
      return self.unaryNot()
    case .unaryInvert:
      return self.unaryInvert()
    case .binaryPower:
      return self.binaryPower()
    case .binaryMultiply:
      return self.binaryMultiply()
    case .binaryMatrixMultiply:
      return self.binaryMatrixMultiply()
    case .binaryFloorDivide:
      return self.binaryFloorDivide()
    case .binaryTrueDivide:
      return self.binaryTrueDivide()
    case .binaryModulo:
      return self.binaryModulo()
    case .binaryAdd:
      return self.binaryAdd()
    case .binarySubtract:
      return self.binarySubtract()
    case .binaryLShift:
      return self.binaryLShift()
    case .binaryRShift:
      return self.binaryRShift()
    case .binaryAnd:
      return self.binaryAnd()
    case .binaryXor:
      return self.binaryXor()
    case .binaryOr:
      return self.binaryOr()
    case .inplacePower:
      return self.inplacePower()
    case .inplaceMultiply:
      return self.inplaceMultiply()
    case .inplaceMatrixMultiply:
      return self.inplaceMatrixMultiply()
    case .inplaceFloorDivide:
      return self.inplaceFloorDivide()
    case .inplaceTrueDivide:
      return self.inplaceTrueDivide()
    case .inplaceModulo:
      return self.inplaceModulo()
    case .inplaceAdd:
      return self.inplaceAdd()
    case .inplaceSubtract:
      return self.inplaceSubtract()
    case .inplaceLShift:
      return self.inplaceLShift()
    case .inplaceRShift:
      return self.inplaceRShift()
    case .inplaceAnd:
      return self.inplaceAnd()
    case .inplaceXor:
      return self.inplaceXor()
    case .inplaceOr:
      return self.inplaceOr()
    case let .compareOp(comparison):
      assert(extendedArg == 0)
      return self.compareOp(comparison: comparison)
    case .getAwaitable:
      return self.getAwaitable()
    case .getAIter:
      return self.getAIter()
    case .getANext:
      return self.getANext()
    case .yieldValue:
      return self.yieldValue()
    case .yieldFrom:
      return self.yieldFrom()
    case .printExpr:
      return self.printExpr()
    case let .setupLoop(loopEndLabel):
      return self.setupLoop(loopEndLabel: extendedArg + Int(loopEndLabel))
    case let .forIter(ifEmptyLabel):
      return self.forIter(ifEmptyLabel: extendedArg + Int(ifEmptyLabel))
    case .getIter:
      return self.getIter()
    case .getYieldFromIter:
      return self.getYieldFromIter()
    case .`break`:
      return self.doBreak()
    case let .buildTuple(elementCount):
      return self.buildTuple(elementCount: extendedArg + Int(elementCount))
    case let .buildList(elementCount):
      return self.buildList(elementCount: extendedArg + Int(elementCount))
    case let .buildSet(elementCount):
      return self.buildSet(elementCount: extendedArg + Int(elementCount))
    case let .buildMap(elementCount):
      return self.buildMap(elementCount: extendedArg + Int(elementCount))
    case let .buildConstKeyMap(elementCount):
      return self.buildConstKeyMap(elementCount: extendedArg + Int(elementCount))
    case let .setAdd(value):
      return self.setAdd(value: extendedArg + Int(value))
    case let .listAppend(value):
      return self.listAdd(value: extendedArg + Int(value))
    case let .mapAdd(value):
      return self.mapAdd(value: extendedArg + Int(value))
    case let .buildTupleUnpack(elementCount):
      return self.buildTupleUnpack(elementCount: extendedArg + Int(elementCount))
    case let .buildTupleUnpackWithCall(elementCount):
      return self.buildTupleUnpackWithCall(elementCount: extendedArg + Int(elementCount))
    case let .buildListUnpack(elementCount):
      return self.buildListUnpack(elementCount: extendedArg + Int(elementCount))
    case let .buildSetUnpack(elementCount):
      return self.buildSetUnpack(elementCount: extendedArg + Int(elementCount))
    case let .buildMapUnpack(elementCount):
      return self.buildMapUnpack(elementCount: extendedArg + Int(elementCount))
    case let .buildMapUnpackWithCall(elementCount):
      return self.buildMapUnpackWithCall(elementCount: extendedArg + Int(elementCount))
    case let .unpackSequence(elementCount):
      return self.unpackSequence(elementCount: extendedArg + Int(elementCount))
    case let .unpackEx(elementCountBefore):
      return self.unpackEx(elementCountBefore: extendedArg + Int(elementCountBefore))
    case let .loadConst(index):
      return self.loadConst(index: extendedArg + Int(index))
    case let .storeName(nameIndex):
      return self.storeName(nameIndex: extendedArg + Int(nameIndex))
    case let .loadName(nameIndex):
      return self.loadName(nameIndex: extendedArg + Int(nameIndex))
    case let .deleteName(nameIndex):
      return self.deleteName(nameIndex: extendedArg + Int(nameIndex))
    case let .storeAttribute(nameIndex):
      return self.storeAttribute(nameIndex: extendedArg + Int(nameIndex))
    case let .loadAttribute(nameIndex):
      return self.loadAttribute(nameIndex: extendedArg + Int(nameIndex))
    case let .deleteAttribute(nameIndex):
      return self.deleteAttribute(nameIndex: extendedArg + Int(nameIndex))
    case .binarySubscript:
      return self.binarySubscript()
    case .storeSubscript:
      return self.storeSubscript()
    case .deleteSubscript:
      return self.deleteSubscript()
    case let .storeGlobal(nameIndex):
      return self.storeGlobal(nameIndex: extendedArg + Int(nameIndex))
    case let .loadGlobal(nameIndex):
      return self.loadGlobal(nameIndex: extendedArg + Int(nameIndex))
    case let .deleteGlobal(nameIndex):
      return self.deleteGlobal(nameIndex: extendedArg + Int(nameIndex))
    case let .loadFast(nameIndex):
      return self.loadFast(index: extendedArg + Int(nameIndex))
    case let .storeFast(nameIndex):
      return self.storeFast(index: extendedArg + Int(nameIndex))
    case let .deleteFast(nameIndex):
      return self.deleteFast(index: extendedArg + Int(nameIndex))
    case let .loadDeref(nameIndex):
      return self.loadDeref(nameIndex: extendedArg + Int(nameIndex))
    case let .storeDeref(nameIndex):
      return self.storeDeref(nameIndex: extendedArg + Int(nameIndex))
    case let .deleteDeref(nameIndex):
      return self.deleteDeref(nameIndex: extendedArg + Int(nameIndex))
    case let .loadClassDeref(nameIndex):
      return self.loadClassDeref(nameIndex: extendedArg + Int(nameIndex))
    case let .makeFunction(flags):
      assert(extendedArg == 0)
      return self.makeFunction(flags: flags)
    case let .callFunction(argumentCount):
      return self.callFunction(argumentCount: extendedArg + Int(argumentCount))
    case let .callFunctionKw(argumentCount):
      return self.callFunctionKw(argumentCount: extendedArg + Int(argumentCount))
    case let .callFunctionEx(hasKeywordArguments):
      assert(extendedArg == 0)
      return self.callFunctionEx(hasKeywordArguments: hasKeywordArguments)
    case .`return`:
      return self.doReturn()
    case .loadBuildClass:
      return self.loadBuildClass()
    case let .loadMethod(nameIndex):
      return self.loadMethod(nameIndex: extendedArg + Int(nameIndex))
    case let .callMethod(argumentCount):
      return self.callMethod(argumentCount: extendedArg + Int(argumentCount))
    case .importStar:
      return self.importStar()
    case let .importName(nameIndex):
      return self.importName(nameIndex: extendedArg + Int(nameIndex))
    case let .importFrom(nameIndex):
      return self.importFrom(nameIndex: extendedArg + Int(nameIndex))
    case .popExcept:
      return self.popExcept()
    case .endFinally:
      return self.endFinally()
    case let .setupExcept(firstExceptLabel):
      return self.setupExcept(firstExceptLabel: extendedArg + Int(firstExceptLabel))
    case let .setupFinally(finallyStartLabel):
      return self.setupFinally(finallyStartLabel: extendedArg + Int(finallyStartLabel))
    case let .raiseVarargs(arg):
      assert(extendedArg == 0)
      return self.raiseVarargs(arg: arg)
    case let .setupWith(afterBodyLabel):
      return self.setupWith(afterBodyLabel: extendedArg + Int(afterBodyLabel))
    case .withCleanupStart:
      return self.withCleanupStart()
    case .withCleanupFinish:
      return self.withCleanupFinish()
    case .beforeAsyncWith:
      return self.beforeAsyncWith()
    case .setupAsyncWith:
      return self.setupAsyncWith()
    case let .jumpAbsolute(labelIndex):
      return self.jumpAbsolute(labelIndex: extendedArg + Int(labelIndex))
    case let .popJumpIfTrue(labelIndex):
      return self.popJumpIfTrue(labelIndex: extendedArg + Int(labelIndex))
    case let .popJumpIfFalse(labelIndex):
      return self.popJumpIfFalse(labelIndex: extendedArg + Int(labelIndex))
    case let .jumpIfTrueOrPop(labelIndex):
      return self.jumpIfTrueOrPop(labelIndex: extendedArg + Int(labelIndex))
    case let .jumpIfFalseOrPop(labelIndex):
      return self.jumpIfFalseOrPop(labelIndex: extendedArg + Int(labelIndex))
    case let .formatValue(conversion, hasFormat):
      assert(extendedArg == 0)
      return self.formatValue(conversion: conversion, hasFormat: hasFormat)
    case let .buildString(value):
      return self.buildString(count: extendedArg + Int(value))
    case let .extendedArg(value):
      let arg = extendedArg << 8 | Int(value)
      return self.executeInstruction(extendedArg: arg)
    case .setupAnnotations:
      return self.setupAnnotations()
    case .popBlock:
      return self.popBlock()
    case let .loadClosure(cellOrFreeIndex):
      return self.loadClosure(cellOrFreeIndex: extendedArg + Int(cellOrFreeIndex))
    case let .buildSlice(arg):
      return self.buildSlice(arg: arg)
    }
  }
}
