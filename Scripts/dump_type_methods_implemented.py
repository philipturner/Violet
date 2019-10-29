
import types as t



types = {
  object: [
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__hash__',
    '__repr__',
    '__str__',
    '__format__',
    '__class__',
    '__dir__',
    '__getattribute__',
    '__setattr__',
    '__delattr__',
    '__subclasshook__',
    '__init_subclass__',
  ],
  type: [
    '__name__',
    '__qualname__',
    '__module__',
    '__bases__',
    '__dict__',
    '__class__',
    '__repr__',
    '__subclasses__',
    '__instancecheck__',
    '__subclasscheck__',
    '__getattribute__',
    '__setattr__',
    '__delattr__',
    '__dir__',
  ],
  bool: [
    '__class__',
    '__repr__',
    '__str__',
    '__and__',
    '__rand__',
    '__or__',
    '__ror__',
    '__xor__',
    '__rxor__',
  ],
  t.BuiltinFunctionType: [
    '__class__',
    '__name__',
    '__qualname__',
    '__text_signature__',
    '__module__',
    '__self__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__hash__',
    '__repr__',
    '__getattribute__',
  ],
  t.CodeType: [
    '__class__',
    '__eq__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__hash__',
    '__repr__',
  ],
  complex: [
    '__class__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__hash__',
    '__repr__',
    '__str__',
    '__bool__',
    '__int__',
    '__float__',
    'real',
    'imag',
    'conjugate',
    '__getattribute__',
    '__pos__',
    '__neg__',
    '__abs__',
    '__add__',
    '__radd__',
    '__sub__',
    '__rsub__',
    '__mul__',
    '__rmul__',
    '__pow__',
    '__rpow__',
    '__truediv__',
    '__rtruediv__',
    '__floordiv__',
    '__rfloordiv__',
    '__mod__',
    '__rmod__',
    '__divmod__',
    '__rdivmod__',
  ],
  type(...): [
    '__class__',
    '__repr__',
    '__getattribute__',
  ],
  float: [
    '__class__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__hash__',
    '__repr__',
    '__str__',
    '__bool__',
    '__int__',
    '__float__',
    'real',
    'imag',
    'conjugate',
    '__getattribute__',
    '__pos__',
    '__neg__',
    '__abs__',
    '__add__',
    '__radd__',
    '__sub__',
    '__rsub__',
    '__mul__',
    '__rmul__',
    '__pow__',
    '__rpow__',
    '__truediv__',
    '__rtruediv__',
    '__floordiv__',
    '__rfloordiv__',
    '__mod__',
    '__rmod__',
    '__divmod__',
    '__rdivmod__',
    '__round__',
  ],
  t.FunctionType: [
    '__class__',
    '__name__',
    '__qualname__',
    '__code__',
    '__doc__',
    '__module__',
    '__dict__',
    '__repr__',
    '__get__',
  ],
  int: [
    '__class__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__hash__',
    '__repr__',
    '__str__',
    '__bool__',
    '__int__',
    '__float__',
    '__index__',
    'real',
    'imag',
    'conjugate',
    'numerator',
    'denominator',
    '__getattribute__',
    '__pos__',
    '__neg__',
    '__abs__',
    '__add__',
    '__radd__',
    '__sub__',
    '__rsub__',
    '__mul__',
    '__rmul__',
    '__pow__',
    '__rpow__',
    '__truediv__',
    '__rtruediv__',
    '__floordiv__',
    '__rfloordiv__',
    '__mod__',
    '__rmod__',
    '__divmod__',
    '__rdivmod__',
    '__lshift__',
    '__rlshift__',
    '__rshift__',
    '__rrshift__',
    '__and__',
    '__rand__',
    '__or__',
    '__ror__',
    '__xor__',
    '__rxor__',
    '__invert__',
    '__round__',
  ],
  list: [
    '__class__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__repr__',
    '__getattribute__',
    '__len__',
    '__contains__',
    '__getitem__',
    'count',
    'index',
    'append',
    'extend',
    'clear',
    'copy',
    '__add__',
    '__iadd__',
    '__mul__',
    '__rmul__',
    '__imul__',
  ],
  t.MethodType: [
    '__class__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__repr__',
    '__hash__',
    '__getattribute__',
    '__setattr__',
    '__delattr__',
    '__func__',
    '__self__',
    '__get__',
  ],
  t.ModuleType: [
    '__dict__',
    '__class__',
    '__repr__',
    '__getattribute__',
    '__setattr__',
    '__delattr__',
    '__dir__',
  ],
  t.SimpleNamespace: [
    '__dict__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__repr__',
    '__getattribute__',
    '__setattr__',
    '__delattr__',
  ],
  type(None): [
    '__class__',
    '__repr__',
    '__bool__',
  ],
  type(NotImplemented): [
    '__class__',
    '__repr__',
  ],
  property: [
    '__class__',
    'fget',
    'fset',
    'fdel',
    '__getattribute__',
    '__get__',
    '__set__',
    '__delete__',
  ],
  range: [
    '__class__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__hash__',
    '__repr__',
    '__bool__',
    '__len__',
    '__getattribute__',
    '__contains__',
    '__getitem__',
    'count',
    'index',
  ],
  slice: [
    '__class__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__repr__',
    '__getattribute__',
  ],
  tuple: [
    '__class__',
    '__eq__',
    '__ne__',
    '__lt__',
    '__le__',
    '__gt__',
    '__ge__',
    '__hash__',
    '__repr__',
    '__getattribute__',
    '__len__',
    '__contains__',
    '__getitem__',
    'count',
    'index',
    '__add__',
    '__mul__',
    '__rmul__',
  ],
  BaseException: [
    '__dict__',
    '__class__',
    'args',
    '__traceback__',
    '__cause__',
    '__context__',
    '__suppress_context__',
    '__repr__',
    '__str__',
    '__getattribute__',
    '__setattr__',
    '__delattr__',
  ],
  Exception: [
    '__dict__',
  ],
  GeneratorExit: [
    '__dict__',
  ],
  KeyboardInterrupt: [
    '__dict__',
  ],
  BytesWarning: [
    '__dict__',
  ],
  DeprecationWarning: [
    '__dict__',
  ],
  FutureWarning: [
    '__dict__',
  ],
  ImportWarning: [
    '__dict__',
  ],
  PendingDeprecationWarning: [
    '__dict__',
  ],
  ResourceWarning: [
    '__dict__',
  ],
  RuntimeWarning: [
    '__dict__',
  ],
  SyntaxWarning: [
    '__dict__',
  ],
  UnicodeWarning: [
    '__dict__',
  ],
  UserWarning: [
    '__dict__',
  ],
  Warning: [
    '__dict__',
  ],
}
