from Exception_hierarchy import data
from Sourcery import get_types
from Common.strings import (generated_warning, where_to_find_errors_in_cpython)
from Builtin_types import (
    get_property_name_escaped, print_property, print_set_property,
    print_type_mark,
    get_fill_function_name, print_fill_function, print_fill_helpers,
    print_castSelf_functions
)


if __name__ == '__main__':
    print(f'''\
{generated_warning(__file__)}

import VioletCore

// swiftlint:disable line_length
// swiftlint:disable function_body_length
// swiftlint:disable trailing_comma
// swiftlint:disable vertical_whitespace_closing_braces
// swiftlint:disable file_length

{where_to_find_errors_in_cpython}

// Just like 'BuiltinTypes' this will be 2 phase init.
// See 'BuiltinTypes' for reasoning.\
''')

    print('public final class BuiltinErrorTypes {')
    print()

    all_types = get_types()

    def get_type(e):
        python_type = e.class_name
        for t in all_types:
            if t.python_type_name == python_type:
                return t

        assert False, f"Type not found: '{python_type}'"

    # Errors in 'data' are in the correct order (parent is before its subclasses).
    types = list(map(get_type, data))

    # ==================
    # === Properties ===
    # ==================

    print('  // MARK: - Properties')
    print()

    for t in types:
        print_property(t)

    print()

    # ============
    # === Init ===
    # ============

    print('  // MARK: - Stage 1 - init')
    print()

    print('  /// Init that will only initialize properties.')
    print('  internal init() {')

    for index, t in enumerate(types):
        if index != 0:
            print()

        print_set_property(t, types)

    print('  }')
    print()

    # ====================
    # === fill__dict__ ===
    # ====================

    print('  // MARK: - Stage 2 - fill __dict__')
    print()

    print('''\
  /// This function finalizes init of all of the stored types.
  /// (see comment at the top of this file)
  ///
  /// For example it will:
  /// - set type flags
  /// - add `__doc__`
  /// - fill `__dict__`
  internal func fill__dict__() {\
''')

    for t in types:
        python_type_name = t.python_type_name
        fill_function = get_fill_function_name(t)
        print(f'    self.{fill_function}()')

    print('  }')
    print()

    # ===========
    # === all ===
    # ===========

    print('  // MARK: - All')
    print()

    print('''\
  internal var all: [PyType] {
    return [\
''')

    for t in types:
        python_type_name = t.python_type_name
        property_name_escaped = get_property_name_escaped(python_type_name)
        print(f'      self.{property_name_escaped},')

    print('    ]')
    print('  }')
    print()

    # ============================
    # === fill__dict__ methods ===
    # ============================

    print_fill_helpers()

    for t in types:
        print_type_mark(t)
        print_fill_function(t)
        print_castSelf_functions(t)

    print('}')
