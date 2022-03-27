import Foundation
import VioletCore
import VioletObjects

class FakeDelegate: PyDelegateType {

  func getCurrentlyExecutedFrame(_ py: Py) -> PyFrame? {
    shouldNotBeCalled()
  }

  func getCurrentlyHandledException(_ py: Py) -> PyBaseException? {
    shouldNotBeCalled()
  }

  // swiftlint:disable:next function_parameter_count
  func eval(_ py: Py,
            name: PyString?,
            qualname: PyString?,
            code: PyCode,

            args: [PyObject],
            kwargs: PyDict?,
            defaults: [PyObject],
            kwDefaults: PyDict?,

            globals: PyDict,
            locals: PyDict,
            closure: PyTuple?) -> PyResult {
    shouldNotBeCalled()
  }
}
