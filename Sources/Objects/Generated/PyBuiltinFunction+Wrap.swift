// swiftlint:disable identifier_name
// swiftlint:disable vertical_whitespace_closing_braces
// swiftlint:disable file_length

// Please note that this file was automatically generated. DO NOT EDIT!
// The same goes for other files in 'Generated' directory.

extension PyBuiltinFunction {

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Void_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Void_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.ObjectOpt_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.ObjectOpt_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_Object_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_Object_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_ObjectOpt_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_ObjectOpt_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_ObjectOpt_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_ObjectOpt_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Void_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Void_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_Object_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_Object_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_ObjectOpt_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_ObjectOpt_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_then_Object_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_then_Object_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_then_ObjectOpt_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_then_ObjectOpt_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_Object_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_Object_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_ObjectOpt_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_ObjectOpt_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_ObjectOpt_ObjectOpt_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_ObjectOpt_ObjectOpt_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_Object_Object_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_Object_Object_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_Object_ObjectOpt_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_Object_ObjectOpt_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_ObjectOpt_ObjectOpt_to_Result_Fn<R>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Object_ObjectOpt_ObjectOpt_to_Void_Fn,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_Object_Object_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_Object_Object_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_Object_ObjectOpt_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_Object_ObjectOpt_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_ObjectOpt_ObjectOpt_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_Object_ObjectOpt_ObjectOpt_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf, R: PyFunctionResultConvertible>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_ObjectOpt_ObjectOpt_ObjectOpt_to_Result_Fn<Zelf, R>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

  internal static func wrap<Zelf>(
    name: String,
    doc: String?,
    fn: @escaping FunctionWrapper.Self_then_ObjectOpt_ObjectOpt_ObjectOpt_to_Void_Fn<Zelf>,
    castSelf: @escaping FunctionWrapper.CastSelf<Zelf>,
    module: PyString? = nil
  ) -> PyBuiltinFunction {
    let wrapper = FunctionWrapper(name: name, fn: fn, castSelf: castSelf)
    return PyBuiltinFunction(fn: wrapper, module: module, doc: doc)
  }

}
