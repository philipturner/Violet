import VioletCore

// swiftlint:disable line_length
// swiftlint:disable function_body_length
// swiftlint:disable trailing_comma
// swiftlint:disable vertical_whitespace_closing_braces
// swiftlint:disable file_length

// Please note that this file was automatically generated. DO NOT EDIT!
// The same goes for other files in 'Generated' directory.

// In CPython:
// Objects -> exceptions.c
// Lib->test->exception_hierarchy.txt <-- this is amazing
// https://docs.python.org/3.7/library/exceptions.html
// https://docs.python.org/3.7/c-api/exceptions.html

// Just like 'BuiltinTypes' this will be 2 phase init.
// See 'BuiltinTypes' for reasoning.
public final class BuiltinErrorTypes {

  // MARK: - Properties

  public let baseException: PyType
  public let systemExit: PyType
  public let keyboardInterrupt: PyType
  public let generatorExit: PyType
  public let exception: PyType
  public let stopIteration: PyType
  public let stopAsyncIteration: PyType
  public let arithmeticError: PyType
  public let floatingPointError: PyType
  public let overflowError: PyType
  public let zeroDivisionError: PyType
  public let assertionError: PyType
  public let attributeError: PyType
  public let bufferError: PyType
  public let eofError: PyType
  public let importError: PyType
  public let moduleNotFoundError: PyType
  public let lookupError: PyType
  public let indexError: PyType
  public let keyError: PyType
  public let memoryError: PyType
  public let nameError: PyType
  public let unboundLocalError: PyType
  public let osError: PyType
  public let blockingIOError: PyType
  public let childProcessError: PyType
  public let connectionError: PyType
  public let brokenPipeError: PyType
  public let connectionAbortedError: PyType
  public let connectionRefusedError: PyType
  public let connectionResetError: PyType
  public let fileExistsError: PyType
  public let fileNotFoundError: PyType
  public let interruptedError: PyType
  public let isADirectoryError: PyType
  public let notADirectoryError: PyType
  public let permissionError: PyType
  public let processLookupError: PyType
  public let timeoutError: PyType
  public let referenceError: PyType
  public let runtimeError: PyType
  public let notImplementedError: PyType
  public let recursionError: PyType
  public let syntaxError: PyType
  public let indentationError: PyType
  public let tabError: PyType
  public let systemError: PyType
  public let typeError: PyType
  public let valueError: PyType
  public let unicodeError: PyType
  public let unicodeDecodeError: PyType
  public let unicodeEncodeError: PyType
  public let unicodeTranslateError: PyType
  public let warning: PyType
  public let deprecationWarning: PyType
  public let pendingDeprecationWarning: PyType
  public let runtimeWarning: PyType
  public let syntaxWarning: PyType
  public let userWarning: PyType
  public let futureWarning: PyType
  public let importWarning: PyType
  public let unicodeWarning: PyType
  public let bytesWarning: PyType
  public let resourceWarning: PyType

  // MARK: - Stage 1 - init

  /// Init that will only initialize properties.
  internal init() {
    let types = Py.types
    self.baseException = PyType.initBuiltinType(name: "BaseException", type: types.type, base: types.object, layout: .PyBaseException)
    self.systemExit = PyType.initBuiltinType(name: "SystemExit", type: types.type, base: self.baseException, layout: .PySystemExit)
    self.keyboardInterrupt = PyType.initBuiltinType(name: "KeyboardInterrupt", type: types.type, base: self.baseException, layout: .PyKeyboardInterrupt)
    self.generatorExit = PyType.initBuiltinType(name: "GeneratorExit", type: types.type, base: self.baseException, layout: .PyGeneratorExit)
    self.exception = PyType.initBuiltinType(name: "Exception", type: types.type, base: self.baseException, layout: .PyException)
    self.stopIteration = PyType.initBuiltinType(name: "StopIteration", type: types.type, base: self.exception, layout: .PyStopIteration)
    self.stopAsyncIteration = PyType.initBuiltinType(name: "StopAsyncIteration", type: types.type, base: self.exception, layout: .PyStopAsyncIteration)
    self.arithmeticError = PyType.initBuiltinType(name: "ArithmeticError", type: types.type, base: self.exception, layout: .PyArithmeticError)
    self.floatingPointError = PyType.initBuiltinType(name: "FloatingPointError", type: types.type, base: self.arithmeticError, layout: .PyFloatingPointError)
    self.overflowError = PyType.initBuiltinType(name: "OverflowError", type: types.type, base: self.arithmeticError, layout: .PyOverflowError)
    self.zeroDivisionError = PyType.initBuiltinType(name: "ZeroDivisionError", type: types.type, base: self.arithmeticError, layout: .PyZeroDivisionError)
    self.assertionError = PyType.initBuiltinType(name: "AssertionError", type: types.type, base: self.exception, layout: .PyAssertionError)
    self.attributeError = PyType.initBuiltinType(name: "AttributeError", type: types.type, base: self.exception, layout: .PyAttributeError)
    self.bufferError = PyType.initBuiltinType(name: "BufferError", type: types.type, base: self.exception, layout: .PyBufferError)
    self.eofError = PyType.initBuiltinType(name: "EOFError", type: types.type, base: self.exception, layout: .PyEOFError)
    self.importError = PyType.initBuiltinType(name: "ImportError", type: types.type, base: self.exception, layout: .PyImportError)
    self.moduleNotFoundError = PyType.initBuiltinType(name: "ModuleNotFoundError", type: types.type, base: self.importError, layout: .PyModuleNotFoundError)
    self.lookupError = PyType.initBuiltinType(name: "LookupError", type: types.type, base: self.exception, layout: .PyLookupError)
    self.indexError = PyType.initBuiltinType(name: "IndexError", type: types.type, base: self.lookupError, layout: .PyIndexError)
    self.keyError = PyType.initBuiltinType(name: "KeyError", type: types.type, base: self.lookupError, layout: .PyKeyError)
    self.memoryError = PyType.initBuiltinType(name: "MemoryError", type: types.type, base: self.exception, layout: .PyMemoryError)
    self.nameError = PyType.initBuiltinType(name: "NameError", type: types.type, base: self.exception, layout: .PyNameError)
    self.unboundLocalError = PyType.initBuiltinType(name: "UnboundLocalError", type: types.type, base: self.nameError, layout: .PyUnboundLocalError)
    self.osError = PyType.initBuiltinType(name: "OSError", type: types.type, base: self.exception, layout: .PyOSError)
    self.blockingIOError = PyType.initBuiltinType(name: "BlockingIOError", type: types.type, base: self.osError, layout: .PyBlockingIOError)
    self.childProcessError = PyType.initBuiltinType(name: "ChildProcessError", type: types.type, base: self.osError, layout: .PyChildProcessError)
    self.connectionError = PyType.initBuiltinType(name: "ConnectionError", type: types.type, base: self.osError, layout: .PyConnectionError)
    self.brokenPipeError = PyType.initBuiltinType(name: "BrokenPipeError", type: types.type, base: self.connectionError, layout: .PyBrokenPipeError)
    self.connectionAbortedError = PyType.initBuiltinType(name: "ConnectionAbortedError", type: types.type, base: self.connectionError, layout: .PyConnectionAbortedError)
    self.connectionRefusedError = PyType.initBuiltinType(name: "ConnectionRefusedError", type: types.type, base: self.connectionError, layout: .PyConnectionRefusedError)
    self.connectionResetError = PyType.initBuiltinType(name: "ConnectionResetError", type: types.type, base: self.connectionError, layout: .PyConnectionResetError)
    self.fileExistsError = PyType.initBuiltinType(name: "FileExistsError", type: types.type, base: self.osError, layout: .PyFileExistsError)
    self.fileNotFoundError = PyType.initBuiltinType(name: "FileNotFoundError", type: types.type, base: self.osError, layout: .PyFileNotFoundError)
    self.interruptedError = PyType.initBuiltinType(name: "InterruptedError", type: types.type, base: self.osError, layout: .PyInterruptedError)
    self.isADirectoryError = PyType.initBuiltinType(name: "IsADirectoryError", type: types.type, base: self.osError, layout: .PyIsADirectoryError)
    self.notADirectoryError = PyType.initBuiltinType(name: "NotADirectoryError", type: types.type, base: self.osError, layout: .PyNotADirectoryError)
    self.permissionError = PyType.initBuiltinType(name: "PermissionError", type: types.type, base: self.osError, layout: .PyPermissionError)
    self.processLookupError = PyType.initBuiltinType(name: "ProcessLookupError", type: types.type, base: self.osError, layout: .PyProcessLookupError)
    self.timeoutError = PyType.initBuiltinType(name: "TimeoutError", type: types.type, base: self.osError, layout: .PyTimeoutError)
    self.referenceError = PyType.initBuiltinType(name: "ReferenceError", type: types.type, base: self.exception, layout: .PyReferenceError)
    self.runtimeError = PyType.initBuiltinType(name: "RuntimeError", type: types.type, base: self.exception, layout: .PyRuntimeError)
    self.notImplementedError = PyType.initBuiltinType(name: "NotImplementedError", type: types.type, base: self.runtimeError, layout: .PyNotImplementedError)
    self.recursionError = PyType.initBuiltinType(name: "RecursionError", type: types.type, base: self.runtimeError, layout: .PyRecursionError)
    self.syntaxError = PyType.initBuiltinType(name: "SyntaxError", type: types.type, base: self.exception, layout: .PySyntaxError)
    self.indentationError = PyType.initBuiltinType(name: "IndentationError", type: types.type, base: self.syntaxError, layout: .PyIndentationError)
    self.tabError = PyType.initBuiltinType(name: "TabError", type: types.type, base: self.indentationError, layout: .PyTabError)
    self.systemError = PyType.initBuiltinType(name: "SystemError", type: types.type, base: self.exception, layout: .PySystemError)
    self.typeError = PyType.initBuiltinType(name: "TypeError", type: types.type, base: self.exception, layout: .PyTypeError)
    self.valueError = PyType.initBuiltinType(name: "ValueError", type: types.type, base: self.exception, layout: .PyValueError)
    self.unicodeError = PyType.initBuiltinType(name: "UnicodeError", type: types.type, base: self.valueError, layout: .PyUnicodeError)
    self.unicodeDecodeError = PyType.initBuiltinType(name: "UnicodeDecodeError", type: types.type, base: self.unicodeError, layout: .PyUnicodeDecodeError)
    self.unicodeEncodeError = PyType.initBuiltinType(name: "UnicodeEncodeError", type: types.type, base: self.unicodeError, layout: .PyUnicodeEncodeError)
    self.unicodeTranslateError = PyType.initBuiltinType(name: "UnicodeTranslateError", type: types.type, base: self.unicodeError, layout: .PyUnicodeTranslateError)
    self.warning = PyType.initBuiltinType(name: "Warning", type: types.type, base: self.exception, layout: .PyWarning)
    self.deprecationWarning = PyType.initBuiltinType(name: "DeprecationWarning", type: types.type, base: self.warning, layout: .PyDeprecationWarning)
    self.pendingDeprecationWarning = PyType.initBuiltinType(name: "PendingDeprecationWarning", type: types.type, base: self.warning, layout: .PyPendingDeprecationWarning)
    self.runtimeWarning = PyType.initBuiltinType(name: "RuntimeWarning", type: types.type, base: self.warning, layout: .PyRuntimeWarning)
    self.syntaxWarning = PyType.initBuiltinType(name: "SyntaxWarning", type: types.type, base: self.warning, layout: .PySyntaxWarning)
    self.userWarning = PyType.initBuiltinType(name: "UserWarning", type: types.type, base: self.warning, layout: .PyUserWarning)
    self.futureWarning = PyType.initBuiltinType(name: "FutureWarning", type: types.type, base: self.warning, layout: .PyFutureWarning)
    self.importWarning = PyType.initBuiltinType(name: "ImportWarning", type: types.type, base: self.warning, layout: .PyImportWarning)
    self.unicodeWarning = PyType.initBuiltinType(name: "UnicodeWarning", type: types.type, base: self.warning, layout: .PyUnicodeWarning)
    self.bytesWarning = PyType.initBuiltinType(name: "BytesWarning", type: types.type, base: self.warning, layout: .PyBytesWarning)
    self.resourceWarning = PyType.initBuiltinType(name: "ResourceWarning", type: types.type, base: self.warning, layout: .PyResourceWarning)
  }

  // MARK: - Stage 2 - fill __dict__

  /// This function finalizes init of all of the stored types.
  /// (see comment at the top of this file)
  ///
  /// For example it will:
  /// - set type flags
  /// - add `__doc__`
  /// - fill `__dict__`
  internal func fill__dict__() {
    self.fillBaseException()
    self.fillSystemExit()
    self.fillKeyboardInterrupt()
    self.fillGeneratorExit()
    self.fillException()
    self.fillStopIteration()
    self.fillStopAsyncIteration()
    self.fillArithmeticError()
    self.fillFloatingPointError()
    self.fillOverflowError()
    self.fillZeroDivisionError()
    self.fillAssertionError()
    self.fillAttributeError()
    self.fillBufferError()
    self.fillEOFError()
    self.fillImportError()
    self.fillModuleNotFoundError()
    self.fillLookupError()
    self.fillIndexError()
    self.fillKeyError()
    self.fillMemoryError()
    self.fillNameError()
    self.fillUnboundLocalError()
    self.fillOSError()
    self.fillBlockingIOError()
    self.fillChildProcessError()
    self.fillConnectionError()
    self.fillBrokenPipeError()
    self.fillConnectionAbortedError()
    self.fillConnectionRefusedError()
    self.fillConnectionResetError()
    self.fillFileExistsError()
    self.fillFileNotFoundError()
    self.fillInterruptedError()
    self.fillIsADirectoryError()
    self.fillNotADirectoryError()
    self.fillPermissionError()
    self.fillProcessLookupError()
    self.fillTimeoutError()
    self.fillReferenceError()
    self.fillRuntimeError()
    self.fillNotImplementedError()
    self.fillRecursionError()
    self.fillSyntaxError()
    self.fillIndentationError()
    self.fillTabError()
    self.fillSystemError()
    self.fillTypeError()
    self.fillValueError()
    self.fillUnicodeError()
    self.fillUnicodeDecodeError()
    self.fillUnicodeEncodeError()
    self.fillUnicodeTranslateError()
    self.fillWarning()
    self.fillDeprecationWarning()
    self.fillPendingDeprecationWarning()
    self.fillRuntimeWarning()
    self.fillSyntaxWarning()
    self.fillUserWarning()
    self.fillFutureWarning()
    self.fillImportWarning()
    self.fillUnicodeWarning()
    self.fillBytesWarning()
    self.fillResourceWarning()
  }

  // MARK: - All

  internal var all: [PyType] {
    return [
      self.baseException,
      self.systemExit,
      self.keyboardInterrupt,
      self.generatorExit,
      self.exception,
      self.stopIteration,
      self.stopAsyncIteration,
      self.arithmeticError,
      self.floatingPointError,
      self.overflowError,
      self.zeroDivisionError,
      self.assertionError,
      self.attributeError,
      self.bufferError,
      self.eofError,
      self.importError,
      self.moduleNotFoundError,
      self.lookupError,
      self.indexError,
      self.keyError,
      self.memoryError,
      self.nameError,
      self.unboundLocalError,
      self.osError,
      self.blockingIOError,
      self.childProcessError,
      self.connectionError,
      self.brokenPipeError,
      self.connectionAbortedError,
      self.connectionRefusedError,
      self.connectionResetError,
      self.fileExistsError,
      self.fileNotFoundError,
      self.interruptedError,
      self.isADirectoryError,
      self.notADirectoryError,
      self.permissionError,
      self.processLookupError,
      self.timeoutError,
      self.referenceError,
      self.runtimeError,
      self.notImplementedError,
      self.recursionError,
      self.syntaxError,
      self.indentationError,
      self.tabError,
      self.systemError,
      self.typeError,
      self.valueError,
      self.unicodeError,
      self.unicodeDecodeError,
      self.unicodeEncodeError,
      self.unicodeTranslateError,
      self.warning,
      self.deprecationWarning,
      self.pendingDeprecationWarning,
      self.runtimeWarning,
      self.syntaxWarning,
      self.userWarning,
      self.futureWarning,
      self.importWarning,
      self.unicodeWarning,
      self.bytesWarning,
      self.resourceWarning,
    ]
  }

  // MARK: - Helpers

  /// Insert value to type '__dict__'.
  private func insert(type: PyType, name: String, value: PyObject) {
    let dict = type.getDict()
    let interned = Py.intern(string: name)

    switch dict.set(key: interned, to: value) {
    case .ok:
      break
    case .error(let e):
      let typeName = type.getName()
      trap("Error when inserting '\(name)' to '\(typeName)' type: \(e)")
    }
  }

  /// Basically:
  /// We hold 'PyObjects' on stack.
  /// We need to call Swift method that needs specific 'self' type.
  /// This method is responsible for downcasting 'PyObject' -> specific Swift type.
  private static func cast<T>(_ object: PyObject,
                              as type: T.Type,
                              typeName: String,
                              methodName: String) -> PyResult<T> {
    if let v = object as? T {
      return .value(v)
    }

    return .typeError(
      "descriptor '\(methodName)' requires a '\(typeName)' object " +
      "but received a '\(object.typeName)'"
    )
  }

  // MARK: - BaseException

  private func fillBaseException() {
    let type = self.baseException
    type.setBuiltinTypeDoc(PyBaseException.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyBaseException.getDict, castSelf: Self.asBaseException))
    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyBaseException.getClass, castSelf: Self.asBaseException))
    self.insert(type: type, name: "args", value: PyProperty.wrap(doc: nil, get: PyBaseException.getArgs, set: PyBaseException.setArgs, castSelf: Self.asBaseException))
    self.insert(type: type, name: "__traceback__", value: PyProperty.wrap(doc: nil, get: PyBaseException.getTraceback, set: PyBaseException.setTraceback, castSelf: Self.asBaseException))
    self.insert(type: type, name: "__cause__", value: PyProperty.wrap(doc: PyBaseException.getCauseDoc, get: PyBaseException.getCause, set: PyBaseException.setCause, castSelf: Self.asBaseException))
    self.insert(type: type, name: "__context__", value: PyProperty.wrap(doc: PyBaseException.getContextDoc, get: PyBaseException.getContext, set: PyBaseException.setContext, castSelf: Self.asBaseException))
    self.insert(type: type, name: "__suppress_context__", value: PyProperty.wrap(doc: nil, get: PyBaseException.getSuppressContext, set: PyBaseException.setSuppressContext, castSelf: Self.asBaseException))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyBaseException.pyBaseExceptionNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyBaseException.pyBaseExceptionInit(args:kwargs:)))

    self.insert(type: type, name: "__repr__", value: PyBuiltinFunction.wrap(name: "__repr__", doc: nil, fn: PyBaseException.repr, castSelf: Self.asBaseException))
    self.insert(type: type, name: "__str__", value: PyBuiltinFunction.wrap(name: "__str__", doc: nil, fn: PyBaseException.str(baseException:), castSelf: Self.asBaseException))
    self.insert(type: type, name: "__getattribute__", value: PyBuiltinFunction.wrap(name: "__getattribute__", doc: nil, fn: PyBaseException.getAttribute(name:), castSelf: Self.asBaseException))
    self.insert(type: type, name: "__setattr__", value: PyBuiltinFunction.wrap(name: "__setattr__", doc: nil, fn: PyBaseException.setAttribute(name:value:), castSelf: Self.asBaseException))
    self.insert(type: type, name: "__delattr__", value: PyBuiltinFunction.wrap(name: "__delattr__", doc: nil, fn: PyBaseException.delAttribute(name:), castSelf: Self.asBaseException))
    self.insert(type: type, name: "with_traceback", value: PyBuiltinFunction.wrap(name: "with_traceback", doc: PyBaseException.withTracebackDoc, fn: PyBaseException.withTraceback(traceback:), castSelf: Self.asBaseException))
  }

  private static func asBaseException(_ object: PyObject, methodName: String) -> PyResult<PyBaseException> {
    return Self.cast(
      object,
      as: PyBaseException.self,
      typeName: "BaseException",
      methodName: methodName
    )
  }

  // MARK: - SystemExit

  private func fillSystemExit() {
    let type = self.systemExit
    type.setBuiltinTypeDoc(PySystemExit.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PySystemExit.getClass, castSelf: Self.asSystemExit))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PySystemExit.getDict, castSelf: Self.asSystemExit))
    self.insert(type: type, name: "code", value: PyProperty.wrap(doc: nil, get: PySystemExit.getCode, set: PySystemExit.setCode, castSelf: Self.asSystemExit))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PySystemExit.pySystemExitNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PySystemExit.pySystemExitInit(args:kwargs:)))
  }

  private static func asSystemExit(_ object: PyObject, methodName: String) -> PyResult<PySystemExit> {
    return Self.cast(
      object,
      as: PySystemExit.self,
      typeName: "SystemExit",
      methodName: methodName
    )
  }

  // MARK: - KeyboardInterrupt

  private func fillKeyboardInterrupt() {
    let type = self.keyboardInterrupt
    type.setBuiltinTypeDoc(PyKeyboardInterrupt.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyKeyboardInterrupt.getClass, castSelf: Self.asKeyboardInterrupt))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyKeyboardInterrupt.getDict, castSelf: Self.asKeyboardInterrupt))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyKeyboardInterrupt.pyKeyboardInterruptNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyKeyboardInterrupt.pyKeyboardInterruptInit(args:kwargs:)))
  }

  private static func asKeyboardInterrupt(_ object: PyObject, methodName: String) -> PyResult<PyKeyboardInterrupt> {
    return Self.cast(
      object,
      as: PyKeyboardInterrupt.self,
      typeName: "KeyboardInterrupt",
      methodName: methodName
    )
  }

  // MARK: - GeneratorExit

  private func fillGeneratorExit() {
    let type = self.generatorExit
    type.setBuiltinTypeDoc(PyGeneratorExit.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyGeneratorExit.getClass, castSelf: Self.asGeneratorExit))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyGeneratorExit.getDict, castSelf: Self.asGeneratorExit))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyGeneratorExit.pyGeneratorExitNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyGeneratorExit.pyGeneratorExitInit(args:kwargs:)))
  }

  private static func asGeneratorExit(_ object: PyObject, methodName: String) -> PyResult<PyGeneratorExit> {
    return Self.cast(
      object,
      as: PyGeneratorExit.self,
      typeName: "GeneratorExit",
      methodName: methodName
    )
  }

  // MARK: - Exception

  private func fillException() {
    let type = self.exception
    type.setBuiltinTypeDoc(PyException.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyException.getClass, castSelf: Self.asException))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyException.getDict, castSelf: Self.asException))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyException.pyExceptionNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyException.pyExceptionInit(args:kwargs:)))
  }

  private static func asException(_ object: PyObject, methodName: String) -> PyResult<PyException> {
    return Self.cast(
      object,
      as: PyException.self,
      typeName: "Exception",
      methodName: methodName
    )
  }

  // MARK: - StopIteration

  private func fillStopIteration() {
    let type = self.stopIteration
    type.setBuiltinTypeDoc(PyStopIteration.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyStopIteration.getClass, castSelf: Self.asStopIteration))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyStopIteration.getDict, castSelf: Self.asStopIteration))
    self.insert(type: type, name: "value", value: PyProperty.wrap(doc: nil, get: PyStopIteration.getValue, set: PyStopIteration.setValue, castSelf: Self.asStopIteration))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyStopIteration.pyStopIterationNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyStopIteration.pyStopIterationInit(args:kwargs:)))
  }

  private static func asStopIteration(_ object: PyObject, methodName: String) -> PyResult<PyStopIteration> {
    return Self.cast(
      object,
      as: PyStopIteration.self,
      typeName: "StopIteration",
      methodName: methodName
    )
  }

  // MARK: - StopAsyncIteration

  private func fillStopAsyncIteration() {
    let type = self.stopAsyncIteration
    type.setBuiltinTypeDoc(PyStopAsyncIteration.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyStopAsyncIteration.getClass, castSelf: Self.asStopAsyncIteration))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyStopAsyncIteration.getDict, castSelf: Self.asStopAsyncIteration))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyStopAsyncIteration.pyStopAsyncIterationNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyStopAsyncIteration.pyStopAsyncIterationInit(args:kwargs:)))
  }

  private static func asStopAsyncIteration(_ object: PyObject, methodName: String) -> PyResult<PyStopAsyncIteration> {
    return Self.cast(
      object,
      as: PyStopAsyncIteration.self,
      typeName: "StopAsyncIteration",
      methodName: methodName
    )
  }

  // MARK: - ArithmeticError

  private func fillArithmeticError() {
    let type = self.arithmeticError
    type.setBuiltinTypeDoc(PyArithmeticError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyArithmeticError.getClass, castSelf: Self.asArithmeticError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyArithmeticError.getDict, castSelf: Self.asArithmeticError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyArithmeticError.pyArithmeticErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyArithmeticError.pyArithmeticErrorInit(args:kwargs:)))
  }

  private static func asArithmeticError(_ object: PyObject, methodName: String) -> PyResult<PyArithmeticError> {
    return Self.cast(
      object,
      as: PyArithmeticError.self,
      typeName: "ArithmeticError",
      methodName: methodName
    )
  }

  // MARK: - FloatingPointError

  private func fillFloatingPointError() {
    let type = self.floatingPointError
    type.setBuiltinTypeDoc(PyFloatingPointError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyFloatingPointError.getClass, castSelf: Self.asFloatingPointError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyFloatingPointError.getDict, castSelf: Self.asFloatingPointError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyFloatingPointError.pyFloatingPointErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyFloatingPointError.pyFloatingPointErrorInit(args:kwargs:)))
  }

  private static func asFloatingPointError(_ object: PyObject, methodName: String) -> PyResult<PyFloatingPointError> {
    return Self.cast(
      object,
      as: PyFloatingPointError.self,
      typeName: "FloatingPointError",
      methodName: methodName
    )
  }

  // MARK: - OverflowError

  private func fillOverflowError() {
    let type = self.overflowError
    type.setBuiltinTypeDoc(PyOverflowError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyOverflowError.getClass, castSelf: Self.asOverflowError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyOverflowError.getDict, castSelf: Self.asOverflowError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyOverflowError.pyOverflowErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyOverflowError.pyOverflowErrorInit(args:kwargs:)))
  }

  private static func asOverflowError(_ object: PyObject, methodName: String) -> PyResult<PyOverflowError> {
    return Self.cast(
      object,
      as: PyOverflowError.self,
      typeName: "OverflowError",
      methodName: methodName
    )
  }

  // MARK: - ZeroDivisionError

  private func fillZeroDivisionError() {
    let type = self.zeroDivisionError
    type.setBuiltinTypeDoc(PyZeroDivisionError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyZeroDivisionError.getClass, castSelf: Self.asZeroDivisionError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyZeroDivisionError.getDict, castSelf: Self.asZeroDivisionError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyZeroDivisionError.pyZeroDivisionErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyZeroDivisionError.pyZeroDivisionErrorInit(args:kwargs:)))
  }

  private static func asZeroDivisionError(_ object: PyObject, methodName: String) -> PyResult<PyZeroDivisionError> {
    return Self.cast(
      object,
      as: PyZeroDivisionError.self,
      typeName: "ZeroDivisionError",
      methodName: methodName
    )
  }

  // MARK: - AssertionError

  private func fillAssertionError() {
    let type = self.assertionError
    type.setBuiltinTypeDoc(PyAssertionError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyAssertionError.getClass, castSelf: Self.asAssertionError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyAssertionError.getDict, castSelf: Self.asAssertionError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyAssertionError.pyAssertionErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyAssertionError.pyAssertionErrorInit(args:kwargs:)))
  }

  private static func asAssertionError(_ object: PyObject, methodName: String) -> PyResult<PyAssertionError> {
    return Self.cast(
      object,
      as: PyAssertionError.self,
      typeName: "AssertionError",
      methodName: methodName
    )
  }

  // MARK: - AttributeError

  private func fillAttributeError() {
    let type = self.attributeError
    type.setBuiltinTypeDoc(PyAttributeError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyAttributeError.getClass, castSelf: Self.asAttributeError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyAttributeError.getDict, castSelf: Self.asAttributeError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyAttributeError.pyAttributeErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyAttributeError.pyAttributeErrorInit(args:kwargs:)))
  }

  private static func asAttributeError(_ object: PyObject, methodName: String) -> PyResult<PyAttributeError> {
    return Self.cast(
      object,
      as: PyAttributeError.self,
      typeName: "AttributeError",
      methodName: methodName
    )
  }

  // MARK: - BufferError

  private func fillBufferError() {
    let type = self.bufferError
    type.setBuiltinTypeDoc(PyBufferError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyBufferError.getClass, castSelf: Self.asBufferError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyBufferError.getDict, castSelf: Self.asBufferError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyBufferError.pyBufferErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyBufferError.pyBufferErrorInit(args:kwargs:)))
  }

  private static func asBufferError(_ object: PyObject, methodName: String) -> PyResult<PyBufferError> {
    return Self.cast(
      object,
      as: PyBufferError.self,
      typeName: "BufferError",
      methodName: methodName
    )
  }

  // MARK: - EOFError

  private func fillEOFError() {
    let type = self.eofError
    type.setBuiltinTypeDoc(PyEOFError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyEOFError.getClass, castSelf: Self.asEOFError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyEOFError.getDict, castSelf: Self.asEOFError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyEOFError.pyEOFErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyEOFError.pyEOFErrorInit(args:kwargs:)))
  }

  private static func asEOFError(_ object: PyObject, methodName: String) -> PyResult<PyEOFError> {
    return Self.cast(
      object,
      as: PyEOFError.self,
      typeName: "EOFError",
      methodName: methodName
    )
  }

  // MARK: - ImportError

  private func fillImportError() {
    let type = self.importError
    type.setBuiltinTypeDoc(PyImportError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyImportError.getClass, castSelf: Self.asImportError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyImportError.getDict, castSelf: Self.asImportError))
    self.insert(type: type, name: "msg", value: PyProperty.wrap(doc: nil, get: PyImportError.getMsg, set: PyImportError.setMsg, castSelf: Self.asImportError))
    self.insert(type: type, name: "name", value: PyProperty.wrap(doc: nil, get: PyImportError.getName, set: PyImportError.setName, castSelf: Self.asImportError))
    self.insert(type: type, name: "path", value: PyProperty.wrap(doc: nil, get: PyImportError.getPath, set: PyImportError.setPath, castSelf: Self.asImportError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyImportError.pyImportErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyImportError.pyImportErrorInit(args:kwargs:)))

    self.insert(type: type, name: "__str__", value: PyBuiltinFunction.wrap(name: "__str__", doc: nil, fn: PyImportError.str(importError:), castSelf: Self.asImportError))
  }

  private static func asImportError(_ object: PyObject, methodName: String) -> PyResult<PyImportError> {
    return Self.cast(
      object,
      as: PyImportError.self,
      typeName: "ImportError",
      methodName: methodName
    )
  }

  // MARK: - ModuleNotFoundError

  private func fillModuleNotFoundError() {
    let type = self.moduleNotFoundError
    type.setBuiltinTypeDoc(PyModuleNotFoundError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyModuleNotFoundError.getClass, castSelf: Self.asModuleNotFoundError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyModuleNotFoundError.getDict, castSelf: Self.asModuleNotFoundError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyModuleNotFoundError.pyModuleNotFoundErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyModuleNotFoundError.pyModuleNotFoundErrorInit(args:kwargs:)))
  }

  private static func asModuleNotFoundError(_ object: PyObject, methodName: String) -> PyResult<PyModuleNotFoundError> {
    return Self.cast(
      object,
      as: PyModuleNotFoundError.self,
      typeName: "ModuleNotFoundError",
      methodName: methodName
    )
  }

  // MARK: - LookupError

  private func fillLookupError() {
    let type = self.lookupError
    type.setBuiltinTypeDoc(PyLookupError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyLookupError.getClass, castSelf: Self.asLookupError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyLookupError.getDict, castSelf: Self.asLookupError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyLookupError.pyLookupErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyLookupError.pyLookupErrorInit(args:kwargs:)))
  }

  private static func asLookupError(_ object: PyObject, methodName: String) -> PyResult<PyLookupError> {
    return Self.cast(
      object,
      as: PyLookupError.self,
      typeName: "LookupError",
      methodName: methodName
    )
  }

  // MARK: - IndexError

  private func fillIndexError() {
    let type = self.indexError
    type.setBuiltinTypeDoc(PyIndexError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyIndexError.getClass, castSelf: Self.asIndexError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyIndexError.getDict, castSelf: Self.asIndexError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyIndexError.pyIndexErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyIndexError.pyIndexErrorInit(args:kwargs:)))
  }

  private static func asIndexError(_ object: PyObject, methodName: String) -> PyResult<PyIndexError> {
    return Self.cast(
      object,
      as: PyIndexError.self,
      typeName: "IndexError",
      methodName: methodName
    )
  }

  // MARK: - KeyError

  private func fillKeyError() {
    let type = self.keyError
    type.setBuiltinTypeDoc(PyKeyError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyKeyError.getClass, castSelf: Self.asKeyError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyKeyError.getDict, castSelf: Self.asKeyError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyKeyError.pyKeyErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyKeyError.pyKeyErrorInit(args:kwargs:)))

    self.insert(type: type, name: "__str__", value: PyBuiltinFunction.wrap(name: "__str__", doc: nil, fn: PyKeyError.str(keyError:), castSelf: Self.asKeyError))
  }

  private static func asKeyError(_ object: PyObject, methodName: String) -> PyResult<PyKeyError> {
    return Self.cast(
      object,
      as: PyKeyError.self,
      typeName: "KeyError",
      methodName: methodName
    )
  }

  // MARK: - MemoryError

  private func fillMemoryError() {
    let type = self.memoryError
    type.setBuiltinTypeDoc(PyMemoryError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyMemoryError.getClass, castSelf: Self.asMemoryError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyMemoryError.getDict, castSelf: Self.asMemoryError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyMemoryError.pyMemoryErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyMemoryError.pyMemoryErrorInit(args:kwargs:)))
  }

  private static func asMemoryError(_ object: PyObject, methodName: String) -> PyResult<PyMemoryError> {
    return Self.cast(
      object,
      as: PyMemoryError.self,
      typeName: "MemoryError",
      methodName: methodName
    )
  }

  // MARK: - NameError

  private func fillNameError() {
    let type = self.nameError
    type.setBuiltinTypeDoc(PyNameError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyNameError.getClass, castSelf: Self.asNameError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyNameError.getDict, castSelf: Self.asNameError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyNameError.pyNameErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyNameError.pyNameErrorInit(args:kwargs:)))
  }

  private static func asNameError(_ object: PyObject, methodName: String) -> PyResult<PyNameError> {
    return Self.cast(
      object,
      as: PyNameError.self,
      typeName: "NameError",
      methodName: methodName
    )
  }

  // MARK: - UnboundLocalError

  private func fillUnboundLocalError() {
    let type = self.unboundLocalError
    type.setBuiltinTypeDoc(PyUnboundLocalError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyUnboundLocalError.getClass, castSelf: Self.asUnboundLocalError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyUnboundLocalError.getDict, castSelf: Self.asUnboundLocalError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyUnboundLocalError.pyUnboundLocalErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyUnboundLocalError.pyUnboundLocalErrorInit(args:kwargs:)))
  }

  private static func asUnboundLocalError(_ object: PyObject, methodName: String) -> PyResult<PyUnboundLocalError> {
    return Self.cast(
      object,
      as: PyUnboundLocalError.self,
      typeName: "UnboundLocalError",
      methodName: methodName
    )
  }

  // MARK: - OSError

  private func fillOSError() {
    let type = self.osError
    type.setBuiltinTypeDoc(PyOSError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyOSError.getClass, castSelf: Self.asOSError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyOSError.getDict, castSelf: Self.asOSError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyOSError.pyOSErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyOSError.pyOSErrorInit(args:kwargs:)))
  }

  private static func asOSError(_ object: PyObject, methodName: String) -> PyResult<PyOSError> {
    return Self.cast(
      object,
      as: PyOSError.self,
      typeName: "OSError",
      methodName: methodName
    )
  }

  // MARK: - BlockingIOError

  private func fillBlockingIOError() {
    let type = self.blockingIOError
    type.setBuiltinTypeDoc(PyBlockingIOError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyBlockingIOError.getClass, castSelf: Self.asBlockingIOError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyBlockingIOError.getDict, castSelf: Self.asBlockingIOError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyBlockingIOError.pyBlockingIOErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyBlockingIOError.pyBlockingIOErrorInit(args:kwargs:)))
  }

  private static func asBlockingIOError(_ object: PyObject, methodName: String) -> PyResult<PyBlockingIOError> {
    return Self.cast(
      object,
      as: PyBlockingIOError.self,
      typeName: "BlockingIOError",
      methodName: methodName
    )
  }

  // MARK: - ChildProcessError

  private func fillChildProcessError() {
    let type = self.childProcessError
    type.setBuiltinTypeDoc(PyChildProcessError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyChildProcessError.getClass, castSelf: Self.asChildProcessError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyChildProcessError.getDict, castSelf: Self.asChildProcessError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyChildProcessError.pyChildProcessErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyChildProcessError.pyChildProcessErrorInit(args:kwargs:)))
  }

  private static func asChildProcessError(_ object: PyObject, methodName: String) -> PyResult<PyChildProcessError> {
    return Self.cast(
      object,
      as: PyChildProcessError.self,
      typeName: "ChildProcessError",
      methodName: methodName
    )
  }

  // MARK: - ConnectionError

  private func fillConnectionError() {
    let type = self.connectionError
    type.setBuiltinTypeDoc(PyConnectionError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyConnectionError.getClass, castSelf: Self.asConnectionError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyConnectionError.getDict, castSelf: Self.asConnectionError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyConnectionError.pyConnectionErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyConnectionError.pyConnectionErrorInit(args:kwargs:)))
  }

  private static func asConnectionError(_ object: PyObject, methodName: String) -> PyResult<PyConnectionError> {
    return Self.cast(
      object,
      as: PyConnectionError.self,
      typeName: "ConnectionError",
      methodName: methodName
    )
  }

  // MARK: - BrokenPipeError

  private func fillBrokenPipeError() {
    let type = self.brokenPipeError
    type.setBuiltinTypeDoc(PyBrokenPipeError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyBrokenPipeError.getClass, castSelf: Self.asBrokenPipeError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyBrokenPipeError.getDict, castSelf: Self.asBrokenPipeError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyBrokenPipeError.pyBrokenPipeErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyBrokenPipeError.pyBrokenPipeErrorInit(args:kwargs:)))
  }

  private static func asBrokenPipeError(_ object: PyObject, methodName: String) -> PyResult<PyBrokenPipeError> {
    return Self.cast(
      object,
      as: PyBrokenPipeError.self,
      typeName: "BrokenPipeError",
      methodName: methodName
    )
  }

  // MARK: - ConnectionAbortedError

  private func fillConnectionAbortedError() {
    let type = self.connectionAbortedError
    type.setBuiltinTypeDoc(PyConnectionAbortedError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyConnectionAbortedError.getClass, castSelf: Self.asConnectionAbortedError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyConnectionAbortedError.getDict, castSelf: Self.asConnectionAbortedError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyConnectionAbortedError.pyConnectionAbortedErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyConnectionAbortedError.pyConnectionAbortedErrorInit(args:kwargs:)))
  }

  private static func asConnectionAbortedError(_ object: PyObject, methodName: String) -> PyResult<PyConnectionAbortedError> {
    return Self.cast(
      object,
      as: PyConnectionAbortedError.self,
      typeName: "ConnectionAbortedError",
      methodName: methodName
    )
  }

  // MARK: - ConnectionRefusedError

  private func fillConnectionRefusedError() {
    let type = self.connectionRefusedError
    type.setBuiltinTypeDoc(PyConnectionRefusedError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyConnectionRefusedError.getClass, castSelf: Self.asConnectionRefusedError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyConnectionRefusedError.getDict, castSelf: Self.asConnectionRefusedError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyConnectionRefusedError.pyConnectionRefusedErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyConnectionRefusedError.pyConnectionRefusedErrorInit(args:kwargs:)))
  }

  private static func asConnectionRefusedError(_ object: PyObject, methodName: String) -> PyResult<PyConnectionRefusedError> {
    return Self.cast(
      object,
      as: PyConnectionRefusedError.self,
      typeName: "ConnectionRefusedError",
      methodName: methodName
    )
  }

  // MARK: - ConnectionResetError

  private func fillConnectionResetError() {
    let type = self.connectionResetError
    type.setBuiltinTypeDoc(PyConnectionResetError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyConnectionResetError.getClass, castSelf: Self.asConnectionResetError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyConnectionResetError.getDict, castSelf: Self.asConnectionResetError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyConnectionResetError.pyConnectionResetErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyConnectionResetError.pyConnectionResetErrorInit(args:kwargs:)))
  }

  private static func asConnectionResetError(_ object: PyObject, methodName: String) -> PyResult<PyConnectionResetError> {
    return Self.cast(
      object,
      as: PyConnectionResetError.self,
      typeName: "ConnectionResetError",
      methodName: methodName
    )
  }

  // MARK: - FileExistsError

  private func fillFileExistsError() {
    let type = self.fileExistsError
    type.setBuiltinTypeDoc(PyFileExistsError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyFileExistsError.getClass, castSelf: Self.asFileExistsError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyFileExistsError.getDict, castSelf: Self.asFileExistsError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyFileExistsError.pyFileExistsErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyFileExistsError.pyFileExistsErrorInit(args:kwargs:)))
  }

  private static func asFileExistsError(_ object: PyObject, methodName: String) -> PyResult<PyFileExistsError> {
    return Self.cast(
      object,
      as: PyFileExistsError.self,
      typeName: "FileExistsError",
      methodName: methodName
    )
  }

  // MARK: - FileNotFoundError

  private func fillFileNotFoundError() {
    let type = self.fileNotFoundError
    type.setBuiltinTypeDoc(PyFileNotFoundError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyFileNotFoundError.getClass, castSelf: Self.asFileNotFoundError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyFileNotFoundError.getDict, castSelf: Self.asFileNotFoundError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyFileNotFoundError.pyFileNotFoundErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyFileNotFoundError.pyFileNotFoundErrorInit(args:kwargs:)))
  }

  private static func asFileNotFoundError(_ object: PyObject, methodName: String) -> PyResult<PyFileNotFoundError> {
    return Self.cast(
      object,
      as: PyFileNotFoundError.self,
      typeName: "FileNotFoundError",
      methodName: methodName
    )
  }

  // MARK: - InterruptedError

  private func fillInterruptedError() {
    let type = self.interruptedError
    type.setBuiltinTypeDoc(PyInterruptedError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyInterruptedError.getClass, castSelf: Self.asInterruptedError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyInterruptedError.getDict, castSelf: Self.asInterruptedError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyInterruptedError.pyInterruptedErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyInterruptedError.pyInterruptedErrorInit(args:kwargs:)))
  }

  private static func asInterruptedError(_ object: PyObject, methodName: String) -> PyResult<PyInterruptedError> {
    return Self.cast(
      object,
      as: PyInterruptedError.self,
      typeName: "InterruptedError",
      methodName: methodName
    )
  }

  // MARK: - IsADirectoryError

  private func fillIsADirectoryError() {
    let type = self.isADirectoryError
    type.setBuiltinTypeDoc(PyIsADirectoryError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyIsADirectoryError.getClass, castSelf: Self.asIsADirectoryError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyIsADirectoryError.getDict, castSelf: Self.asIsADirectoryError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyIsADirectoryError.pyIsADirectoryErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyIsADirectoryError.pyIsADirectoryErrorInit(args:kwargs:)))
  }

  private static func asIsADirectoryError(_ object: PyObject, methodName: String) -> PyResult<PyIsADirectoryError> {
    return Self.cast(
      object,
      as: PyIsADirectoryError.self,
      typeName: "IsADirectoryError",
      methodName: methodName
    )
  }

  // MARK: - NotADirectoryError

  private func fillNotADirectoryError() {
    let type = self.notADirectoryError
    type.setBuiltinTypeDoc(PyNotADirectoryError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyNotADirectoryError.getClass, castSelf: Self.asNotADirectoryError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyNotADirectoryError.getDict, castSelf: Self.asNotADirectoryError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyNotADirectoryError.pyNotADirectoryErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyNotADirectoryError.pyNotADirectoryErrorInit(args:kwargs:)))
  }

  private static func asNotADirectoryError(_ object: PyObject, methodName: String) -> PyResult<PyNotADirectoryError> {
    return Self.cast(
      object,
      as: PyNotADirectoryError.self,
      typeName: "NotADirectoryError",
      methodName: methodName
    )
  }

  // MARK: - PermissionError

  private func fillPermissionError() {
    let type = self.permissionError
    type.setBuiltinTypeDoc(PyPermissionError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyPermissionError.getClass, castSelf: Self.asPermissionError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyPermissionError.getDict, castSelf: Self.asPermissionError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyPermissionError.pyPermissionErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyPermissionError.pyPermissionErrorInit(args:kwargs:)))
  }

  private static func asPermissionError(_ object: PyObject, methodName: String) -> PyResult<PyPermissionError> {
    return Self.cast(
      object,
      as: PyPermissionError.self,
      typeName: "PermissionError",
      methodName: methodName
    )
  }

  // MARK: - ProcessLookupError

  private func fillProcessLookupError() {
    let type = self.processLookupError
    type.setBuiltinTypeDoc(PyProcessLookupError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyProcessLookupError.getClass, castSelf: Self.asProcessLookupError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyProcessLookupError.getDict, castSelf: Self.asProcessLookupError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyProcessLookupError.pyProcessLookupErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyProcessLookupError.pyProcessLookupErrorInit(args:kwargs:)))
  }

  private static func asProcessLookupError(_ object: PyObject, methodName: String) -> PyResult<PyProcessLookupError> {
    return Self.cast(
      object,
      as: PyProcessLookupError.self,
      typeName: "ProcessLookupError",
      methodName: methodName
    )
  }

  // MARK: - TimeoutError

  private func fillTimeoutError() {
    let type = self.timeoutError
    type.setBuiltinTypeDoc(PyTimeoutError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyTimeoutError.getClass, castSelf: Self.asTimeoutError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyTimeoutError.getDict, castSelf: Self.asTimeoutError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyTimeoutError.pyTimeoutErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyTimeoutError.pyTimeoutErrorInit(args:kwargs:)))
  }

  private static func asTimeoutError(_ object: PyObject, methodName: String) -> PyResult<PyTimeoutError> {
    return Self.cast(
      object,
      as: PyTimeoutError.self,
      typeName: "TimeoutError",
      methodName: methodName
    )
  }

  // MARK: - ReferenceError

  private func fillReferenceError() {
    let type = self.referenceError
    type.setBuiltinTypeDoc(PyReferenceError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyReferenceError.getClass, castSelf: Self.asReferenceError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyReferenceError.getDict, castSelf: Self.asReferenceError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyReferenceError.pyReferenceErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyReferenceError.pyReferenceErrorInit(args:kwargs:)))
  }

  private static func asReferenceError(_ object: PyObject, methodName: String) -> PyResult<PyReferenceError> {
    return Self.cast(
      object,
      as: PyReferenceError.self,
      typeName: "ReferenceError",
      methodName: methodName
    )
  }

  // MARK: - RuntimeError

  private func fillRuntimeError() {
    let type = self.runtimeError
    type.setBuiltinTypeDoc(PyRuntimeError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyRuntimeError.getClass, castSelf: Self.asRuntimeError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyRuntimeError.getDict, castSelf: Self.asRuntimeError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyRuntimeError.pyRuntimeErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyRuntimeError.pyRuntimeErrorInit(args:kwargs:)))
  }

  private static func asRuntimeError(_ object: PyObject, methodName: String) -> PyResult<PyRuntimeError> {
    return Self.cast(
      object,
      as: PyRuntimeError.self,
      typeName: "RuntimeError",
      methodName: methodName
    )
  }

  // MARK: - NotImplementedError

  private func fillNotImplementedError() {
    let type = self.notImplementedError
    type.setBuiltinTypeDoc(PyNotImplementedError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyNotImplementedError.getClass, castSelf: Self.asNotImplementedError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyNotImplementedError.getDict, castSelf: Self.asNotImplementedError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyNotImplementedError.pyNotImplementedErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyNotImplementedError.pyNotImplementedErrorInit(args:kwargs:)))
  }

  private static func asNotImplementedError(_ object: PyObject, methodName: String) -> PyResult<PyNotImplementedError> {
    return Self.cast(
      object,
      as: PyNotImplementedError.self,
      typeName: "NotImplementedError",
      methodName: methodName
    )
  }

  // MARK: - RecursionError

  private func fillRecursionError() {
    let type = self.recursionError
    type.setBuiltinTypeDoc(PyRecursionError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyRecursionError.getClass, castSelf: Self.asRecursionError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyRecursionError.getDict, castSelf: Self.asRecursionError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyRecursionError.pyRecursionErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyRecursionError.pyRecursionErrorInit(args:kwargs:)))
  }

  private static func asRecursionError(_ object: PyObject, methodName: String) -> PyResult<PyRecursionError> {
    return Self.cast(
      object,
      as: PyRecursionError.self,
      typeName: "RecursionError",
      methodName: methodName
    )
  }

  // MARK: - SyntaxError

  private func fillSyntaxError() {
    let type = self.syntaxError
    type.setBuiltinTypeDoc(PySyntaxError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PySyntaxError.getClass, castSelf: Self.asSyntaxError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PySyntaxError.getDict, castSelf: Self.asSyntaxError))
    self.insert(type: type, name: "msg", value: PyProperty.wrap(doc: nil, get: PySyntaxError.getMsg, set: PySyntaxError.setMsg, castSelf: Self.asSyntaxError))
    self.insert(type: type, name: "filename", value: PyProperty.wrap(doc: nil, get: PySyntaxError.getFilename, set: PySyntaxError.setFilename, castSelf: Self.asSyntaxError))
    self.insert(type: type, name: "lineno", value: PyProperty.wrap(doc: nil, get: PySyntaxError.getLineno, set: PySyntaxError.setLineno, castSelf: Self.asSyntaxError))
    self.insert(type: type, name: "offset", value: PyProperty.wrap(doc: nil, get: PySyntaxError.getOffset, set: PySyntaxError.setOffset, castSelf: Self.asSyntaxError))
    self.insert(type: type, name: "text", value: PyProperty.wrap(doc: nil, get: PySyntaxError.getText, set: PySyntaxError.setText, castSelf: Self.asSyntaxError))
    self.insert(type: type, name: "print_file_and_line", value: PyProperty.wrap(doc: nil, get: PySyntaxError.getPrintFileAndLine, set: PySyntaxError.setPrintFileAndLine, castSelf: Self.asSyntaxError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PySyntaxError.pySyntaxErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PySyntaxError.pySyntaxErrorInit(args:kwargs:)))

    self.insert(type: type, name: "__str__", value: PyBuiltinFunction.wrap(name: "__str__", doc: nil, fn: PySyntaxError.str(syntaxError:), castSelf: Self.asSyntaxError))
  }

  private static func asSyntaxError(_ object: PyObject, methodName: String) -> PyResult<PySyntaxError> {
    return Self.cast(
      object,
      as: PySyntaxError.self,
      typeName: "SyntaxError",
      methodName: methodName
    )
  }

  // MARK: - IndentationError

  private func fillIndentationError() {
    let type = self.indentationError
    type.setBuiltinTypeDoc(PyIndentationError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyIndentationError.getClass, castSelf: Self.asIndentationError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyIndentationError.getDict, castSelf: Self.asIndentationError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyIndentationError.pyIndentationErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyIndentationError.pyIndentationErrorInit(args:kwargs:)))
  }

  private static func asIndentationError(_ object: PyObject, methodName: String) -> PyResult<PyIndentationError> {
    return Self.cast(
      object,
      as: PyIndentationError.self,
      typeName: "IndentationError",
      methodName: methodName
    )
  }

  // MARK: - TabError

  private func fillTabError() {
    let type = self.tabError
    type.setBuiltinTypeDoc(PyTabError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyTabError.getClass, castSelf: Self.asTabError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyTabError.getDict, castSelf: Self.asTabError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyTabError.pyTabErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyTabError.pyTabErrorInit(args:kwargs:)))
  }

  private static func asTabError(_ object: PyObject, methodName: String) -> PyResult<PyTabError> {
    return Self.cast(
      object,
      as: PyTabError.self,
      typeName: "TabError",
      methodName: methodName
    )
  }

  // MARK: - SystemError

  private func fillSystemError() {
    let type = self.systemError
    type.setBuiltinTypeDoc(PySystemError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PySystemError.getClass, castSelf: Self.asSystemError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PySystemError.getDict, castSelf: Self.asSystemError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PySystemError.pySystemErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PySystemError.pySystemErrorInit(args:kwargs:)))
  }

  private static func asSystemError(_ object: PyObject, methodName: String) -> PyResult<PySystemError> {
    return Self.cast(
      object,
      as: PySystemError.self,
      typeName: "SystemError",
      methodName: methodName
    )
  }

  // MARK: - TypeError

  private func fillTypeError() {
    let type = self.typeError
    type.setBuiltinTypeDoc(PyTypeError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyTypeError.getClass, castSelf: Self.asTypeError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyTypeError.getDict, castSelf: Self.asTypeError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyTypeError.pyTypeErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyTypeError.pyTypeErrorInit(args:kwargs:)))
  }

  private static func asTypeError(_ object: PyObject, methodName: String) -> PyResult<PyTypeError> {
    return Self.cast(
      object,
      as: PyTypeError.self,
      typeName: "TypeError",
      methodName: methodName
    )
  }

  // MARK: - ValueError

  private func fillValueError() {
    let type = self.valueError
    type.setBuiltinTypeDoc(PyValueError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyValueError.getClass, castSelf: Self.asValueError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyValueError.getDict, castSelf: Self.asValueError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyValueError.pyValueErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyValueError.pyValueErrorInit(args:kwargs:)))
  }

  private static func asValueError(_ object: PyObject, methodName: String) -> PyResult<PyValueError> {
    return Self.cast(
      object,
      as: PyValueError.self,
      typeName: "ValueError",
      methodName: methodName
    )
  }

  // MARK: - UnicodeError

  private func fillUnicodeError() {
    let type = self.unicodeError
    type.setBuiltinTypeDoc(PyUnicodeError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyUnicodeError.getClass, castSelf: Self.asUnicodeError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyUnicodeError.getDict, castSelf: Self.asUnicodeError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyUnicodeError.pyUnicodeErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyUnicodeError.pyUnicodeErrorInit(args:kwargs:)))
  }

  private static func asUnicodeError(_ object: PyObject, methodName: String) -> PyResult<PyUnicodeError> {
    return Self.cast(
      object,
      as: PyUnicodeError.self,
      typeName: "UnicodeError",
      methodName: methodName
    )
  }

  // MARK: - UnicodeDecodeError

  private func fillUnicodeDecodeError() {
    let type = self.unicodeDecodeError
    type.setBuiltinTypeDoc(PyUnicodeDecodeError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyUnicodeDecodeError.getClass, castSelf: Self.asUnicodeDecodeError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyUnicodeDecodeError.getDict, castSelf: Self.asUnicodeDecodeError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyUnicodeDecodeError.pyUnicodeDecodeErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyUnicodeDecodeError.pyUnicodeDecodeErrorInit(args:kwargs:)))
  }

  private static func asUnicodeDecodeError(_ object: PyObject, methodName: String) -> PyResult<PyUnicodeDecodeError> {
    return Self.cast(
      object,
      as: PyUnicodeDecodeError.self,
      typeName: "UnicodeDecodeError",
      methodName: methodName
    )
  }

  // MARK: - UnicodeEncodeError

  private func fillUnicodeEncodeError() {
    let type = self.unicodeEncodeError
    type.setBuiltinTypeDoc(PyUnicodeEncodeError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyUnicodeEncodeError.getClass, castSelf: Self.asUnicodeEncodeError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyUnicodeEncodeError.getDict, castSelf: Self.asUnicodeEncodeError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyUnicodeEncodeError.pyUnicodeEncodeErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyUnicodeEncodeError.pyUnicodeEncodeErrorInit(args:kwargs:)))
  }

  private static func asUnicodeEncodeError(_ object: PyObject, methodName: String) -> PyResult<PyUnicodeEncodeError> {
    return Self.cast(
      object,
      as: PyUnicodeEncodeError.self,
      typeName: "UnicodeEncodeError",
      methodName: methodName
    )
  }

  // MARK: - UnicodeTranslateError

  private func fillUnicodeTranslateError() {
    let type = self.unicodeTranslateError
    type.setBuiltinTypeDoc(PyUnicodeTranslateError.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyUnicodeTranslateError.getClass, castSelf: Self.asUnicodeTranslateError))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyUnicodeTranslateError.getDict, castSelf: Self.asUnicodeTranslateError))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyUnicodeTranslateError.pyUnicodeTranslateErrorNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyUnicodeTranslateError.pyUnicodeTranslateErrorInit(args:kwargs:)))
  }

  private static func asUnicodeTranslateError(_ object: PyObject, methodName: String) -> PyResult<PyUnicodeTranslateError> {
    return Self.cast(
      object,
      as: PyUnicodeTranslateError.self,
      typeName: "UnicodeTranslateError",
      methodName: methodName
    )
  }

  // MARK: - Warning

  private func fillWarning() {
    let type = self.warning
    type.setBuiltinTypeDoc(PyWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyWarning.getClass, castSelf: Self.asWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyWarning.getDict, castSelf: Self.asWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyWarning.pyWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyWarning.pyWarningInit(args:kwargs:)))
  }

  private static func asWarning(_ object: PyObject, methodName: String) -> PyResult<PyWarning> {
    return Self.cast(
      object,
      as: PyWarning.self,
      typeName: "Warning",
      methodName: methodName
    )
  }

  // MARK: - DeprecationWarning

  private func fillDeprecationWarning() {
    let type = self.deprecationWarning
    type.setBuiltinTypeDoc(PyDeprecationWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyDeprecationWarning.getClass, castSelf: Self.asDeprecationWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyDeprecationWarning.getDict, castSelf: Self.asDeprecationWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyDeprecationWarning.pyDeprecationWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyDeprecationWarning.pyDeprecationWarningInit(args:kwargs:)))
  }

  private static func asDeprecationWarning(_ object: PyObject, methodName: String) -> PyResult<PyDeprecationWarning> {
    return Self.cast(
      object,
      as: PyDeprecationWarning.self,
      typeName: "DeprecationWarning",
      methodName: methodName
    )
  }

  // MARK: - PendingDeprecationWarning

  private func fillPendingDeprecationWarning() {
    let type = self.pendingDeprecationWarning
    type.setBuiltinTypeDoc(PyPendingDeprecationWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyPendingDeprecationWarning.getClass, castSelf: Self.asPendingDeprecationWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyPendingDeprecationWarning.getDict, castSelf: Self.asPendingDeprecationWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyPendingDeprecationWarning.pyPendingDeprecationWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyPendingDeprecationWarning.pyPendingDeprecationWarningInit(args:kwargs:)))
  }

  private static func asPendingDeprecationWarning(_ object: PyObject, methodName: String) -> PyResult<PyPendingDeprecationWarning> {
    return Self.cast(
      object,
      as: PyPendingDeprecationWarning.self,
      typeName: "PendingDeprecationWarning",
      methodName: methodName
    )
  }

  // MARK: - RuntimeWarning

  private func fillRuntimeWarning() {
    let type = self.runtimeWarning
    type.setBuiltinTypeDoc(PyRuntimeWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyRuntimeWarning.getClass, castSelf: Self.asRuntimeWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyRuntimeWarning.getDict, castSelf: Self.asRuntimeWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyRuntimeWarning.pyRuntimeWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyRuntimeWarning.pyRuntimeWarningInit(args:kwargs:)))
  }

  private static func asRuntimeWarning(_ object: PyObject, methodName: String) -> PyResult<PyRuntimeWarning> {
    return Self.cast(
      object,
      as: PyRuntimeWarning.self,
      typeName: "RuntimeWarning",
      methodName: methodName
    )
  }

  // MARK: - SyntaxWarning

  private func fillSyntaxWarning() {
    let type = self.syntaxWarning
    type.setBuiltinTypeDoc(PySyntaxWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PySyntaxWarning.getClass, castSelf: Self.asSyntaxWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PySyntaxWarning.getDict, castSelf: Self.asSyntaxWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PySyntaxWarning.pySyntaxWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PySyntaxWarning.pySyntaxWarningInit(args:kwargs:)))
  }

  private static func asSyntaxWarning(_ object: PyObject, methodName: String) -> PyResult<PySyntaxWarning> {
    return Self.cast(
      object,
      as: PySyntaxWarning.self,
      typeName: "SyntaxWarning",
      methodName: methodName
    )
  }

  // MARK: - UserWarning

  private func fillUserWarning() {
    let type = self.userWarning
    type.setBuiltinTypeDoc(PyUserWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyUserWarning.getClass, castSelf: Self.asUserWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyUserWarning.getDict, castSelf: Self.asUserWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyUserWarning.pyUserWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyUserWarning.pyUserWarningInit(args:kwargs:)))
  }

  private static func asUserWarning(_ object: PyObject, methodName: String) -> PyResult<PyUserWarning> {
    return Self.cast(
      object,
      as: PyUserWarning.self,
      typeName: "UserWarning",
      methodName: methodName
    )
  }

  // MARK: - FutureWarning

  private func fillFutureWarning() {
    let type = self.futureWarning
    type.setBuiltinTypeDoc(PyFutureWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyFutureWarning.getClass, castSelf: Self.asFutureWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyFutureWarning.getDict, castSelf: Self.asFutureWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyFutureWarning.pyFutureWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyFutureWarning.pyFutureWarningInit(args:kwargs:)))
  }

  private static func asFutureWarning(_ object: PyObject, methodName: String) -> PyResult<PyFutureWarning> {
    return Self.cast(
      object,
      as: PyFutureWarning.self,
      typeName: "FutureWarning",
      methodName: methodName
    )
  }

  // MARK: - ImportWarning

  private func fillImportWarning() {
    let type = self.importWarning
    type.setBuiltinTypeDoc(PyImportWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyImportWarning.getClass, castSelf: Self.asImportWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyImportWarning.getDict, castSelf: Self.asImportWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyImportWarning.pyImportWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyImportWarning.pyImportWarningInit(args:kwargs:)))
  }

  private static func asImportWarning(_ object: PyObject, methodName: String) -> PyResult<PyImportWarning> {
    return Self.cast(
      object,
      as: PyImportWarning.self,
      typeName: "ImportWarning",
      methodName: methodName
    )
  }

  // MARK: - UnicodeWarning

  private func fillUnicodeWarning() {
    let type = self.unicodeWarning
    type.setBuiltinTypeDoc(PyUnicodeWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyUnicodeWarning.getClass, castSelf: Self.asUnicodeWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyUnicodeWarning.getDict, castSelf: Self.asUnicodeWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyUnicodeWarning.pyUnicodeWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyUnicodeWarning.pyUnicodeWarningInit(args:kwargs:)))
  }

  private static func asUnicodeWarning(_ object: PyObject, methodName: String) -> PyResult<PyUnicodeWarning> {
    return Self.cast(
      object,
      as: PyUnicodeWarning.self,
      typeName: "UnicodeWarning",
      methodName: methodName
    )
  }

  // MARK: - BytesWarning

  private func fillBytesWarning() {
    let type = self.bytesWarning
    type.setBuiltinTypeDoc(PyBytesWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyBytesWarning.getClass, castSelf: Self.asBytesWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyBytesWarning.getDict, castSelf: Self.asBytesWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyBytesWarning.pyBytesWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyBytesWarning.pyBytesWarningInit(args:kwargs:)))
  }

  private static func asBytesWarning(_ object: PyObject, methodName: String) -> PyResult<PyBytesWarning> {
    return Self.cast(
      object,
      as: PyBytesWarning.self,
      typeName: "BytesWarning",
      methodName: methodName
    )
  }

  // MARK: - ResourceWarning

  private func fillResourceWarning() {
    let type = self.resourceWarning
    type.setBuiltinTypeDoc(PyResourceWarning.doc)
    type.flags.set(PyType.baseExceptionSubclassFlag)
    type.flags.set(PyType.baseTypeFlag)
    type.flags.set(PyType.defaultFlag)
    type.flags.set(PyType.hasGCFlag)

    self.insert(type: type, name: "__class__", value: PyProperty.wrap(doc: nil, get: PyResourceWarning.getClass, castSelf: Self.asResourceWarning))
    self.insert(type: type, name: "__dict__", value: PyProperty.wrap(doc: nil, get: PyResourceWarning.getDict, castSelf: Self.asResourceWarning))

    self.insert(type: type, name: "__new__", value: PyStaticMethod.wrapNew(type: type, doc: nil, fn: PyResourceWarning.pyResourceWarningNew(type:args:kwargs:)))
    self.insert(type: type, name: "__init__", value: PyBuiltinFunction.wrapInit(type: type, doc: nil, fn: PyResourceWarning.pyResourceWarningInit(args:kwargs:)))
  }

  private static func asResourceWarning(_ object: PyObject, methodName: String) -> PyResult<PyResourceWarning> {
    return Self.cast(
      object,
      as: PyResourceWarning.self,
      typeName: "ResourceWarning",
      methodName: methodName
    )
  }

}
