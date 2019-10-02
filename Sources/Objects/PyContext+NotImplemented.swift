import Core

public enum CompareMode {
  case equal
  case notEqual
  case less
  case lessEqual
  case greater
  case greaterEqual
}

extension PyContext {

  @discardableResult
  internal func unimplemented() -> PyObject {
    return self.none
  }

  public func _PyUnicode_JoinArray(elements: [PyObject]) -> PyObject {
    return self.unimplemented()
  }

  public func getSizeInt(value: PyObject) -> Int {
    return 0
  }

  internal func hash(value: PyObject) throws -> PyHash {
    return 0
  }

  internal func _PyType_Name(value: PyType) -> String {
    return value.name
  }

  internal func PyType_IsSubtype(parent: PyType, subtype: PyType) -> Bool {
    return false
  }

  internal func PyUnicode_FromFormat(format: String, args: Any...) -> String {
    return ""
  }

  public func PyObject_Format(value: PyObject, format: PyObject) -> PyObject {
    return self.unimplemented()
  }

  public func Py_CLEAR(value: PyObject) throws { }

  public func pySlice_New(start: PyObject, stop: PyObject, step: PyObject?) -> PyObject {
    return start
  }
}
