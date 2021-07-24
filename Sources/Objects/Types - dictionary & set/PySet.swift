import BigInt
import VioletCore

// swiftlint:disable file_length
// cSpell:ignore setobject

// In CPython:
// Objects -> setobject.c
// https://docs.python.org/3.7/c-api/set.html

// sourcery: pytype = set, default, hasGC, baseType
// sourcery: subclassInstancesHave__dict__
/// This subtype of PyObject is used to hold the internal data for both set
/// and frozenset objects.
public final class PySet: PyObject {

  // MARK: - OrderedSet

  internal typealias OrderedSet = VioletObjects.OrderedSet<Element>

  // MARK: - Element

  internal struct Element: PyHashable, CustomStringConvertible {

    internal var hash: PyHash
    internal var object: PyObject

    internal var description: String {
      return "PySet.Element(hash: \(self.hash), object: \(self.object))"
    }

    internal init(hash: PyHash, object: PyObject) {
      self.hash = hash
      self.object = object
    }

    internal func isEqual(to other: Element) -> PyResult<Bool> {
      guard self.hash == other.hash else {
        return .value(false)
      }

      return Py.isEqualBool(left: self.object, right: other.object)
    }
  }

  // MARK: - Properties

  // sourcery: pytypedoc
  internal static let doc = """
    set() -> new empty set object
    set(iterable) -> new set object

    Build an unordered collection of unique elements.
    """

  internal var data: PySetData

  override public var description: String {
    return "PySet(count: \(self.data.count))"
  }

  // MARK: - Init

  internal init(elements: PySet.OrderedSet) {
    self.data = PySetData(elements: elements)
    super.init(type: Py.types.set)
  }

  internal init(type: PyType, elements: PySet.OrderedSet) {
    self.data = PySetData(elements: elements)
    super.init(type: type)
  }

  // MARK: - Equatable

  // sourcery: pymethod = __eq__
  internal func isEqual(_ other: PyObject) -> CompareResult {
    return self.data.isEqual(to: other)
  }

  // sourcery: pymethod = __ne__
  internal func isNotEqual(_ other: PyObject) -> CompareResult {
    // CPython has different implementation here,
    // but in the end it all comes down to:
    return self.isEqual(other).not
  }

  // MARK: - Comparable

  // sourcery: pymethod = __lt__
  internal func isLess(_ other: PyObject) -> CompareResult {
    return self.data.isLess(than: other)
  }

  // sourcery: pymethod = __le__
  internal func isLessEqual(_ other: PyObject) -> CompareResult {
    return self.data.isLessEqual(than: other)
  }

  // sourcery: pymethod = __gt__
  internal func isGreater(_ other: PyObject) -> CompareResult {
    return self.data.isGreater(than: other)
  }

  // sourcery: pymethod = __ge__
  internal func isGreaterEqual(_ other: PyObject) -> CompareResult {
    return self.data.isGreaterEqual(than: other)
  }

  // MARK: - Hashable

  // sourcery: pymethod = __hash__
  internal func hash() -> HashResult {
    return .unhashable(self)
  }

  // MARK: - String

  // sourcery: pymethod = __repr__
  internal func repr() -> PyResult<String> {
    if self.data.isEmpty {
      return .value(self.typeName + "()")
    }

    if self.hasReprLock {
      return .value(self.typeName + "(...)")
    }

    return self.withReprLock {
      let elements = self.data.joinElementsForRepr()
      return elements.map { "{" + $0 + "}" } // no 'self.typeName'!
    }
  }

  // MARK: - Attributes

  // sourcery: pymethod = __getattribute__
  internal func getAttribute(name: PyObject) -> PyResult<PyObject> {
    return AttributeHelper.getAttribute(from: self, name: name)
  }

  // MARK: - Class

  // sourcery: pyproperty = __class__
  internal func getClass() -> PyType {
    return self.type
  }

  // MARK: - Length

  // sourcery: pymethod = __len__
  internal func getLength() -> BigInt {
    return BigInt(self.data.count)
  }

  // MARK: - Contains

  // sourcery: pymethod = __contains__
  internal func contains(object: PyObject) -> PyResult<Bool> {
    return self.data.contains(object: object)
  }

  // MARK: - And

  // sourcery: pymethod = __and__
  internal func and(_ other: PyObject) -> PyResult<PyObject> {
    let result = self.data.and(other: other)
    return self.createSet(result: result)
  }

  // sourcery: pymethod = __rand__
  internal func rand(_ other: PyObject) -> PyResult<PyObject> {
    return self.and(other)
  }

  // MARK: - Or

  // sourcery: pymethod = __or__
  internal func or(_ other: PyObject) -> PyResult<PyObject> {
    let result = self.data.or(other: other)
    return self.createSet(result: result)
  }

  // sourcery: pymethod = __ror__
  internal func ror(_ other: PyObject) -> PyResult<PyObject> {
    return self.or(other)
  }

  // MARK: - Xor

  // sourcery: pymethod = __xor__
  internal func xor(_ other: PyObject) -> PyResult<PyObject> {
    let result = self.data.xor(other: other)
    return self.createSet(result: result)
  }

  // sourcery: pymethod = __rxor__
  internal func rxor(_ other: PyObject) -> PyResult<PyObject> {
    return self.xor(other)
  }

  // MARK: - Sub

  // sourcery: pymethod = __sub__
  internal func sub(_ other: PyObject) -> PyResult<PyObject> {
    let result = self.data.sub(other: other)
    return self.createSet(result: result)
  }

  // sourcery: pymethod = __rsub__
  internal func rsub(_ other: PyObject) -> PyResult<PyObject> {
    let result = self.data.rsub(other: other)
    return self.createSet(result: result)
  }

  // MARK: - Subset

  internal static let isSubsetDoc = """
    Report whether another set contains this set.
    """

  // sourcery: pymethod = issubset, doc = isSubsetDoc
  internal func isSubset(of other: PyObject) -> PyResult<Bool> {
    return self.data.isSubset(of: other)
  }

  // MARK: - Superset

  internal static let isSupersetDoc = """
    Report whether this set contains another set.
    """

  // sourcery: pymethod = issuperset, doc = isSupersetDoc
  internal func isSuperset(of other: PyObject) -> PyResult<Bool> {
    return self.data.isSuperset(of: other)
  }

  // MARK: - Intersection

  internal static let intersectionDoc = """
    Return the intersection of two sets as a new set.

    (i.e. all elements that are in both sets.)
    """

  // sourcery: pymethod = intersection, doc = intersectionDoc
  internal func intersection(with other: PyObject) -> PyResult<PyObject> {
    let result = self.data.intersection(with: other)
    return self.createSet(result: result)
  }

  // MARK: - Union

  internal static let unionDoc = """
    Return the union of sets as a new set.

    (i.e. all elements that are in either set.)
    """

  // sourcery: pymethod = union, doc = unionDoc
  internal func union(with other: PyObject) -> PyResult<PyObject> {
    let result = self.data.union(with: other)
    return self.createSet(result: result)
  }

  // MARK: - Difference

  internal static let differenceDoc = """
    Return the difference of two or more sets as a new set.

    (i.e. all elements that are in this set but not the others.)
    """

  // sourcery: pymethod = difference, doc = differenceDoc
  internal func difference(with other: PyObject) -> PyResult<PyObject> {
    let result = self.data.difference(with: other)
    return self.createSet(result: result)
  }

  // MARK: - Symmetric difference

  internal static let symmetricDifferenceDoc = """
    Return the symmetric difference of two sets as a new set.

    (i.e. all elements that are in exactly one of the sets.
    """

  // sourcery: pymethod = symmetric_difference, doc = symmetricDifferenceDoc
  internal func symmetricDifference(with other: PyObject) -> PyResult<PyObject> {
    let result = self.data.symmetricDifference(with: other)
    return self.createSet(result: result)
  }

  // MARK: - Is disjoint

  internal static let isDisjointDoc = """
    Return True if two sets have a null intersection.
    """

  // sourcery: pymethod = isdisjoint, doc = isDisjointDoc
  internal func isDisjoint(with other: PyObject) -> PyResult<Bool> {
    return self.data.isDisjoint(with: other)
  }

  // MARK: - Add

  internal static let addDoc = """
    Add an element to a set.

    This has no effect if the element is already present.
    """

  // sourcery: pymethod = add, doc = addDoc
  internal func add(object: PyObject) -> PyResult<PyNone> {
    return self.data.add(object: object)
  }

  // MARK: - Update

  internal static let updateDoc = """
    Update a set with the union of itself and others.
    """

  // sourcery: pymethod = update, doc = updateDoc
  internal func update(from other: PyObject) -> PyResult<PyNone> {
    return self.data.update(from: other)
  }

  // MARK: - Remove

  internal static let removeDoc = """
    Remove an element from a set; it must be a member.

    If the element is not a member, raise a KeyError.
    """

  // sourcery: pymethod = remove, doc = removeDoc
  internal func remove(object: PyObject) -> PyResult<PyNone> {
    return self.data.remove(object: object)
  }

  // MARK: - Discard

  internal static let discardDoc = """
    Remove an element from a set if it is a member.

    If the element is not a member, do nothing.
    """

  // sourcery: pymethod = discard, doc = discardDoc
  internal func discard(object: PyObject) -> PyResult<PyNone> {
    return self.data.discard(object: object)
  }

  // MARK: - Clear

  internal static let clearDoc = """
    Remove all elements from this set.
    """

  // sourcery: pymethod = clear, doc = clearDoc
  internal func clear() -> PyNone {
    return self.data.clear()
  }

  // MARK: - Copy

  internal static let copyDoc = "Return a shallow copy of a set."

  // sourcery: pymethod = copy, doc = copyDoc
  internal func copy() -> PyObject {
    return self.createSet(data: self.data)
  }

  // MARK: - Pop

  internal static let popDoc = """
    Remove and return an arbitrary set element.
    Raises KeyError if the set is empty.
    """

  // sourcery: pymethod = pop, doc = popDoc
  internal func pop() -> PyResult<PyObject> {
    return self.data.pop()
  }

  // MARK: - Iter

  // sourcery: pymethod = __iter__
  internal func iter() -> PyObject {
    return PyMemory.newSetIterator(set: self)
  }

  // MARK: - Python new

  // sourcery: pystaticmethod = __new__
  internal static func pyNew(type: PyType,
                             args: [PyObject],
                             kwargs: PyDict?) -> PyResult<PySet> {
    let elements = OrderedSet()
    let isBuiltin = type === Py.types.set

    let result: PySet = isBuiltin ?
      Py.newSet(elements: elements) :
      PyMemory.newSet(type: type, elements: elements)

    return .value(result)
  }

  // MARK: - Python init

  // sourcery: pymethod = __init__
  internal func pyInit(args: [PyObject], kwargs: PyDict?) -> PyResult<PyNone> {
    if let e = ArgumentParser.noKwargsOrError(fnName: self.typeName,
                                              kwargs: kwargs) {
      return .error(e)
    }

    if let e = ArgumentParser.guaranteeArgsCountOrError(fnName: self.typeName,
                                                        args: args,
                                                        min: 0,
                                                        max: 1) {
      return .error(e)
    }

    if let iterable = args.first {
      switch self.update(from: iterable) {
      case .value: break
      case .error(let e): return .error(e)
      }
    }

    return .value(Py.none)
  }

  // MARK: - Helpers

  private func createSet(result: PySetData.BitOperationResult) -> PyResult<PyObject> {
    switch result {
    case .set(let data):
      return .value(self.createSet(data: data))
    case .notImplemented:
      return .value(Py.notImplemented)
    case .error(let e):
      return .error(e)
    }
  }

  private func createSet(result: PyResult<PySetData>) -> PyResult<PyObject> {
    switch result {
    case let .value(data):
      return .value(self.createSet(data: data))
    case let .error(e):
      return .error(e)
    }
  }

  private func createSet(data: PySetData) -> PySet {
    return Py.newSet(elements: data.elements)
  }
}
