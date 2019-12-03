
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
    '__doc__',
    '__module__',
    '__bases__',
    '__dict__',
    '__class__',
    '__mro__',
    '__repr__',
    '__subclasses__',
    '__getattribute__',
    '__setattr__',
    '__delattr__',
    '__dir__',
    '__call__',
  ],
  bool: [
    '__class__',
    '__new__',
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
    '__call__',
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
    '__new__',
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
  dict: [
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
    '__getitem__',
    '__setitem__',
    '__delitem__',
    '__contains__',
    'clear',
    'get',
    'setdefault',
    'copy',
    'pop',
    'popitem',
  ],
  type(...): [
    '__class__',
    '__repr__',
    '__getattribute__',
  ],
  float: [
    '__class__',
    '__new__',
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
    '__trunc__',
  ],
  frozenset: [
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
    '__and__',
    '__rand__',
    '__or__',
    '__ror__',
    '__xor__',
    '__rxor__',
    '__sub__',
    '__rsub__',
    'issubset',
    'issuperset',
    'intersection',
    'union',
    'difference',
    'symmetric_difference',
    'isdisjoint',
    'copy',
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
    '__new__',
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
    'pop',
    'clear',
    'copy',
    '__add__',
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
  set: [
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
    '__and__',
    '__rand__',
    '__or__',
    '__ror__',
    '__xor__',
    '__rxor__',
    '__sub__',
    '__rsub__',
    'issubset',
    'issuperset',
    'intersection',
    'union',
    'difference',
    'symmetric_difference',
    'isdisjoint',
    'add',
    'remove',
    'discard',
    'clear',
    'copy',
    'pop',
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
    'indices',
  ],
  str: [
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
    '__getattribute__',
    '__len__',
    '__contains__',
    '__getitem__',
    'isalnum',
    'isalpha',
    'isascii',
    'isdecimal',
    'isdigit',
    'isidentifier',
    'islower',
    'isnumeric',
    'isprintable',
    'isspace',
    'istitle',
    'isupper',
    'startswith',
    'endswith',
    'strip',
    'lstrip',
    'rstrip',
    'find',
    'rfind',
    'index',
    'rindex',
    'lower',
    'upper',
    'title',
    'swapcase',
    'casefold',
    'capitalize',
    'center',
    'ljust',
    'rjust',
    'split',
    'rsplit',
    'splitlines',
    'partition',
    'rpartition',
    'expandtabs',
    'count',
    'replace',
    'zfill',
    '__add__',
    '__mul__',
    '__rmul__',
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
  ArithmeticError: [
    '__class__',
    '__dict__',
  ],
  AssertionError: [
    '__class__',
    '__dict__',
  ],
  AttributeError: [
    '__class__',
    '__dict__',
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
  BlockingIOError: [
    '__class__',
    '__dict__',
  ],
  BrokenPipeError: [
    '__class__',
    '__dict__',
  ],
  BufferError: [
    '__class__',
    '__dict__',
  ],
  BytesWarning: [
    '__class__',
    '__dict__',
  ],
  ChildProcessError: [
    '__class__',
    '__dict__',
  ],
  ConnectionAbortedError: [
    '__class__',
    '__dict__',
  ],
  ConnectionError: [
    '__class__',
    '__dict__',
  ],
  ConnectionRefusedError: [
    '__class__',
    '__dict__',
  ],
  ConnectionResetError: [
    '__class__',
    '__dict__',
  ],
  DeprecationWarning: [
    '__class__',
    '__dict__',
  ],
  EOFError: [
    '__class__',
    '__dict__',
  ],
  Exception: [
    '__class__',
    '__dict__',
  ],
  FileExistsError: [
    '__class__',
    '__dict__',
  ],
  FileNotFoundError: [
    '__class__',
    '__dict__',
  ],
  FloatingPointError: [
    '__class__',
    '__dict__',
  ],
  FutureWarning: [
    '__class__',
    '__dict__',
  ],
  GeneratorExit: [
    '__class__',
    '__dict__',
  ],
  ImportError: [
    '__class__',
    '__dict__',
  ],
  ImportWarning: [
    '__class__',
    '__dict__',
  ],
  IndentationError: [
    '__class__',
    '__dict__',
  ],
  IndexError: [
    '__class__',
    '__dict__',
  ],
  InterruptedError: [
    '__class__',
    '__dict__',
  ],
  IsADirectoryError: [
    '__class__',
    '__dict__',
  ],
  KeyError: [
    '__class__',
    '__dict__',
  ],
  KeyboardInterrupt: [
    '__class__',
    '__dict__',
  ],
  LookupError: [
    '__class__',
    '__dict__',
  ],
  MemoryError: [
    '__class__',
    '__dict__',
  ],
  ModuleNotFoundError: [
    '__class__',
    '__dict__',
  ],
  NameError: [
    '__class__',
    '__dict__',
  ],
  NotADirectoryError: [
    '__class__',
    '__dict__',
  ],
  NotImplementedError: [
    '__class__',
    '__dict__',
  ],
  OSError: [
    '__class__',
    '__dict__',
  ],
  OverflowError: [
    '__class__',
    '__dict__',
  ],
  PendingDeprecationWarning: [
    '__class__',
    '__dict__',
  ],
  PermissionError: [
    '__class__',
    '__dict__',
  ],
  ProcessLookupError: [
    '__class__',
    '__dict__',
  ],
  RecursionError: [
    '__class__',
    '__dict__',
  ],
  ReferenceError: [
    '__class__',
    '__dict__',
  ],
  ResourceWarning: [
    '__class__',
    '__dict__',
  ],
  RuntimeError: [
    '__class__',
    '__dict__',
  ],
  RuntimeWarning: [
    '__class__',
    '__dict__',
  ],
  StopAsyncIteration: [
    '__class__',
    '__dict__',
  ],
  StopIteration: [
    '__class__',
    '__dict__',
  ],
  SyntaxError: [
    '__class__',
    '__dict__',
  ],
  SyntaxWarning: [
    '__class__',
    '__dict__',
  ],
  SystemError: [
    '__class__',
    '__dict__',
  ],
  SystemExit: [
    '__class__',
    '__dict__',
  ],
  TabError: [
    '__class__',
    '__dict__',
  ],
  TimeoutError: [
    '__class__',
    '__dict__',
  ],
  TypeError: [
    '__class__',
    '__dict__',
  ],
  UnboundLocalError: [
    '__class__',
    '__dict__',
  ],
  UnicodeDecodeError: [
    '__class__',
    '__dict__',
  ],
  UnicodeEncodeError: [
    '__class__',
    '__dict__',
  ],
  UnicodeError: [
    '__class__',
    '__dict__',
  ],
  UnicodeTranslateError: [
    '__class__',
    '__dict__',
  ],
  UnicodeWarning: [
    '__class__',
    '__dict__',
  ],
  UserWarning: [
    '__class__',
    '__dict__',
  ],
  ValueError: [
    '__class__',
    '__dict__',
  ],
  Warning: [
    '__class__',
    '__dict__',
  ],
  ZeroDivisionError: [
    '__class__',
    '__dict__',
  ],
}
