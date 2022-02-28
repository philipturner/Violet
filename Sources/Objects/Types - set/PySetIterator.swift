import VioletCore

// cSpell:ignore setobject

// In CPython:
// Objects -> setobject.c

// sourcery: pytype = set_iterator, isDefault, hasGC
public struct PySetIterator: PyObjectMixin {

  // sourcery: pytypedoc
  internal static let doc: String? = nil

  internal enum Layout {
    internal static let setOffset = SizeOf.objectHeader
    internal static let setSize = SizeOf.anySet

    internal static let indexOffset = setOffset + setSize
    internal static let indexSize = SizeOf.int

    internal static let initialCountOffset = indexOffset + indexSize
    internal static let initialCountSize = SizeOf.int

    internal static let size = initialCountOffset + initialCountSize
  }

  private var setPtr: Ptr<PyAnySet> { self.ptr[Layout.setOffset] }
  private var indexPtr: Ptr<Int> { self.ptr[Layout.indexOffset] }
  private var initialCountPtr: Ptr<Int> { self.ptr[Layout.initialCountOffset] }

  internal var set: PyAnySet { self.setPtr.pointee }
  internal var index: Int { self.indexPtr.pointee }
  internal var initialCount: Int { self.initialCountPtr.pointee }

  public let ptr: RawPtr

  public init(ptr: RawPtr) {
    self.ptr = ptr
  }

  internal func initialize(type: PyType, set: PyAnySet) {
    let initialCount = set.elements.count
    self.header.initialize(type: type)
    self.setPtr.initialize(to: set)
    self.indexPtr.initialize(to: 0)
    self.initialCountPtr.initialize(to: initialCount)
  }

  internal static func deinitialize(ptr: RawPtr) {
    let zelf = PySetIterator(ptr: ptr)
    zelf.header.deinitialize()
    zelf.setPtr.deinitialize()
    zelf.indexPtr.deinitialize()
    zelf.initialCountPtr.deinitialize()
  }

  internal static func createDebugString(ptr: RawPtr) -> String {
    let zelf = PySetIterator(ptr: ptr)
    return "PySetIterator(type: \(zelf.typeName), flags: \(zelf.flags))"
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
    return self
  }

  // MARK: - Next

  // sourcery: pymethod = __next__
  internal func next() -> PyResult<PyObject> {
    let currentCount = self.set.elements.count
    guard currentCount == self.initialCount else {
      self.index = -1 // Make this state sticky
      return .runtimeError("Set changed size during iteration")
    }

    let entries = self.set.elements.dict.entries
    while self.index < entries.count {
      let entry = entries[self.index]

      // Increment index NOW, so that the regardless of whether we return 'entry'
      // or iterate more we move to next element.
      self.index += 1

      switch entry {
      case .entry(let e):
        let result = e.key.object
        return .value(result)
      case .deleted:
        break // move to next element
      }
    }

    return .error(Py.newStopIteration())
  }

  // MARK: - Length hint

  // sourcery: pymethod = __length_hint__
  internal func lengthHint() -> PyInt {
    let count = self.set.elements.count
    let result = count - self.index
    return Py.newInt(result)
  }

  // MARK: - Python new

  // sourcery: pystaticmethod = __new__
  internal class func pyNew(type: PyType,
                            args: [PyObject],
                            kwargs: PyDict?) -> PyResult<PySetIterator> {
    return .typeError("cannot create 'set_iterator' instances")
  }
}

*/
