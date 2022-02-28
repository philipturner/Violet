/* MARKER
// MARK: - PyAnySet

/// When you don't care whether the object is `set` or `frozenset`.
/// You just need `PySetData`.
internal struct PyAnySet: CustomStringConvertible {

  internal typealias Element = AbstractSet_Element
  internal typealias OrderedSet = VioletObjects.OrderedSet<Element>

  fileprivate enum Storage {
    case set(PySet)
    case frozenSet(PyFrozenSet)
  }

  fileprivate let storage: Storage

  internal var description: String {
    switch self.storage {
    case let .set(s): return s.description
    case let .frozenSet(s): return s.description
    }
  }

  internal var elements: OrderedSet {
    switch self.storage {
    case let .set(s): return s.elements
    case let .frozenSet(s): return s.elements
    }
  }

  internal init(set: PySet) {
    self.storage = .set(set)
  }

  internal init(frozenSet: PyFrozenSet) {
    self.storage = .frozenSet(frozenSet)
  }
}

// MARK: - PyCast

extension PyCast {

  /// Is this object a `set` or `frozenset` (or their subclass)?
  internal static func isAnySet(_ object: PyObject) -> Bool {
    return self.isSet(object) || self.isFrozenSet(object)
  }

  /// Is this object a `set` or `frozenset` (but not their subclass)?
  internal static func isExactlyAnySet(_ object: PyObject) -> Bool {
    return self.isExactlySet(object) || self.isExactlyFrozenSet(object)
  }

  /// Is this object a `set` or `frozenset` (but not their subclass)?
  internal static func isExactlyAnySet(_ set: PyAnySet) -> Bool {
    switch set.storage {
    case let .set(s):
      return self.isExactlySet(s)
    case let .frozenSet(s):
      return self.isExactlyFrozenSet(s)
    }
  }

  /// Cast this object to `PyAnySet` if it is a `set` or `frozenset`
  /// (or their subclass).
  internal static func asAnySet(_ object: PyObject) -> PyAnySet? {
    if let set = self.asSet(object) {
      return PyAnySet(set: set)
    }

    if let frozenSet = self.asFrozenSet(object) {
      return PyAnySet(frozenSet: frozenSet)
    }

    return nil
  }

  /// Cast this object to `PyAnySet` if it is a `set` or `frozenset`
  /// (but not their subclass).
   internal static func asExactlyAnySet(_ object: PyObject) -> PyAnySet? {
    if let set = self.asExactlySet(object) {
      return PyAnySet(set: set)
    }

    if let frozenSet = self.asExactlyFrozenSet(object) {
      return PyAnySet(frozenSet: frozenSet)
    }

    return nil
  }
}

*/