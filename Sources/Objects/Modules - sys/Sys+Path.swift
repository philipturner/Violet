import Core
import Foundation

// In CPython:
// Python -> sysmodule.c
// Modules -> getpath.c <-- this!

// https://docs.python.org/3.7/library/sys.html
// https://docs.python.org/3.8/using/cmdline.html
// https://docs.python.org/3/tutorial/modules.html#the-module-search-path <-- this!

/// While searching for `prefix` and `exec_prefix` we will try different
/// locations until the one containing `lib/landmark` is found.
///
/// CPython: `lib/python{VERSION}` (stored in `calculate->lib_python`)
/// Violet:  We will use `Lib` (directory in our repository root).
private let lib = "Lib"

/// While searching for `prefix` and `exec_prefix` we will try different
/// locations until the one containing `lib/landmark` is found.
///
/// CPython: `#define LANDMARK L"os.py"`
/// Violet:   We will use `importlib.py` instead.
private let landmark = "importlib.py"

extension Sys {

  // MARK: - Meta path

  public func getMetaPath() -> PyResult<PyList> {
    return self.getList(.meta_path)
  }

  public func setMetaPath(to value: PyObject) -> PyBaseException? {
    return self.set(.meta_path, to: value)
  }

  // MARK: - Path hooks

  public func getPathHooks() -> PyResult<PyList> {
    return self.getList(.path_hooks)
  }

  public func setPathHooks(to value: PyObject) -> PyBaseException? {
    return self.set(.path_hooks, to: value)
  }

  // MARK: - Path importer cache

  public func getPathImporterCache() -> PyResult<PyDict> {
    return self.getDict(.path_importer_cache)
  }

  public func setPathImporterCache(to value: PyObject) -> PyBaseException? {
    return self.set(.path_importer_cache, to: value)
  }

  // MARK: - Path

  /// sys.path
  /// See [this](https://docs.python.org/3.7/library/sys.html#sys.path).
  ///
  /// A list of strings that specifies the search path for modules.
  /// Initialized from the environment variable PYTHONPATH,
  /// plus an installation-dependent default.
  ///
  /// `path[0]`, is the directory containing the script that was used to invoke
  /// the Python interpreter.
  /// If the script directory is not available, `path[0]` is the empty string,
  /// which directs Python to search modules in the current directory first.
  public func getPath() -> PyResult<PyList> {
    return self.getList(.path)
  }

  public func setPath(to value: PyObject) -> PyBaseException? {
    return self.set(.path, to: value)
  }

  /// Prepend given value to `sys.path`.
  public func prependPath(value: String) -> PyBaseException? {
    let path = self.getPath()

    switch path {
    case let .value(list):
      let object = Py.newString(value)
      list.data.prepend(object)
      return nil
    case let .error(e):
      return e
    }
  }

  // MARK: - Prefix

  public func getPrefix() -> PyResult<PyString> {
    return self.getString(.prefix)
  }

  public func setPrefix(to value: PyObject) -> PyBaseException? {
    return self.set(.prefix, to: value)
  }

  // MARK: - Initial

  /// static _PyInitError
  /// calculate_module_search_path(const _PyCoreConfig *core_config, ...)
  internal func createInitialPath(prefix: PyString) -> PyList {
    var result = [String]()

    // Run-time value of $VIOLETPATH goes first
    let envPaths = Py.config.environment.violetPath
    result.append(contentsOf: envPaths)

    // Next goes merge of compile-time $VIOLETPATH with dynamically located prefix.
    let prefixUrl = URL(fileURLWithPath: prefix.value)

    for suffix in Configure.pythonPath {
      let url = prefixUrl.appendingPathComponent(suffix)
      result.append(url.path)
    }

    // Violet special: add 'prefix' and 'prefix/Lib'
    // This will add 'Lib' directory from our repository root.
    result.append(prefixUrl.path)
    result.append(prefixUrl.appendingPathComponent(lib).path)

    result.removeDuplicates()

    let strings = result.map(Py.newString(_:))
    return Py.newList(strings)
  }

  /// static int
  /// search_for_prefix(const _PyCoreConfig *core_config, ...)
  internal func createInitialPrefix() -> PyString {
    // If $VIOLETHOME is set, we believe it unconditionally
    if let home = Py.config.environment.violetHome {
      return Py.newString(home)
    }

    // CPython: Search from argv0_path, until root.
    // Violet:  We will start from executable path.
    let executablePath = Py.config.executablePath
    var candidate = URL(fileURLWithPath: executablePath)

    var depth = 0
    let maxDepth = candidate.pathComponents.count

    while depth < maxDepth {
      let landmarkUrl = candidate
        .appendingPathComponent(lib)
        .appendingPathComponent(landmark)

      if self.isFile(path: landmarkUrl.path) {
        return Py.newString(candidate.path)
      }

      candidate.deleteLastPathComponent()
      depth += 1
    }

    return Py.newString(Configure.prefix)
  }

  private func isFile(path: String) -> Bool {
    switch Py.fileSystem.stat(path: path) {
    case .value(let s):
      return s.isRegularFile
    case .enoent,
         .error:
      return false
    }
  }
}
