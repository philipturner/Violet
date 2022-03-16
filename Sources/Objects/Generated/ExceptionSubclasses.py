from typing import Dict, List, Optional
from Helpers import generated_warning, where_to_find_errors_in_cpython, exception_hierarchy
from Sourcery import (
    TypeInfo, SwiftInitializerInfo, get_types
)

# Some exceptions will be implemented by hand.
MANUALLY_IMPLEMENTED = [
    'BaseException',
    'KeyError',  # Custom '__str__' method
    'StopIteration',  # 'value' property
    'SystemExit',  # 'code' property
    'ImportError',  # tons of customization (msg, name, path)
    'SyntaxError',  # another ton of customization (msg, filename, lineno, offset, text, print_file_and_line)
]

if __name__ == '__main__':
    print(f'''\
{generated_warning(__file__)}

// swiftlint:disable line_length
// swiftlint:disable trailing_newline
// swiftlint:disable function_parameter_count
// swiftlint:disable file_length

{where_to_find_errors_in_cpython}\
''')

    all_types = get_types()
    python_name_to_type: Dict[str, TypeInfo] = {}
    for t in all_types:
      python_name_to_type[t.python_type_name] = t

    for t in exception_hierarchy:
        python_type_name = t.type_name
        python_base_type_name = t.base_type_name

        if python_type_name in MANUALLY_IMPLEMENTED:
            continue

        swift_type_name = 'Py' + python_type_name
        swift_base_type_name = 'Py' + python_base_type_name

        doc = t.doc.replace('\n', '\\n" +\n"')
        py_memory_function_name = 'new' + python_type_name

        # ==============
        # === Header ===
        # ==============

        print(f'''
// MARK: - {python_type_name}

// sourcery: pyerrortype = {python_type_name}, pybase = {python_base_type_name}, isDefault, isBaseType, hasGC
// sourcery: isBaseExceptionSubclass, instancesHave__dict__
public struct {swift_type_name}: PyErrorMixin {{

  // sourcery: pytypedoc
  internal static let doc = "{doc}"

  public let ptr: RawPtr

  public init(ptr: RawPtr) {{
    self.ptr = ptr
  }}\
''')

        # ==================
        # === Initialize ===
        # ==================

        # We have to copy the base class init 1:1.
        base_type = python_name_to_type[t.base_type_name]
        for fn in base_type.swift_initializers:
            print()
            print(f'  internal func initialize(', end='')

            arguments: List[str] = []
            call_arguments: List[str] = []
            for arg in fn.arguments:
                label = '' if arg.label is None else arg.label + ' '
                default = '' if arg.default_value is None else ' = ' + arg.default_value
                arguments.append(f'{label}{arg.name}: {arg.typ}{default}')

                if arg.label == '_':
                    call_label = ''
                elif arg.label:
                    call_label = arg.label + ': '
                else:
                    call_label = arg.name + ': '

                call_arguments.append(f'{call_label}{arg.name}')

            for index, arg in enumerate(arguments):
                is_first = index == 0
                is_last = index == len(arguments) - 1

                indent = '' if is_first else (27 * ' ')
                end = ') {\n' if is_last else ',\n'
                print(f'{indent}{arg}', end=end)

            print(f'    self.initializeBase(', end='')
            for index, arg in enumerate(call_arguments):
                is_first = index == 0
                is_last = index == len(call_arguments) - 1

                indent = '' if is_first else (24 * ' ')
                end = ')\n' if is_last else ',\n'
                print(f'{indent}{arg}', end=end)

            print(f'  }}')

        # ====================
        # === Deinitialize ===
        # ====================

        print()
        print('  // Nothing to do here.')
        print('  internal func beforeDeinitialize() { }')

        # =============
        # === Debug ===
        # =============

        print()
        print(f'  internal static func createDebugString(ptr: RawPtr) -> String {{')
        print(f'    let zelf = PyStopIteration(ptr: ptr)')
        print(f'    return "{swift_type_name}(type: \(zelf.typeName), flags: \(zelf.flags))"')
        print(f'  }}')

        # ===============
        # === Methods ===
        # ===============

        print(f'''
  // sourcery: pyproperty = __class__
  internal static func __class__(_ py: Py, zelf: PyObject) -> PyType {{
    return zelf.type
  }}

  // sourcery: pyproperty = __dict__
  internal static func __dict__(_ py: Py, zelf: PyObject) -> PyResult<PyObject> {{
    guard let zelf = Self.downcast(py, zelf) else {{
      return Self.invalidZelfArgument(py, zelf, "__dict__")
    }}

    let result = zelf.asBaseException.getDict(py)
    return PyResult(result)
  }}

  // sourcery: pystaticmethod = __new__
  internal static func __new__(_ py: Py,
                               type: PyType,
                               args: [PyObject],
                               kwargs: PyDict?) -> PyResult<PyObject> {{
    let argsTuple = py.newTuple(elements: args)
    let result = py.memory.{py_memory_function_name}(py, type: type, args: argsTuple)
    return PyResult(result)
  }}

  // sourcery: pymethod = __init__
  internal static func __init__(_ py: Py,
                                zelf: PyObject,
                                args: [PyObject],
                                kwargs: PyDict?) -> PyResult<PyObject> {{
    guard let zelf = Self.downcast(py, zelf) else {{
      return Self.invalidZelfArgument(py, zelf, "__init__")
    }}

    let zelfAsObject = zelf.asObject
    return {swift_base_type_name}.__init__(py, zelf: zelfAsObject, args: args, kwargs: kwargs)
  }}
}}\
''')

    print()
