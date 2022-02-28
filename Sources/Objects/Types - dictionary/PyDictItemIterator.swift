import VioletCore

// cSpell:ignore dictobject

// In CPython:
// Objects -> dictobject.c

// sourcery: pytype = dict_itemiterator, isDefault, hasGC
public struct PyDictItemIterator: PyObjectMixin, AbstractDictViewIterator {

  // sourcery: pytypedoc
  internal static let doc: String? = nil

  internal enum Layout {
    internal static let dictOffset = SizeOf.objectHeader
    internal static let dictSize = SizeOf.object

    internal static let indexOffset = dictOffset + dictSize
    internal static let indexSize = SizeOf.int

    internal static let initialCountOffset = indexOffset + indexSize
    internal static let initialCountSize = SizeOf.int

    internal static let size = initialCountOffset + initialCountSize
  }

  private var dictPtr: Ptr<PyDict> { Ptr(self.ptr, offset: Layout.dictOffset) }
  private var indexPtr: Ptr<Int> { Ptr(self.ptr, offset: Layout.indexOffset) }
  private var initialCountPtr: Ptr<Int> { Ptr(self.ptr, offset: Layout.initialCountOffset) }

  internal var dict: PyDict { self.dictPtr.pointee }
  internal var index: Int { self.indexPtr.pointee }
  internal var initialCount: Int { self.initialCountPtr.pointee }

  public let ptr: RawPtr

  public init(ptr: RawPtr) {
    self.ptr = ptr
  }

  internal func initialize(type: PyType, dict: PyDict) {
    let initialCount = dict.elements.count
    self.header.initialize(type: type)
    self.dictPtr.initialize(to: dict)
    self.indexPtr.initialize(to: 0)
    self.initialCountPtr.initialize(to: initialCount)
  }

  internal static func deinitialize(ptr: RawPtr) {
    let zelf = PyDictItemIterator(ptr: ptr)
    zelf.header.deinitialize()
    zelf.dictPtr.deinitialize()
    zelf.indexPtr.deinitialize()
    zelf.initialCountPtr.deinitialize()
  }

  internal static func createDebugString(ptr: RawPtr) -> String {
    let zelf = PyDictItemIterator(ptr: ptr)
    return "PyDictItemIterator(type: \(zelf.typeName), flags: \(zelf.flags))"
  }
}

/* MARKER

  // MARK: - Class

  // sourcery: pyproperty = __class__
  internal func getClass() -> PyType {
    return self.type
  }

  // MARK: - Attributes

  // sourcery: pymethod = __getattribute__
  internal func getAttribute(name: PyObject) -> PyResult<PyObject> {
    return AttributeHelper.getAttribute(from: self, name: name)
  }

  // MARK: - Iter

  // sourcery: pymethod = __iter__
  internal func iter() -> PyObject {
    return self._iter()
  }

  // MARK: - Next

  // sourcery: pymethod = __next__
  internal func next() -> PyResult<PyObject> {
    switch self._next() {
    case let .value(entry):
      let key = entry.key.object
      let value = entry.value
      let tuple = Py.newTuple(key, value)
      return .value(tuple)
    case let .error(e):
      return .error(e)
    }
  }

  // MARK: - Length hint

  // sourcery: pymethod = __length_hint__
  internal func lengthHint() -> PyInt {
    return self._lengthHint()
  }

  // MARK: - Python new

  // sourcery: pystaticmethod = __new__
  internal class func pyNew(type: PyType,
                            args: [PyObject],
                            kwargs: PyDict?) -> PyResult<PyDictItemIterator> {
    return .typeError("cannot create 'dict_itemiterator' instances")
  }
}

*/
