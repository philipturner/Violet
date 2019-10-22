import Core

// In CPython:
// Objects -> listobject.c
// https://docs.python.org/3.7/c-api/list.html

// swiftlint:disable yoda_condition

// sourcery: pytype = list
/// This subtype of PyObject represents a Python list object.
internal final class PyList: PyObject, GenericNotEqual {

  internal static let doc: String = """
    list(iterable=(), /)
    --

    Built-in mutable sequence.

    If no argument is given, the constructor creates a new empty list.
    The argument must be an iterable if specified.
    """

  internal var elements: [PyObject]

  // MARK: - Init

  internal init(_ context: PyContext, elements: [PyObject]) {
    self.elements = elements
    super.init(type: context.types.list)
  }

  // MARK: - Equatable

  // sourcery: pymethod = __eq__
  internal func isEqual(_ other: PyObject) -> EquatableResult {
    guard let other = other as? PyList else {
      return .notImplemented
    }

    return SequenceHelper.isEqual(context: self.context,
                                  left: self.elements,
                                  right: other.elements)
  }

  // sourcery: pymethod = __ne__
  func isNotEqual(_ other: PyObject) -> EquatableResult {
    return self.genericIsNotEqual(other)
  }

  // MARK: - Comparable

  // sourcery: pymethod = __lt__
  internal func isLess(_ other: PyObject) -> ComparableResult {
    guard let other = other as? PyList else {
      return .notImplemented
    }

    return SequenceHelper.isLess(context: self.context,
                                 left: self.elements,
                                 right: other.elements)
  }

  // sourcery: pymethod = __le__
  internal func isLessEqual(_ other: PyObject) -> ComparableResult {
    guard let other = other as? PyList else {
      return .notImplemented
    }

    return SequenceHelper.isLessEqual(context: self.context,
                                      left: self.elements,
                                      right: other.elements)
  }

  // sourcery: pymethod = __gt__
  internal func isGreater(_ other: PyObject) -> ComparableResult {
    guard let other = other as? PyList else {
      return .notImplemented
    }

    return SequenceHelper.isGreater(context: self.context,
                                    left: self.elements,
                                    right: other.elements)
  }

  // sourcery: pymethod = __ge__
  internal func isGreaterEqual(_ other: PyObject) -> ComparableResult {
    guard let other = other as? PyList else {
      return .notImplemented
    }

    return SequenceHelper.isGreaterEqual(context: self.context,
                                         left: self.elements,
                                         right: other.elements)
  }

  // MARK: - String

  // sourcery: pymethod = __repr__
  internal func repr() -> String {
    if self.elements.isEmpty {
      return "[]"
    }

    if self.hasReprLock {
      return "[...]"
    }

    return self.withReprLock {
      var result = "["
      for (index, element) in self.elements.enumerated() {
        if index > 0 {
          result += ", " // so that we don't have ', )'.
        }

        result += self.context._repr(value: element)
      }

      result += self.elements.count > 1 ? "]" : ",]"
      return result
    }
  }

  // MARK: - Sequence

  // sourcery: pymethod = __len__
  internal func getLength() -> BigInt {
    return BigInt(self.elements.count)
  }

  // sourcery: pymethod = __contains__
  internal func contains(_ element: PyObject) -> Bool {
    return SequenceHelper.contains(context: self.context,
                                   elements: self.elements,
                                   element: element)
  }

  // sourcery: pymethod = __getitem__
  internal func getItem(at index: PyObject) -> GetItemResult<PyObject> {
    return SequenceHelper.getItem(context: self.context,
                                  elements: self.elements,
                                  index: index,
                                  canIndexFromEnd: true,
                                  typeName: "list")
  }

  // sourcery: pymethod = count
  internal func count(_ element: PyObject) -> CountResult {
    return SequenceHelper.count(context: self.context,
                                elements: self.elements,
                                element: element)
  }

  // sourcery: pymethod = index
  internal func getIndex(of element: PyObject) -> PyResult<BigInt> {
    return SequenceHelper.getIndex(context: self.context,
                                   elements: self.elements,
                                   element: element,
                                   typeName: "list")
  }

  // sourcery: pymethod = append
  internal func append(_ element: PyObject) {
    self.elements.append(element)
  }

  // sourcery: pymethod = extend
  internal func extend(_ iterator: PyObject) {
    // Check if implementatio is OK with 'addInPlace'
    // TODO: Write this - list_extend(PyListObject *self, PyObject *iterable)
  }

  internal func pop(index: BigInt = -1) -> PyResult<PyObject> {
    if self.elements.isEmpty {
      return .error(.indexError("pop from empty list"))
    }

    var index = index
    if index < 0 {
      index += BigInt(self.elements.count)
    }

    guard let indexInt = Int(exactly: index) else {
      return .error(.indexError("pop index out of range"))
    }

    guard 0 <= indexInt && indexInt < self.elements.count else {
      return .error(.indexError("pop index out of range"))
    }

    guard let last = self.elements.popLast() else {
      return .error(.indexError("pop index out of range"))
    }

    return .value(last)
  }

  // sourcery: pymethod = clear
  internal func clear() {
    self.elements.removeAll()
  }

  // sourcery: pymethod = copy
  internal func copy() -> PyList {
    return self.list(self.elements)
  }

  // MARK: - Add

  // sourcery: pymethod = __add__
  internal func add(_ other: PyObject) -> AddResult<PyObject> {
    guard let otherList = other as? PyList else {
      return .error(
        .typeError("can only concatenate list (not '\(other.typeName)') to list")
      )
    }

    let result = self.elements + otherList.elements
    return .value(self.list(result))
  }

  // sourcery: pymethod = __iadd__
  internal func addInPlace(_ other: PyObject) -> AddResult<PyObject> {
    self.extend(other)
    return .value(self)
  }

  // MARK: - Mul

  // sourcery: pymethod = __mul__
  internal func mul(_ other: PyObject) -> MulResult<PyObject> {
    return SequenceHelper
      .mul(elements: self.elements, count: other)
      .map(self.list)
  }

  // sourcery: pymethod = __rmul__
  internal func rmul(_ other: PyObject) -> MulResult<PyObject> {
    return SequenceHelper
      .rmul(elements: self.elements, count: other)
      .map(self.list)
  }

  // sourcery: pymethod = __imul__
  internal func mulInPlace(_ other: PyObject) -> MulResult<PyObject> {
    return SequenceHelper
      .mul(elements: self.elements, count: other)
      .map { elements -> PyList in
        self.elements = elements
        return self
      }
  }
}
