# Lecture 04
This lecture was taught by [Dr. John Barton.](https://bartonlab.github.io)
The slides for this lecture can be found [here.](https://mscbio2025-2025.github.io/lectures/lecture-04-python.slides.html#/)
## Lecture 03 Activity Review
The answers from the last activity were 4381 ORFs in the `csv`.
There were 27 ORFs in chrmosome A.
There were 2354 ORFs that start with a positive expression value.
## Python Types
Python has several buit in types.
These types can be numerical: in the case of integers `int`, floating point `float`, and complex `complex`.
It can also support boolean values `bool` which are `True` or `False`.
It also has a `None` type.
There are additionally sequences which can be strings `str`, tuples `tuple`, lists `list`, sets `set`, and dictionaries `dict`.
Finally, there are callable types that usually store functions.
## Arithmetic Operators
Python can do some math with the numerical types.
These include `+`, `-`, '*', and '/' which are the standard addition, substraction, multiplication, and division.
The `%` modulus operator returns the remainder after division.
The `**` operation is the exponential function.
Finally, there is `//` operator that gives the floor division.
### Order of Operations
Python supports `()` operation just like algebra, that will evaluate the expressions inside the paranthesis first.
## Assignment Operators
An operation can be performed while assigning a variable.
`a op=b` is the same as `a = a op b`.
For example, the following code will assign `x` to be `10`, then increment by `1`.
```python
x = 10
x += 1  
```
## Strings
Strings in `python` can be assigned with double quotes or single quotes ()`""` or `''`).
Special characters use the `\` to escape.
For example a newline is defined by `\n`.
### Multiline Strings
Using the escape character `\` strings can continue to the next line.
Adjacent strings will be automatically concatinated when defined in the same line.
Similarly to the escape chracter `\`, triple quotes can be used to define large blocks of text with newlines.
## Variables
Data in python is defined by a reference to a value.
Once defined, a variable stores a value within memory.
It is not possible to have an uninitialized variable, but the type can be `None`.
## Objects
In python, everything is an object.
The object is a value that is set with attribites.
Attributes that are callable and work on the object data are called _methods_.
Attributes can be accessed with the `.` operator.
The attributes of an object can be listed with `dir`.
### Strings
Strings are stored as objects.
There are callable _methods_ for strings such as `upper()` which gives all letters in upercase and `split()` which splits the string.
### Numbers
Numbers (`int`, `float`, `complex`) are also objects.
These also have callable _methods_ for example, `is_integer()` which returns a `bool` whether the variable is an integer.
## Containers
Containers in python are accessed with the `[]` operator.
They can hold an arbitrary number of objects.
The `len()` _method_ returns the number of items.
Strings are an example of a container object.
### Lists
Lists are an ordered example of a container object.
The items in the list are comma seperated.
These also have a number of built in methods such as `pop()` which removes an item, `append()` which adds items to the list, and `sort()` which sorts the list.
The elements in the list can be accessed with a negative index, which start from the last item in the list.
Lists are not capable of having mathematical operations on them.
## Defining a Function
Within python, a function can be defined with `def`.
The indented block defines the function operations.
A return statement gives the result of the function if there is a return.
If there is no return statement the return type is `None`.
The end of the function happens when there is no more indented text.
### Function Scope
The _local scope_ of a function are the parameters and variables that are bound to the function, but cannot be accessed outside the function.
The _global scope_ defines parameters or variables that are defined outside the function.

### Default Parameters
The default values for a parameter in a function can be set as well.
These make a function's arguments optional.
### Calling Functions
Functions must have arguments in the correct order defined by the function.
They can, however, be used in a different order _if and only if_ the arguments are named.
In addition, unnamed arguments must be passed in the correct order, _before_, named ones.
### Built-In Functions
Python has several built-in functions that are callable.
A list of these can be found [here.](https://docs.python.org/3/library/functions.html)
## Booleans
Every object has a boolean value.
For numerical types `0` is set to `False`.
Empty collections are also `False`.
`None` types are also set to `False`.
### Comparison Operators
The operators `<`, '>', `!=`, `==`, `<=`, and `>=` return booleans.
They can be used to compare, numbers, strings, or lists.
## File Objects
Files can be read and written in python.
They are accessed sequentially.
The `open` function creates a file object.
The path of the file must be given as a relative or absolute path.
### File Modes
The flags used in the mode for a file specifies what is being done with it.
`'r'` just reads a file, `'w'`rewrites the file, `'a'` appends to the file.
### Using File Objects
The `close()` function closes the file. The `read()` function reads the file as a single string, the `readline()` function returns a single line of the file, the `readlines()` returns a list of all the lines, the `write()` function writes to the file, and the `seek()` function sets the current position of the file.
