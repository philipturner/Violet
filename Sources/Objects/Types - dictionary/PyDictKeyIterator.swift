import VioletCore

// cSpell:ignore dictobject

// In CPython:
// Objects -> dictobject.c

// sourcery: pytype = dict_keyiterator, isDefault, hasGC
public final class PyDictKeyIterator: PyObject, AbstractDictViewIterator {

  // sourcery: pytypedoc
  internal static let doc: String? = nil

  internal let dict: PyDict
  internal var index: Int
  internal let initialCount: Int

  override public var description: String {
    return "PyDictKeyIterator(count: \(self.dict.elements.count))"
  }

  // MARK: - Init

  internal init(dict: PyDict) {
    self.dict = dict
    self.index = 0
    self.initialCount = dict.elements.count
    super.init(type: Py.types.dict_keyiterator)
  }

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
      return .value(key)
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
                            kwargs: PyDict?) -> PyResult<PyDictKeyIterator> {
    return .typeError("cannot create 'dict_keyiterator' instances")
  }
}
