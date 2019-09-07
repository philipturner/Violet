// This file was auto-generated by Elsa from 'opcodes.letitgo'
// using 'code' command.
// DO NOT EDIT!

import Foundation
import Core

// swiftlint:disable superfluous_disable_command
// swiftlint:disable type_body_length
// swiftlint:disable line_length
// swiftlint:disable file_length
// swiftlint:disable trailing_newline
// swiftlint:disable vertical_whitespace_closing_braces

public enum VarNum {
  case notImplemented

}

public enum Item {
  case notImplemented

}

public enum Delta {
  case notImplemented

}

public enum Target {
  case notImplemented

}

public enum Constant {
  case `true`
  case `false`
  case none
  case ellipsis
  case integer(BigInt)
  case float(Double)
  case complex(real: Double, imag: Double)
  case string(String)
  case bytes(Data)
  case code(CodeObject)
  case tuple([Constant])

  public var isInteger: Bool {
    if case .integer = self { return true }
    return false
  }

  public var isFloat: Bool {
    if case .float = self { return true }
    return false
  }

  public var isComplex: Bool {
    if case .complex = self { return true }
    return false
  }

  public var isString: Bool {
    if case .string = self { return true }
    return false
  }

  public var isBytes: Bool {
    if case .bytes = self { return true }
    return false
  }

  public var isCode: Bool {
    if case .code = self { return true }
    return false
  }

  public var isTuple: Bool {
    if case .tuple = self { return true }
    return false
  }

}

public enum StringConversion {
  case none
  case str
  case repr
  case ascii

}

public enum ComparisonOpcode {
  /// True when two operands are equal.
  case equal
  /// True when two operands are not equal.
  case notEqual
  /// True when left operand is less than the value of right operand.
  case less
  /// True when left operand is less than or equal to the value of right operand.
  case lessEqual
  /// True when left operand is greater than the value of right operand.
  case greater
  /// True when left operand is greater than or equal to the value of right operand.
  case greaterEqual
  /// True when x and y are the same object.
  case `is`
  /// Negation of `x is y`.
  case isNot
  /// True when x is a member of s.
  case `in`
  /// Negation of `x in s`
  case notIn

}

public enum SliceArg {
  case lowerUpper
  case lowerUpperStep

}

public enum RaiseArg {
  /// Re-raise previous exception.
  /// CPython 0.
  case reRaise
  /// Raise exception instance or type at TOS
  /// CPython 1.
  case exceptionOnly
  /// Raise exception instance or type at TOS1 with Cause set to TOS
  /// CPython 2.
  case exceptionAndCause

}

public enum Instruction {
  /// Do nothing code.
  case nop
  /// Removes the top-of-stack (TOS) item.
  case popTop
  /// Swaps the two top-most stack items.
  case rotTwo
  /// Lifts second and third stack item one position up,
  /// moves top down to position three.
  case rotThree
  /// Duplicates the reference on top of the stack.
  case dupTop
  /// Duplicates the two references on top of the stack,
  /// leaving them in the same order.
  case dupTopTwo
  /// Implements `TOS = +TOS`.
  case unaryPositive
  /// Implements `TOS = -TOS`.
  case unaryNegative
  /// Implements `TOS = not TOS`.
  case unaryNot
  /// Implements `TOS = ~TOS`.
  case unaryInvert
  /// Implements `TOS = TOS1 ** TOS`.
  case binaryPower
  /// Implements `TOS = TOS1 * TOS`.
  case binaryMultiply
  /// Implements `TOS = TOS1 @ TOS`.
  case binaryMatrixMultiply
  /// Implements `TOS = TOS1 // TOS`.
  case binaryFloorDivide
  /// Implements `TOS = TOS1 / TOS`.
  case binaryTrueDivide
  /// Implements `TOS = TOS1 % TOS`.
  case binaryModulo
  /// Implements `TOS = TOS1 + TOS`.
  case binaryAdd
  /// Implements `TOS = TOS1 - TOS`.
  case binarySubtract
  /// Implements `TOS = TOS1 << TOS`.
  case binaryLShift
  /// Implements `TOS = TOS1 >> TOS`.
  case binaryRShift
  /// Implements `TOS = TOS1 & TOS`.
  case binaryAnd
  /// Implements `TOS = TOS1 ^ TOS`.
  case binaryXor
  /// Implements `TOS = TOS1 | TOS`.
  case binaryOr
  /// Implements in-place TOS = TOS1 ** TOS.
  case inplacePower
  /// Implements in-place TOS = TOS1 * TOS.
  case inplaceMultiply
  /// Implements in-place TOS = TOS1 @ TOS.
  case inplaceMatrixMultiply
  /// Implements in-place TOS = TOS1 // TOS.
  case inplaceFloorDivide
  /// Implements in-place TOS = TOS1 / TOS.
  case inplaceTrueDivide
  /// Implements in-place TOS = TOS1 % TOS.
  case inplaceModulo
  /// Implements in-place TOS = TOS1 + TOS.
  case inplaceAdd
  /// Implements in-place TOS = TOS1 - TOS.
  case inplaceSubtract
  /// Implements in-place TOS = TOS1 << TOS.
  case inplaceLShift
  /// Implements in-place TOS = TOS1 >> TOS.
  case inplaceRShift
  /// Implements in-place TOS = TOS1 & TOS.
  case inplaceAnd
  /// Implements in-place TOS = TOS1 ^ TOS.
  case inplaceXor
  /// Implements in-place TOS = TOS1 | TOS.
  case inplaceOr
  /// Performs a `Boolean` operation.
  case compareOp(ComparisonOpcode)
  /// Implements `TOS = GetAwaitable(TOS)`.
  /// 
  /// `GetAwaitable(o)` returns:
  /// - `o` if `o` is a coroutine object
  /// - generator object with the `CoIterableCoroutine` flag
  /// - `o.Await`
  case getAwaitable
  /// Implements `TOS = TOS.AIter()`.
  case getAIter
  /// Implements `Push(GetAwaitable(TOS.ANext()))`.
  /// See `GetAwaitable` for details.
  case getANext
  /// Pops TOS and yields it from a generator.
  case yieldValue
  /// Pops TOS and delegates to it as a subiterator from a generator.
  case yieldFrom
  /// Implements the expression statement for the interactive mode.
  /// TOS is removed from the stack and printed.
  /// In non-interactive mode, an expression statement is terminated with PopTop.
  case printExpr
  /// Pushes a block for a loop onto the block stack.
  /// The block spans from the current instruction with a size of delta bytes.
  case setupLoop(Delta)
  /// TOS is an iterator. Call its `Next()` method.
  /// If this `yields` a new value, push it on the stack (leaving the iterator below it).
  /// If not then TOS is popped, and the byte code counter is incremented by delta.
  case forIter(Delta)
  /// Implements `TOS = iter(TOS)`.
  case getIter
  /// If TOS is a generator iterator or coroutine object then it is left as is.
  /// Otherwise, implements `TOS = iter(TOS)`.
  case getYieldFromIter
  /// Terminates a loop due to a break statement.
  case `break`
  /// Continues a loop due to a continue statement.
  /// `target` is the address to jump to (which should be a `ForIter` instruction).
  case `continue`(Target)
  /// Creates a tuple consuming `count` items from the stack,
  /// and pushes the resulting tuple onto the stack.
  case buildTuple(elementCount: UInt8)
  /// Creates a list consuming `count` items from the stack,
  /// and pushes the resulting list onto the stack.
  case buildList(elementCount: UInt8)
  /// Creates a set consuming `count` items from the stack,
  /// and pushes the resulting set onto the stack.
  case buildSet(elementCount: UInt8)
  /// Pushes a new dictionary object onto the stack.
  /// Pops 2 * count items so that the dictionary holds count entries:
  /// {..., TOS3: TOS2, TOS1: TOS}.
  case buildMap(elementCount: UInt8)
  /// The version of `BuildMap` specialized for constant keys.
  /// `elementCount` values are consumed from the stack.
  /// The top element on the stack contains a tuple of keys.
  case buildConstKeyMap(elementCount: UInt8)
  /// Calls `set.add(TOS1[-i], TOS)`. Container object remains on the stack.
  /// Used to implement set comprehensions.
  case setAdd(Item)
  /// Calls `list.append(TOS[-i], TOS)`. Container object remains on the stack.
  /// Used to implement list comprehensions.
  case listAppend(Item)
  /// Calls `dict.setitem(TOS1[-i], TOS, TOS1)`. Container object remains on the stack.
  /// Used to implement dict comprehensions.
  case mapAdd(Item)
  /// Pops count iterables from the stack, joins them in a single tuple,
  /// and pushes the result.
  /// Implements iterable unpacking in tuple displays `(*x, *y, *z)`.
  case buildTupleUnpack(elementCount: UInt8)
  /// This is similar to `BuildTupleUnpack`, but is used for `f(*x, *y, *z)` call syntax.
  /// The stack item at position count + 1 should be the corresponding callable `f`.
  case buildTupleUnpackWithCall(elementCount: UInt8)
  /// This is similar to `BuildTupleUnpack`, but pushes a list instead of tuple.
  /// Implements iterable unpacking in list displays `[*x, *y, *z]`.
  case buildListUnpack(elementCount: UInt8)
  /// This is similar to `BuildTupleUnpack`, but pushes a set instead of tuple.
  /// Implements iterable unpacking in set displays `{*x, *y, *z}`.
  case buildSetUnpack(elementCount: UInt8)
  /// Pops count mappings from the stack, merges them into a single dictionary,
  /// and pushes the result.
  /// Implements dictionary unpacking in dictionary displays `{**x, **y, **z}`.
  case buildMapUnpack(elementCount: UInt8)
  /// This is similar to `BuildMapUnpack`, but is used for `f(**x, **y, **z)` call syntax.
  /// The stack item at position count + 2 should be the corresponding callable `f`.
  case buildMapUnpackWithCall(elementCount: UInt8)
  /// Unpacks TOS into count individual values,
  /// which are put onto the stack right-to-left.
  case unpackSequence(elementCount: UInt8)
  /// Implements assignment with a starred target.
  /// 
  /// Unpacks an iterable in TOS into individual values, where the total number
  /// of values can be smaller than the number of items in the iterable:
  /// one of the new values will be a list of all leftover items.
  /// 
  /// The low byte of counts is the number of values before the list value,
  /// the high byte of counts the number of values after it.
  /// The resulting values are put onto the stack right-to-left.
  case unpackEx(elementCountBefore: UInt8)
  /// Pushes constant pointed by `index` onto the stack.
  case loadConst(index: UInt8)
  /// Implements `name = TOS`.
  case storeName(nameIndex: UInt8)
  /// Pushes the value associated with `name` onto the stack.
  case loadName(nameIndex: UInt8)
  /// Implements `del name`.
  case deleteName(nameIndex: UInt8)
  /// Implements `TOS.name = TOS1`.
  case storeAttribute(nameIndex: UInt8)
  /// Replaces TOS with `getAttr(TOS, name)`.
  case loadAttribute(nameIndex: UInt8)
  /// Implements `del TOS.name`.
  case deleteAttribute(nameIndex: UInt8)
  /// Implements `TOS = TOS1[TOS]`.
  case binarySubscript
  /// Implements `TOS1[TOS] = TOS2`.
  case storeSubscript
  /// Implements `del TOS1[TOS]`.
  case deleteSubscript
  /// Works as StoreName, but stores the name as a global.
  case storeGlobal(nameIndex: UInt8)
  /// Loads the global named `name` onto the stack.
  case loadGlobal(nameIndex: UInt8)
  /// Works as DeleteName, but deletes a global name.
  case deleteGlobal(nameIndex: UInt8)
  case loadFast(nameIndex: UInt8)
  case storeFast(nameIndex: UInt8)
  case deleteFast(nameIndex: UInt8)
  /// Loads the cell contained in slot i of the cell and free variable storage.
  /// Pushes a reference to the object the cell contains on the stack.
  case loadDeref(nameIndex: UInt8)
  /// Stores TOS into the cell contained in slot i of the cell and free variable storage.
  case storeDeref(nameIndex: UInt8)
  /// Empties the cell contained in slot i of the cell and free variable storage.
  /// Used by the del statement.
  case deleteDeref(nameIndex: UInt8)
  /// Much like `LoadDeref` but first checks the locals dictionary before consulting the cell.
  /// This is used for loading free variables in class bodies.
  case loadClassDeref(nameIndex: UInt8)
  /// Pushes a new function object on the stack.
  /// 
  /// From bottom to top, the consumed stack must consist of values
  /// if the argument carries a specified flag value
  /// - `0x01` - has tuple of default values for positional-only
  ///            and positional-or-keyword parameters in positional order
  /// - `0x02` - has dictionary of keyword-only parameters default values
  /// - `0x04` - has annotation dictionary
  /// - `0x08` - has tuple containing cells for free variables,
  ///            making a closure the code associated with the function (at TOS1)
  ///            the qualified name of the function (at TOS)
  case makeFunction(FunctionFlags)
  /// Calls a callable object with positional arguments.
  /// `argc` indicates the number of positional arguments.
  /// 
  /// Stack layout (1st item means TOS):
  /// - positional arguments, with the right-most argument on top
  /// - callable object to call.
  /// 
  /// It will:
  /// 1. pop all arguments and the callable object off the stack
  /// 2. call the callable object with those arguments
  /// 3. push the return value returned by the callable object
  /// - Note:
  /// This opcode is used only for calls with positional arguments!
  case callFunction(argumentCount: UInt8)
  /// Calls a callable object with positional (if any) and keyword arguments.
  /// `argc` indicates the total number of positional and keyword arguments.
  /// 
  /// Stack layout (1st item means TOS):
  /// - tuple of keyword argument names
  /// - keyword arguments in the order corresponding to the tuple
  /// - positional arguments, with the right-most parameter on top
  /// - callable object to call.
  /// 
  /// It will:
  /// 1. pop all arguments and the callable object off the stack
  /// 2. call the callable object with those arguments
  /// 3. push the return value returned by the callable object.
  case callFunctionKw(argumentCount: UInt8)
  /// Calls a callable object with variable set of positional and keyword arguments.
  /// 
  /// Stack layout (1st item means TOS):
  /// - (if `hasKeywordArguments` is set) mapping object containing keyword arguments
  /// - iterable object containing positional arguments and a callable object to call
  /// 
  /// `BuildmapUnpackWithCall` and `BuildTupleUnpackWithCall` can be used for
  /// merging multiple mapping objects and iterables containing arguments.
  /// 
  /// It will:
  /// 1. pop all arguments and the callable object off the stack
  /// 2. mapping object and iterable object are each “unpacked” and their
  /// contents is passed in as keyword and positional arguments respectively
  /// 3. call the callable object with those arguments
  /// 4. push the return value returned by the callable object
  case callFunctionEx(hasKeywordArguments: Bool)
  /// Returns with TOS to the caller of the function.
  case `return`
  /// Pushes `builtins.BuildClass()` onto the stack.
  /// It is later called by `CallFunction` to construct a class.
  case loadBuildClass
  /// Loads a method named `name` from TOS object.
  /// 
  /// TOS is popped and method and TOS are pushed when interpreter can call unbound method directly.
  /// TOS will be used as the first argument (self) by `CallMethod`.
  /// Otherwise, NULL and method is pushed (method is bound method or something else).
  case loadMethod(nameIndex: UInt8)
  /// Calls a method.
  /// `argc` is number of positional arguments.
  /// Keyword arguments are not supported.
  /// 
  /// This opcode is designed to be used with `LoadMethod`.
  /// Positional arguments are on top of the stack.
  /// Below them, two items described in `LoadMethod` on the stack.
  /// All of them are popped and return value is pushed.
  case callMethod(argumentCount: UInt8)
  /// Loads all symbols not starting with '_' directly from the module TOS
  /// to the local namespace.
  /// 
  /// The module is popped after loading all names.
  /// This opcode implements `from module import *`.
  case importStar
  /// Imports the module `name`.
  /// 
  /// TOS and TOS1 are popped and provide the `fromlist` and `level` arguments of `Import()`.
  /// The module object is pushed onto the stack.
  /// The current namespace is not affected: for a proper import statement,
  /// a subsequent StoreFast instruction modifies the namespace.
  case importName(nameIndex: UInt8)
  /// Loads the attribute `name` from the module found in TOS.
  /// 
  /// The resulting object is pushed onto the stack,
  /// to be subsequently stored by a `StoreFast` instruction.
  case importFrom(nameIndex: UInt8)
  /// Removes one block from the block stack.
  /// The popped block must be an exception handler block,
  /// as implicitly created when entering an except handler.
  /// In addition to popping extraneous values from the frame stack,
  /// the last three popped values are used to restore the exception state.
  case popExcept
  /// Terminates a finally clause.
  /// The interpreter recalls whether the exception has to be re-raised,
  /// or whether the function returns, and continues with the outer-next block.
  case endFinally
  /// Pushes a try block from a try-except clause onto the block stack.
  /// `delta` points to the first except block.
  case setupExcept(Delta)
  /// Pushes a try block from a try-except clause onto the block stack.
  /// `delta` points to the finally block.
  case setupFinally(Delta)
  /// Raises an exception using one of the 3 forms of the raise statement,
  /// depending on the value of argc:
  /// - 0: raise (re-raise previous exception)
  /// - 1: raise TOS (raise exception instance or type at TOS)
  /// - 2: raise TOS1 from TOS (raise exception instance or type at TOS1 with Cause set to TOS)
  case raiseVarargs(RaiseArg)
  /// This opcode performs several operations before a `with` block starts.
  /// 
  /// It does following operations:
  /// 1.loads `Exit()` from the context manager and pushes it onto the stack for later use by `WithCleanup`.
  /// 2. calls `Enter()`
  /// 3. block pointing to `delta` is pushed.
  /// 4. the result of calling the enter method is pushed onto the stack.
  /// 
  /// The next opcode will either ignore it (`PopTop`),
  /// or store it in variable (StoreFast, StoreName, or UnpackSequence).
  case setupWith(Delta)
  /// Cleans up the stack when a `with` statement block exits.
  /// 
  /// TOS is the context manager’s `__exit__()` bound method.
  /// Below TOS are 1–3 values indicating how/why the finally clause was entered:
  /// - `SECOND = None`
  /// - `(SECOND, THIRD) = (WHY_{RETURN,CONTINUE}), retval`
  /// - `SECOND = WHY_*; no retval below it`
  /// - `(SECOND, THIRD, FOURTH) = exc_info()`
  /// In the last case, `TOS(SECOND, THIRD, FOURTH)` is called,
  /// otherwise `TOS(None, None, None)`.
  /// Pushes `SECOND` and result of the call to the stack.
  case withCleanupStart
  /// Pops exception type and result of ‘exit’ function call from the stack.
  /// 
  /// If the stack represents an exception, and the function call returns a ‘true’ value,
  /// this information is “zapped” and replaced with a single WhySilenced to prevent EndFinally from re-raising the exception.
  /// (But non-local gotos will still be resumed.)
  case withCleanupFinish
  /// Resolves `AEnter` and `AExit` from the object on top of the stack.
  /// Pushes `AExit` and result of `AEnter()` to the stack.
  case beforeAsyncWith
  /// Creates a new frame object.
  case setupAsyncWith
  /// Set bytecode counter to target.
  case jumpAbsolute(labelIndex: UInt8)
  /// If TOS is true, sets the bytecode counter to target. TOS is popped.
  case popJumpIfTrue(labelIndex: UInt8)
  /// If TOS is false, sets the bytecode counter to target. TOS is popped.
  case popJumpIfFalse(labelIndex: UInt8)
  /// If TOS is true, sets the bytecode counter to target and leaves TOS on the stack.
  /// Otherwise (TOS is false), TOS is popped.
  case jumpIfTrueOrPop(labelIndex: UInt8)
  /// If TOS is false, sets the bytecode counter to target and leaves TOS on the stack.
  /// Otherwise (TOS is true), TOS is popped.
  case jumpIfFalseOrPop(labelIndex: UInt8)
  /// Used for implementing formatted literal strings (f-strings).
  /// (And yes, Swift will pack both payloads in single byte).
  case formatValue(conversion: StringConversion, hasFormat: Bool)
  /// Concatenates `count` strings from the stack
  /// and pushes the resulting string onto the stack.
  case buildString(UInt8)
  /// Prefixes any opcode which has an argument too big to fit into the default one byte.
  /// 
  /// `ext` holds an additional byte which act as higher bits in the argument.
  /// For each opcode, at most three prefixal `ExtendedArg` are allowed,
  /// forming an argument from two-byte to four-byte.
  case extendedArg(UInt8)
  /// Checks whether Annotations is defined in locals(), if not it is set up to an empty dict.
  /// This opcode is only emitted if a class or module body contains variable annotations statically.
  case setupAnnotations
  /// Removes one block from the block stack.
  /// Per frame, there is a stack of blocks, denoting nested loops, try statements, and such.
  case popBlock
  /// Pushes a reference to the cell contained in slot 'i'
  /// of the 'cell' or 'free' variable storage.
  /// If 'i' < cellVars.count: name of the variable is cellVars[i].
  /// otherwise:               name is freeVars[i - cellVars.count].
  case loadClosure(cellOrFreeIndex: UInt8)
  /// Pushes a slice object on the stack.
  case buildSlice(SliceArg)

  public var isCompareOp: Bool {
    if case .compareOp = self { return true }
    return false
  }

  public var isSetupLoop: Bool {
    if case .setupLoop = self { return true }
    return false
  }

  public var isForIter: Bool {
    if case .forIter = self { return true }
    return false
  }

  public var isContinue: Bool {
    if case .continue = self { return true }
    return false
  }

  public var isBuildTuple: Bool {
    if case .buildTuple = self { return true }
    return false
  }

  public var isBuildList: Bool {
    if case .buildList = self { return true }
    return false
  }

  public var isBuildSet: Bool {
    if case .buildSet = self { return true }
    return false
  }

  public var isBuildMap: Bool {
    if case .buildMap = self { return true }
    return false
  }

  public var isBuildConstKeyMap: Bool {
    if case .buildConstKeyMap = self { return true }
    return false
  }

  public var isSetAdd: Bool {
    if case .setAdd = self { return true }
    return false
  }

  public var isListAppend: Bool {
    if case .listAppend = self { return true }
    return false
  }

  public var isMapAdd: Bool {
    if case .mapAdd = self { return true }
    return false
  }

  public var isBuildTupleUnpack: Bool {
    if case .buildTupleUnpack = self { return true }
    return false
  }

  public var isBuildTupleUnpackWithCall: Bool {
    if case .buildTupleUnpackWithCall = self { return true }
    return false
  }

  public var isBuildListUnpack: Bool {
    if case .buildListUnpack = self { return true }
    return false
  }

  public var isBuildSetUnpack: Bool {
    if case .buildSetUnpack = self { return true }
    return false
  }

  public var isBuildMapUnpack: Bool {
    if case .buildMapUnpack = self { return true }
    return false
  }

  public var isBuildMapUnpackWithCall: Bool {
    if case .buildMapUnpackWithCall = self { return true }
    return false
  }

  public var isUnpackSequence: Bool {
    if case .unpackSequence = self { return true }
    return false
  }

  public var isUnpackEx: Bool {
    if case .unpackEx = self { return true }
    return false
  }

  public var isLoadConst: Bool {
    if case .loadConst = self { return true }
    return false
  }

  public var isStoreName: Bool {
    if case .storeName = self { return true }
    return false
  }

  public var isLoadName: Bool {
    if case .loadName = self { return true }
    return false
  }

  public var isDeleteName: Bool {
    if case .deleteName = self { return true }
    return false
  }

  public var isStoreAttribute: Bool {
    if case .storeAttribute = self { return true }
    return false
  }

  public var isLoadAttribute: Bool {
    if case .loadAttribute = self { return true }
    return false
  }

  public var isDeleteAttribute: Bool {
    if case .deleteAttribute = self { return true }
    return false
  }

  public var isStoreGlobal: Bool {
    if case .storeGlobal = self { return true }
    return false
  }

  public var isLoadGlobal: Bool {
    if case .loadGlobal = self { return true }
    return false
  }

  public var isDeleteGlobal: Bool {
    if case .deleteGlobal = self { return true }
    return false
  }

  public var isLoadFast: Bool {
    if case .loadFast = self { return true }
    return false
  }

  public var isStoreFast: Bool {
    if case .storeFast = self { return true }
    return false
  }

  public var isDeleteFast: Bool {
    if case .deleteFast = self { return true }
    return false
  }

  public var isLoadDeref: Bool {
    if case .loadDeref = self { return true }
    return false
  }

  public var isStoreDeref: Bool {
    if case .storeDeref = self { return true }
    return false
  }

  public var isDeleteDeref: Bool {
    if case .deleteDeref = self { return true }
    return false
  }

  public var isLoadClassDeref: Bool {
    if case .loadClassDeref = self { return true }
    return false
  }

  public var isMakeFunction: Bool {
    if case .makeFunction = self { return true }
    return false
  }

  public var isCallFunction: Bool {
    if case .callFunction = self { return true }
    return false
  }

  public var isCallFunctionKw: Bool {
    if case .callFunctionKw = self { return true }
    return false
  }

  public var isCallFunctionEx: Bool {
    if case .callFunctionEx = self { return true }
    return false
  }

  public var isLoadMethod: Bool {
    if case .loadMethod = self { return true }
    return false
  }

  public var isCallMethod: Bool {
    if case .callMethod = self { return true }
    return false
  }

  public var isImportName: Bool {
    if case .importName = self { return true }
    return false
  }

  public var isImportFrom: Bool {
    if case .importFrom = self { return true }
    return false
  }

  public var isSetupExcept: Bool {
    if case .setupExcept = self { return true }
    return false
  }

  public var isSetupFinally: Bool {
    if case .setupFinally = self { return true }
    return false
  }

  public var isRaiseVarargs: Bool {
    if case .raiseVarargs = self { return true }
    return false
  }

  public var isSetupWith: Bool {
    if case .setupWith = self { return true }
    return false
  }

  public var isJumpAbsolute: Bool {
    if case .jumpAbsolute = self { return true }
    return false
  }

  public var isPopJumpIfTrue: Bool {
    if case .popJumpIfTrue = self { return true }
    return false
  }

  public var isPopJumpIfFalse: Bool {
    if case .popJumpIfFalse = self { return true }
    return false
  }

  public var isJumpIfTrueOrPop: Bool {
    if case .jumpIfTrueOrPop = self { return true }
    return false
  }

  public var isJumpIfFalseOrPop: Bool {
    if case .jumpIfFalseOrPop = self { return true }
    return false
  }

  public var isFormatValue: Bool {
    if case .formatValue = self { return true }
    return false
  }

  public var isBuildString: Bool {
    if case .buildString = self { return true }
    return false
  }

  public var isExtendedArg: Bool {
    if case .extendedArg = self { return true }
    return false
  }

  public var isLoadClosure: Bool {
    if case .loadClosure = self { return true }
    return false
  }

  public var isBuildSlice: Bool {
    if case .buildSlice = self { return true }
    return false
  }

}

