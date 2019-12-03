import Core

// In CPython:
// Objects -> object.c

// sourcery: pytype = NotImplementedType, default
/// `NotImplemented` is an object that can be used to signal that an
/// operation is not implemented for the given type combination.
public class PyNotImplemented: PyObject {

  // MARK: - Init

  internal init(_ context: PyContext) {
    super.init(type: context.builtins.types.notImplemented)
  }

  // MARK: - String

  // sourcery: pymethod = __repr__
  internal func repr() -> PyResult<String> {
    return .value("NotImplemented")
  }

  // MARK: - Class

  // sourcery: pyproperty = __class__
  internal func getClass() -> PyType {
    return self.type
  }

  // MARK: - Reduce

  internal var reduce: String {
    return "NotImplemented"
  }

  // MARK: - Python new/init

  // sourcery: pymethod = __new__
  internal static func new(type: PyType,
                           args: [PyObject],
                           kwargs: PyDictData?) -> PyResult<PyObject> {
    let noKwargs = kwargs?.isEmpty ?? true
    guard args.isEmpty && noKwargs else {
      return .typeError("NotImplementedType takes no arguments")
    }

    return .value(type.builtins.notImplemented)
  }
}
