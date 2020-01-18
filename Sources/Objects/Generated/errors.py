import os
import sys

# ---------------
# Data definition
# ---------------

data = [
# (class name, base class, doc)
('BaseException', 'Object', "Common base class for all exceptions"),
  ('SystemExit', 'BaseException', "Request to exit from the interpreter."),
  ('KeyboardInterrupt', 'BaseException', "Program interrupted by user."),
  ('GeneratorExit', 'BaseException', "Request that a generator exit."),
  ('Exception', 'BaseException', "Common base class for all non-exit exceptions."),
    ('StopIteration', 'Exception', "Signal the end from iterator.__next__()."),
    ('StopAsyncIteration', 'Exception', "Signal the end from iterator.__anext__()."),
    ('ArithmeticError', 'Exception', "Base class for arithmetic errors."),
      ('FloatingPointError', 'ArithmeticError', "Floating point operation failed."),
      ('OverflowError', 'ArithmeticError', "Result too large to be represented."),
      ('ZeroDivisionError', 'ArithmeticError', "Second argument to a division or modulo operation was zero."),
    ('AssertionError', 'Exception', "Assertion failed."),
    ('AttributeError', 'Exception', "Attribute not found."),
    ('BufferError', 'Exception', "Buffer error."),
    ('EOFError', 'Exception', "Read beyond end of file."),
    ('ImportError', 'Exception', "Import can't find module, or can't find name in module."),
      ('ModuleNotFoundError', 'ImportError', "Module not found."),
    ('LookupError', 'Exception', "Base class for lookup errors."),
      ('IndexError', 'LookupError', "Sequence index out of range."),
      ('KeyError', 'LookupError', "Mapping key not found."),
    ('MemoryError', 'Exception', "Out of memory."),
    ('NameError', 'Exception', "Name not found globally."),
      ('UnboundLocalError', 'NameError', "Local name referenced but not bound to a value."),
    ('OSError', 'Exception', "Base class for I/O related errors."),
      ('BlockingIOError', 'OSError', "I/O operation would block."),
      ('ChildProcessError', 'OSError', "Child process error."),
      ('ConnectionError', 'OSError', "Connection error."),
        ('BrokenPipeError', 'ConnectionError', "Broken pipe."),
        ('ConnectionAbortedError', 'ConnectionError', "Connection aborted."),
        ('ConnectionRefusedError', 'ConnectionError', "Connection refused."),
        ('ConnectionResetError', 'ConnectionError', "Connection reset."),
      ('FileExistsError', 'OSError', "File already exists."),
      ('FileNotFoundError', 'OSError', "File not found."),
      ('InterruptedError', 'OSError', "Interrupted by signal."),
      ('IsADirectoryError', 'OSError', "Operation doesn't work on directories."),
      ('NotADirectoryError', 'OSError', "Operation only works on directories."),
      ('PermissionError', 'OSError', "Not enough permissions."),
      ('ProcessLookupError', 'OSError', "Process not found."),
      ('TimeoutError', 'OSError', "Timeout expired."),
    ('ReferenceError', 'Exception', "Weak ref proxy used after referent went away."),
    ('RuntimeError', 'Exception', "Unspecified run-time error."),
      ('NotImplementedError', 'RuntimeError', "Method or function hasn't been implemented yet."),
      ('RecursionError', 'RuntimeError', "Recursion limit exceeded."),
    ('SyntaxError', 'Exception', "Invalid syntax."),
      ('IndentationError', 'SyntaxError', "Improper indentation."),
        ('TabError', 'IndentationError', "Improper mixture of spaces and tabs."),
    ('SystemError', 'Exception', "Internal error in the Python interpreter.\n\nPlease report this to the Python maintainer, along with the traceback,\nthe Python version, and the hardware/OS platform and version."),
    ('TypeError', 'Exception', "Inappropriate argument type."),
    ('ValueError', 'Exception', "Inappropriate argument value (of correct type)."),
      ('UnicodeError', 'ValueError', "Unicode related error."),
        ('UnicodeDecodeError', 'UnicodeError', "Unicode decoding error."),
        ('UnicodeEncodeError', 'UnicodeError', "Unicode encoding error."),
        ('UnicodeTranslateError', 'UnicodeError', "Unicode translation error."),
    ('Warning', 'Exception', "Base class for warning categories."),
      ('DeprecationWarning', 'Warning', "Base class for warnings about deprecated features."),
      ('PendingDeprecationWarning', 'Warning', "Base class for warnings about features which will be deprecated\nin the future."),
      ('RuntimeWarning', 'Warning', "Base class for warnings about dubious runtime behavior."),
      ('SyntaxWarning', 'Warning', "Base class for warnings about dubious syntax."),
      ('UserWarning', 'Warning', "Base class for warnings generated by user code."),
      ('FutureWarning', 'Warning', "Base class for warnings about constructs that will change semantically\nin the future."),
      ('ImportWarning', 'Warning', "Base class for warnings about probable mistakes in module imports"),
      ('UnicodeWarning', 'Warning', "Base class for warnings about Unicode related problems, mostly\nrelated to conversion problems."),
      ('BytesWarning', 'Warning', "Base class for warnings about bytes and buffer related problems, mostly\nrelated to conversion from str or comparing to str."),
      ('ResourceWarning', 'Warning', "Base class for warnings about resource usage."),
]

# ------
# Shared
# ------

def is_final(name):
  'If there exists any exception with us as base then we are not final'

  for _, base, __ in data:
    if base == name:
      return False

  return True

def print_header():
  print('''\
// In CPython:
// Objects -> exceptions.c
// Lib->test->exception_hierarchy.txt <-- this is amazing
// https://docs.python.org/3.7/library/exceptions.html
// https://docs.python.org/3.7/c-api/exceptions.html
''')

# -----------------
# Class definitions
# -----------------

def print_class_definitions():
  print_header()
  print('''\
// swiftlint:disable file_length
// swiftlint:disable trailing_newline
''')

  for name, base, doc in data:
    if name == 'BaseException':
      continue

    doc = doc.replace('\n', ' " +\n"')
    final = 'final ' if is_final(name) else ''
    builtins_type_variable = get_builtins_type_property_name(name)

    print(f'''\
// MARK: - {name}

// sourcery: pyerrortype = {name}, default, baseType, hasGC
public {final}class Py{name}: Py{base} {{

  override internal class var doc: String {{
    return "{doc}"
  }}

  override public var description: String {{
    return "Py{name}()"
  }}

  override internal func setType() {{
    self.setType(to: Py.errorTypes.{builtins_type_variable})
  }}

   // sourcery: pyproperty = __class__
   override internal func getClass() -> PyType {{
     return self.type
   }}

   // sourcery: pyproperty = __dict__
   override internal func getDict() -> Attributes {{
     return self.attributes
   }}

  // sourcery: pymethod = __new__
  override internal class func pyNew(type: PyType,
                                     args: [PyObject],
                                     kwargs: PyDictData?) -> PyResult<PyObject> {{
    let argsTuple = Py.newTuple(args)
    return .value(Py{name}(args: argsTuple))
  }}

  // sourcery: pymethod = __init__
  internal class func pyInit(zelf: Py{name},
                             args: [PyObject],
                             kwargs: PyDictData?) -> PyResult<PyNone> {{
    return PyBaseException.pyInitShared(zelf: zelf, args: args, kwargs: kwargs)
  }}
}}
''')

# ----------------
# Type definitions
# ----------------

def print_type_definitions():
  print_header()
  print('''\
// swiftlint:disable line_length
// swiftlint:disable function_body_length
// swiftlint:disable trailing_comma

public final class BuiltinErrorTypes {
''')

  for name, base, doc in data:
    property_name = get_builtins_type_property_name(name)
    print(f'  public let {property_name}: PyType')

  print()
  print('  /// Init that will only initialize properties.')
  print('  internal init() {')
  print('    let types = Py.types')

  for name, base, doc in data:
    property_name = get_builtins_type_property_name(name)

    if name == 'BaseException':
      base_name = 'types.object'
    else:
      base_name = 'self.' + get_builtins_type_property_name(base)

    print(f'    self.{property_name} = PyType.initBuiltinType(name: "{name}", type: types.type, base: { base_name })')
  print('  }')
  print()

  print('/// This function finalizes init of all of the stored types.')
  print('/// (see comment at the top of this file)')
  print('///')
  print('/// For example it will:')
  print('/// - set type flags')
  print('/// - add `__doc__`')
  print('/// - fill `__dict__`')
  print('  internal func fill__dict__() {')
  for name, base, doc in data:
    property_name = get_builtins_type_property_name(name)
    method_name = get_builtins_type_property_name(name)
    print(f'    FillTypes.{method_name}(self.{property_name})')
  print('  }')
  print()

  print('  internal var all: [PyType] {')
  print('    return [')
  for name, base, doc in data:
    property_name = get_builtins_type_property_name(name)
    print(f'      self.{property_name},')
  print('    ]')
  print('  }')

  print('}')

def get_builtins_type_property_name(name):
  if name == 'OSError':
    return 'osError'

  if name == 'EOFError':
    return 'eofError'

  return name[0].lower() + name[1:]

# ----
# Main
# ----

if __name__ == '__main__':
  if len(sys.argv) < 2:
    print("Usage: 'python3 errors.py [class-definitions|types]'")
    sys.exit(1)

  mode = sys.argv[1]
  if mode == 'class-definitions':
    print_class_definitions()
  elif mode == 'types':
    print_type_definitions()
  else:
    print(f"Invalid argument '{mode}' passed to 'errors.py'.")
