import Foundation
import Core

// In CPython:
// Objects -> typeobject.c

/// Root of the Object hierarchy (kind of important thingie).
/// Under the hood it is just a special type with fancy dict.
internal enum PyBaseObject {

  internal static let doc: String = """
    object()
    --

    The most base type
    """

  // MARK: - Equatable

  // sourcery: pymethod = __eq__
  internal static func isEqual(zelf: PyObject,
                               other: PyObject) -> PyResultOrNot<Bool> {
    return zelf === other ? .value(true) : .notImplemented
  }

  // sourcery: pymethod = __ne__
  internal static func isNotEqual(zelf: PyObject,
                                  other: PyObject) -> PyResultOrNot<Bool> {
    let isEqual = PyBaseObject.isEqual(zelf: zelf, other: other)
    return NotEqualHelper.fromIsEqual(isEqual)
  }

  // MARK: - Comparable

  // sourcery: pymethod = __lt__
  internal static func isLess(zelf: PyObject,
                              other: PyObject) -> PyResultOrNot<Bool> {
    return .notImplemented
  }

  // sourcery: pymethod = __le__
  internal static func isLessEqual(zelf: PyObject,
                                   other: PyObject) -> PyResultOrNot<Bool> {
    return .notImplemented
  }

  // sourcery: pymethod = __gt__
  internal static func isGreater(zelf: PyObject,
                                 other: PyObject) -> PyResultOrNot<Bool> {
    return .notImplemented
  }

  // sourcery: pymethod = __ge__
  internal static func isGreaterEqual(zelf: PyObject,
                                      other: PyObject) -> PyResultOrNot<Bool> {
    return .notImplemented
  }

  // MARK: - Hashable

  // sourcery: pymethod = __hash__
  internal static func hash(zelf: PyObject) -> PyResultOrNot<PyHash> {
    let id = ObjectIdentifier(zelf)
    return .value(HashHelper.hash(id))
  }

  // MARK: - String

  // sourcery: pymethod = __repr__
  internal static func repr(zelf: PyObject) -> String {
    switch zelf.type.getModuleRaw() {
    case .builtins:
      return "<\(zelf.typeName) object at \(zelf.ptrString)>"
    case let .external(module):
      return "<\(module).\(zelf.typeName) object at \(zelf.ptrString)>"
    }
  }

  // sourcery: pymethod = __str__
  internal static func str(zelf: PyObject) -> String {
    return PyBaseObject.repr(zelf: zelf)
  }

  // sourcery: pymethod = __format__
  internal static func format(zelf: PyObject, spec: PyObject) -> PyResult<String> {
    if let spec = spec as? PyString, spec.value.isEmpty {
      return .value(PyBaseObject.str(zelf: zelf))
    }

    return .error(
      .typeError("unsupported format string passed to \(zelf.typeName).__format__")
    )
  }

  // MARK: - Class

  // sourcery: pymethod = __class_
  internal static func getClass(zelf: PyObject) -> PyType {
    return zelf.type
  }

  // MARK: - Dir

  // sourcery: pymethod = __dir__
  internal static func dir(zelf: PyObject) -> [String:PyObject] {
    // TODO: Finish this (add own attributes)
    return zelf.type.dir()
  }

  // MARK: - Attributes

  // sourcery: pymethod = __getattribute__
  internal static func getAttribute(zelf: PyObject,
                                    name: PyObject) -> PyResult<PyObject> {
    return AttributeHelper.genericGetAttributeWithDict(zelf: zelf,
                                                       name: name,
                                                       dict: nil)
  }

  // sourcery: pymethod = __setattr__
  internal static func setAttribute(zelf: PyObject,
                                    name: PyObject,
                                    value: PyObject) -> PyResult<()> {
    return AttributeHelper.genericSetAttributeWithDict(zelf: zelf,
                                                       name: name,
                                                       value: value,
                                                       dict: nil)
  }

  // sourcery: pymethod = __delattr__
  internal static func delAttribute(zelf: PyObject,
                                    name: PyObject) -> PyResult<()> {
    let none = zelf.context.none
    return PyBaseObject.setAttribute(zelf: zelf, name: name, value: none)
  }

  // MARK: - Subclasshook

  // sourcery: pymethod = __subclasshook__
  /// Abstract classes can override this to customize issubclass().
  /// This is invoked early on by abc.ABCMeta.__subclasscheck__().
  /// It should return True, False or NotImplemented.  If it returns
  /// NotImplemented, the normal algorithm is used.  Otherwise, it
  /// overrides the normal algorithm (and the outcome is cached).
  internal static func subclasshook(zelf: PyObject) -> PyResultOrNot<PyObject> {
    return .notImplemented
  }

  // MARK: - Init subclass

  // sourcery: pymethod = __init_subclass__
  /// This method is called when a class is subclassed.
  /// The default implementation does nothing.
  /// It may be overridden to extend subclasses.
  internal static func initSubclass(zelf: PyObject) -> PyResultOrNot<PyObject> {
    return .value(zelf.context._none)
  }
}
