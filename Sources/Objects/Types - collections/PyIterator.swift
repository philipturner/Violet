import BigInt
import VioletCore

// cSpell:ignore iterobject

// In CPython:
// Objects -> iterobject.c

// sourcery: pytype = iterator, isDefault, hasGC
public struct PyIterator: PyObjectMixin {

  // sourcery: pytypedoc
  internal static let doc: String? = nil

  private static let endIndex = -1

  // sourcery: includeInLayout
  internal var sequence: PyObject { self.sequencePtr.pointee }

  // sourcery: includeInLayout
  internal var index: Int {
    get { self.indexPtr.pointee }
    nonmutating set { self.indexPtr.pointee = newValue }
  }

  public let ptr: RawPtr

  public init(ptr: RawPtr) {
    self.ptr = ptr
  }

  internal func initialize(_ py: Py, type: PyType, sequence: PyObject) {
    self.header.initialize(py, type: type)
    self.sequencePtr.initialize(to: sequence)
    self.indexPtr.initialize(to: 0)
  }

  // Nothing to do here.
  internal func beforeDeinitialize() { }

  internal static func createDebugString(ptr: RawPtr) -> String {
    let zelf = PyIterator(ptr: ptr)
    return "PyIterator(type: \(zelf.typeName), flags: \(zelf.flags))"
  }

  // MARK: - Class

  // sourcery: pyproperty = __class__
  internal static func __class__(_ py: Py, zelf: PyObject) -> PyType {
    return zelf.type
  }

  // MARK: - Attributes

  // sourcery: pymethod = __getattribute__
  internal static func __getattribute__(_ py: Py,
                                        zelf: PyObject,
                                        name: PyObject) -> PyResult<PyObject> {
    guard let zelf = Self.downcast(py, zelf) else {
      return Self.invalidZelfArgument(py, zelf, "__getattribute__")
    }

    return AttributeHelper.getAttribute(py, object: zelf.asObject, name: name)
  }

  // MARK: - Iter

  // sourcery: pymethod = __iter__
  internal static func __iter__(_ py: Py, zelf: PyObject) -> PyResult<PyObject> {
    guard let zelf = Self.downcast(py, zelf) else {
      return Self.invalidZelfArgument(py, zelf, "__iter__")
    }

    return PyResult(zelf)
  }

  // MARK: - Next

  // sourcery: pymethod = __next__
  internal static func __next__(_ py: Py, zelf: PyObject) -> PyResult<PyObject> {
    guard let zelf = Self.downcast(py, zelf) else {
      return Self.invalidZelfArgument(py, zelf, "__next__")
    }

    guard zelf.index != Self.endIndex else {
      return .stopIteration(py)
    }

    switch py.getItem(object: zelf.sequence, index: zelf.index) {
    case .value(let o):
      zelf.index += 1
      return .value(o)

    case .error(let e):
      if py.cast.isIndexError(e.asObject) || py.cast.isStopIteration(e.asObject) {
        zelf.index = Self.endIndex
        return .stopIteration(py)
      }

      return .error(e)
    }
  }

  // MARK: - Length hint

  // sourcery: pymethod = __length_hint__
  internal static func __length_hint__(_ py: Py, zelf: PyObject) -> PyResult<PyObject> {
    guard let zelf = Self.downcast(py, zelf) else {
      return Self.invalidZelfArgument(py, zelf, "__length_hint__")
    }

    let len: BigInt
    switch py.lengthBigInt(iterable: zelf.sequence) {
    case let .value(l): len = l
    case let .error(e): return .error(e)
    }

    let result = len - BigInt(zelf.index)
    return PyResult(py, result)
  }
}
