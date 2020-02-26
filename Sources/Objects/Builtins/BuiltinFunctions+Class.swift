import Core

extension BuiltinFunctions {

  internal static var buildClassDoc: String {
    return """
    __build_class__(func, name, *bases, metaclass=None, **kwds) -> class

    Internal helper function used by the class statement.
    """
  }

  // sourcery: pymethod = __build_class__, doc = buildClassDoc
  /// static PyObject *
  /// builtin___build_class__(PyObject *self, PyObject *const *args,
  ///                         Py_ssize_t nargs, PyObject *kwnames)
  public func buildClass(args: [PyObject],
                         kwargs: PyDict?) -> PyResult<PyObject> {
    if args.count < 2 {
      return .typeError("__build_class__: not enough arguments")
    }

    guard let fn = args[0] as? PyFunction else {
      return .typeError("__build_class__: func must be a function")
    }

    guard let name = args[1] as? PyString else {
      return .typeError("__build_class__: name is not a string")
    }

    let bases = Py.newTuple(Array(args[2...]))
    return self.buildClass(fn: fn, name: name, bases: bases, kwargs: kwargs)
  }

  public func buildClass(fn: PyFunction,
                         name: PyString,
                         bases: PyTuple,
                         kwargs: PyDict?) -> PyResult<PyObject> {
    let metatype: PyObject
    switch self.calculateMetaclass(bases: bases, kwargs: kwargs) {
    case let .value(m): metatype = m
    case let .error(e): return .error(e)
    }

    let namespace: PyDict
    switch self.createNamespace(name: name, bases: bases, metatype: metatype) {
    case let .value(n): namespace = n
    case let .error(e): return .error(e)
    }

    let cell: PyObject
    switch self.createCell(fn: fn, namespace: namespace) {
    case let .value(c): cell = c
    case let .error(e): return .error(e)
    }

    let cls: PyObject
    let margs = [name, bases, namespace]
    switch Py.call(callable: metatype, args: margs, kwargs: kwargs).asResult {
    case let .value(c): cls = c
    case let .error(e): return .error(e)
    }

    if let cls = cls as? PyType, let cell = cell as? PyCell {
      if let e = self.setCellContent(name: name, cell: cell, cls: cls) {
        return .error(e)
      }
    }

    return .value(cls)
  }

  private func setCellContent(name: PyString,
                              cell: PyCell,
                              cls: PyType) -> PyBaseException? {
    // If content is nil -> it may be warning
    if cell.content == nil {
      let msg = "__class__ not set defining \(name.value) as \(cls.getName()). " +
                "Was __classcell__ propagated to type.__new__?"
      if let e = Py.warn(type: .deprecation, msg: msg) {
        return e
      }
    }

    // If we already have content that is not our class -> throw
    if let content = cell.content, content !== cls {
      let cntRepr = Py.reprOrGeneric(content)
      let clsRepr = Py.reprOrGeneric(cls)
      let msg = "__class__ set to \(cntRepr) defining \(name.value) as \(clsRepr)"
      return Py.newTypeError(msg: msg)
    }

    cell.content = cls
    return nil
  }
}

// MARK: - Metaclass

extension BuiltinFunctions {

  private func calculateMetaclass(bases: PyTuple,
                                  kwargs: PyDict?) -> PyResult<PyObject> {
    var result: PyObject

    if let meta = kwargs?.get(id: .metaclass) {
      // TODO: if (_PyDict_DelItemId(mkw, &PyId_metaclass) < 0)
      result = meta
    } else {
      result = bases.elements.first?.type ?? Py.types.type
    }

    if let metaType = result as? PyType {
      // meta is really a class, so check for a more derived
      // metaclass, or possible metaclass conflicts:
      switch PyType.calculateMetaclass(metatype: metaType, bases: bases.elements) {
      case let .value(winner):
        result = winner
      case let .error(e):
        return .error(e)
      }
    }
    // else: meta is not a class, so we cannot do the metaclass
    // calculation, so we will use the explicitly given object as it is

    return .value(result)
  }
}

// MARK: - Namespace

private enum PrepareCallResult {
  case value(PyObject)
  case none
  case error(PyBaseException)
}

extension BuiltinFunctions {

  private func createNamespace(name: PyString,
                               bases: PyTuple,
                               metatype: PyObject) -> PyResult<PyDict> {
    switch self.get__prepare__(metatype: metatype) {
    case .value(let prepare):
      let object: PyObject
      switch Py.call(callable: prepare, args: [name, bases], kwargs: nil) {
      case let .value(o):
        object = o
      case let .error(e),
           let .notCallable(e):
        return .error(e)
      }

      guard let dict = object as? PyDict else {
        let msg = "\(metatype.typeName).__prepare__() must return a mapping, " +
                  "not \(object.typeName)"
        return .typeError(msg)
      }

      return .value(dict)

    case .none:
      return .value(Py.newDict())

    case .error(let e):
      return .error(e)
    }
  }

  private func get__prepare__(metatype: PyObject) -> PrepareCallResult {
    switch Py.getAttribute(metatype, name: .__prepare__) {
    case let .value(o):
      return .value(o)

    case let .error(e):
      if e.isAttributeError {
        return .none
      }

      return .error(e)
    }
  }
}

// MARK: - Cell

extension BuiltinFunctions {

  private func createCell(fn: PyFunction,
                          namespace: PyDict) -> PyResult<PyObject> {
    // TODO: closure PyFunction_GET_CLOSURE(func)
    return Py.delegate.eval(
      name: nil,
      qualname: nil,
      code: fn.code.codeObject,
      args: [],
      kwargs: nil,
      defaults: [],
      kwDefaults: nil,
      globals: fn.globals,
      locals: namespace
    )
  }
}
