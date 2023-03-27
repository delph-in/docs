{% raw %}# PythonIdioms

This is a reference page (mainly for Matrix developers, but other Python
programmers are welcome to contribute) for Python idioms and
constructions that may not be completely transparent for
non-Pythonistas.

## List Comprehensions

List comprehensions are a convenient form for creating (or filtering,
mapping, etc) lists. They take the form:

```
   1 result = []
   2 for x in a_list:
   3   if condition:
   4     result += expression(x)
```

and make it into:

```
   1 result = [expression(x) for x in a_list if condition]
```

Here are some examples:

```
   1 >>> [x*2 for x in range(4)]
   2 [0, 2, 4, 6]
   3 >>> [x*2 for x in range(4) if x > 0]
   4 [2, 4, 6]
   5 >>> [x/2 for x in [y*2 for y in range(4)]]
   6 [0, 1, 2, 3]
   7 >>> [x + '_name' for x in ['noun', 'verb', 'det']]
   8 ['noun_name', 'verb_name', 'det_name']
   9 >>> d = {'a':[1,2,3], 'b':[4,5,6]}
  10 >>> [x + str(y) for x in d for y in d[x]]
  11 ['a1', 'a2', 'a3', 'b4', 'b5', 'b6']
  12 >>> [x + str(y) for x in d if x != 'a' for y in d[x] if y > 4]
  13 ['b5', 'b6']
```

## Inline Conditionals

Inline conditionals are similar to the C syntax of
x = condition ? value\_if\_true : value\_if\_false, but is slightly more
legible. In Python it replaces the following:

```
   1 if condition:
   2   x = value1
   3 else:
   4   x = value2
```

or the more compact, but slightly less clear:

```
   1 x = value2
   2 if condition:
   3   x = value1
```

with the following:

```
   1 x = value1 if condition else value2
```

Inline conditionals are available from Python 2.5.

## or-operators in assignment

or operators are useful in assignment when the first value may be
"None", and empty string, or something else that evaluates to False.

```
   1 x = y or z
```

These are especially useful for functions with default parameters,
especially when the default parameter is a list or some other referenced
object:

```
   1 class MyClass:
   2   def func(self, x=None):
   3     self.x = x or []
```

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/PythonIdioms/_edit)]{% endraw %}