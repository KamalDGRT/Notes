# Dart Notes

> The notes here has been taken from the handwritten notes of
> [Kamal Sharma](https://github.com/KamalDGRT)'s Telegram channel and
> can be found [here](https://t.me/rkswrites/2).

<hr>

### Dart

**Dart** is the main programming language to develop
**cross-platform** mobile application using
**flutter framework**

<hr>

### Contents:

-   Setup
-   Fundamental
-   Data Types
-   String
-   Type Conversion
-   Constant
-   Null
-   Operators
-   Loop
-   Collection [list, set, Map]
-   Function
-   Class
-   Exceptional Handling

<hr>

### How to run Dart Code:

```
dart <filename>.dart
```

_Install dart extension in Microsoft Visual Studio_

Dart is a static type programming language. It is also a
compiled programming language

Static type means if you defined a variable as a string, you cannot
assign other values like integer (or) double on that string type.

Dart supports two types of compilation: **ADT, JIT**

1. **AOT** - Ahead of time
2. **JIT** - Just in time

When we have to run a dart program, we have to compile it then run. It
happens automatically. When we write a dart program, and run it, it
automatically compiles on the fly. This is called just in time
compilation.

When we deploy our final product, then it will be compiled as AOT
complication with some optimization.

<hr>

### Fundamentals

Every Dart program starts with a main() function.

```dart
main() {
    var firstName = 'Leo';
    String lastName = 'Valdez';
    print(firstName + lastName);
}
```

when you define variables with `var` keyword, Dart automatically detects
the type based on the value assigned. This is called type inference.

**Dart supports both: type interface and statically type defined.**

All the built in dart libraries like collection, and other core functions
are defined in a package. That is called `dart:core` package.

syntax to import:

```dart
import 'dart:core';
```

The `dart:core` package is automatically imported for most dart
programmers.

For user-input stuff, we have to import `dart:io`.

```dart
main() {
    stdout.writeln('What is your name? ')
    String name = stdin.readLineSync();
    print('My name is $name');
}
```

`$name` - String interpolation

`//` - In-line comment

```dart
/*
Block comment
*/
```

`///` - Documentation

<hr>

### Data Types

There are 2 types of available is strongly typed language: The type of a
variable is known at compile time. For example C++, Java, Swift.

**Dynamically Typed Language:** The type of a variable is known at run
time.<br>
For example: Python, Ruby, JavaScript

**In Dart programming language, there are 5 basic types:**

-   int
-   double
-   String
-   bool
-   dynamic

After a data-type is assigned using var and the type is recognized, then
you can't assign a new type later.

Eg:

```dart
var a = 10;
a = 'Hello'; //It will return error
```

Dart is an OOP language and everything is an object in here.

Even the null type is an object.

Even the function [main()] is also an object which is the subtype of the
function class.

<hr>

### String, type conversion, constant, null

**String** can be either in `''` or `""`.

In `''`, you have to use `\` to print special characters

But in `" "` you can use one single quote.

```dart
var S3 = 'It\'s easy!';
var S4 = "It's funny";
```

To define a raw string, put a r in front of the string.
<br>
i.e, if a `\n` is there, then it won't be evaluated.
I think it applies to all whitespace characters.

<hr>

#### String Interpolation

String interpolation means to replace a variable's value with an actual
value within a string.

```dart
main() {
    var age = 25;
    var str = 'My age is: $age';
    print(str);
}
```

<hr>

#### Multiline string

we can define multiline string in dart either by using 3 single quotes
in the beginning and end (or) by using 3 double quotes.

```dart
main() {
    var s1 = '''
    you can create
    multi-line string
    like this one''';
    print(s1);
}
```

<hr>

#### Type conversion

It is an important concept in any programming language.

To convert string to integer value, user parse().

```dart
var one = int.parse('1');
assert(one == 1);
```

Sometimes we need to convert a string to an integer and vice versa.

To convert a string to an integer value, you can use the parse() method
of int object.

```dart
main() {
    // String -> int
    var one = int.parse('1');
    assert(one == 1);

    // String -> double
    var onePeriodOne = double.parse('1.1');
    assert(onePeriodOne == 1.1);
}
```

If you try to convert a trying with alphabets to integers. you will get
FormatException error.

<hr>

#### Converting to string

`toString()`

```dart
main() {
    // int -> String
    String oneAsString = 1.toString();
    assert(oneAsString == '1.1');

    // double -> String
    String piAsString = 3.14159.toStringAsFixed(2);
    assert(piAsString == '3.14');
}
```

<hr>

#### Constant variable

To define a constant variable in dart, use the keyword `const`.

```dart
main() {
    const aConstNum = 0;
    const aConstBool = true;
    const aConstString = 'a constant string';

    print(aConstNum)
    print(aConstBool)
    print(aConstString)

    print(aConstNum.runtimeType);
    print(aConstBool.runtimeType);
    print(aConstString.runtimeType);
}
```

By type interface, the compiler will assign the data types to the
variables.

```dart
main() {
    int num;
    print(num);
}
```

**Output**

```dart
null
```

We can also specify null

```dart
main() {
    int num = null;
    print(num);
}
```

**Output**

```dart
null
```

<hr>

#### Operators

All the standard operators from C, C++, Java, and Swift will also work
in dart programming language.

```dart
void main() {
    int num = 10+22;
    num = num-2;
    print(num);

    num = num % 5;
    print(num);

    // relational ==, !=, >=, <=, <, >
    if(num == 0) {
        print('Zero');
    }

    num = 100;
    num *= 2;

    // != Not equal
    if(num != 100) {
        print('num is not equal');
    }

    //unary operators
    ++num;
    num++;
    num += 1;
    num == 1;
    print(num);

    //logical operator: &&, ||, !
    if(num > 200 && num < 203) {
        print('200 to 202');
    }
}
```

<hr>

#### Null aware operator `?.`, `??`, `??=`

It is one of the important operator in dart language. These operators
are common in modern programming languages such as Swift, Kotlin.<br>
In Dart, There are 3 variables of this operators.

Suppose we want to define a class

```dart
class Num {
    int num = 10;
}

main() {
    var n = Num(); // To create  object
    int number = 1;

    if(n!==null) {
        number = n.num;
    }
    print(number)
}
```

**Output:**

```dart
10
```

We can check `null` in another method

```dart
number = n?.num;
```

this line will replace:

> if(n!==null) {<br>
> number = n.num;<br>
> }

**What that line will do?**

If n is a valid object then access the property name num and assign
its value to number.<br>
If n is a null object, then skip this.

```dart
main() {
    number = n?.num ?? 0;
    print(number);
}
```

```dart
number = n?.num ?? 0;
```

When this is null, this will be executed. Kind of like assigning a
default value for null objects.

`??=`

This will assign a value if the object is null.

```dart
    int n;
    print(n??=100);
    print(n);
```

**Output**

```dart
100
```

<hr>

### Ternary Operator

```dart
void main() {
    int x = 100;
    var result = x % 2 == 0 ? 'Even' : 'Odd';
    print(result);
}
```

**Output**

```dart
Even
```

<hr>

### Type Test Operator

```dart
void main() {
    var x = 100;
    if(x is int) {
        print('Integer');
    }
}
```

<hr>

### Conditional Statements

```dart
void main() {
  int number = 100;

  // If else ladder
  if (number % 2 == 0) {
    print('Even');
  } else if (number % 3 == 0) {
    print('Odd');
  } else {
    print('Confused');
  }

  // Switch Case

  switch (number) {
    case 0:
      print('Even');
      break;
    case 1:
      print('Odd');
      break;
    default:
      print('Confused');
  }
}
```

<hr>

### Looping Statement:

```dart
void main() {
  //Standard  for loop
  for (var i = 1; i <= 10; ++i) {
    print(i);
  }

  // For in loop
  var numbers = [1, 2, 3];
  for (var n in numbers) {
    print(n);
  }

  // Standard way of accessing it.
  for (var i = 0; i < numbers.length; i++) {
    print(numbers[i]);
  }

  // forEach loop method 1
  numbers.forEach((n) => print(n));

  // forEach loop method2
  numbers.forEach(printNum);

  // while loop
  int num = 5;
  while (num > 0) {
    print(num);
    num -= 1;
  }

  // do while loop
  do {
    print(num);
    num += 1;
  } while (num < 5);
}

void printNum(num) {
  print(num);
}
```

<hr>

### Break and Continue

```dart
void main() {
  // example for break
  for (var i = 0; i < 10; i++) {
    if (i > 5) break;
    print(i);
  }

  // example for continue
  for (var j = 0; j < 10; j++) {
    if (j % 2 == 0) continue;
    print('Odd: $j');
  }
}
```

<hr>

### Collections

There are 3 built-in collection types in Dart Language:

-   Lists
-   Sets
-   Maps

<hr>

#### List: Ordered collection of values

In some programming languages it is called array, but
in Dart programming language. It is called list.

One way to define list is by using List class

```dart
List names = ['Jack', 'Jill'];
```

<hr>

#### Copying a list to another variable

```dart
  var names2 = names1;
```

It will not copy the list.<br>
Here, the names2 will be like a reference to names 1.<br>
Just like how it is in Python.<br>
So, We will use spread operator to copy. (...)

```dart
  List<String> games = ['TT', 'Chess'];
  var games2 = [...games];
  games[1] = 'Football';
  for (var game in games2) {
    print(game);
  }
```

<hr>

### Set: Unordered collection of unique items.

```dart
// Set  Method 1
  var halogens = {'Fluorine', 'Chlorine', 'Fluorine'};
  for (var element in halogens) {
    print(element);
  }

  // Set Method 2
  Set<String> friends = {'Ross', 'Chandler'};
  for (var friend in friends) {
    print(friend);
  }
```

**To define a empty set:**

```dart
Set<String> hobbies = {};
print(hobbies.runtimeType);
```

<hr>

#### Map

In Dart Programming Language, Map is a collection of (key -> value)
pair of items

In python, It is known as dictionary

```dart
// Map Method 1

var gifts = {
// Key : Value
'first': 'Patridge',
'second': 'Turtledoves',
'third': 'Golden Rings'
};
print(gifts['second']);

//Map Method 2
var folklore = Map();

folklore['first'] = 'the 1';
folklore['second'] = 'cardigan';
print(folklore);
```

<hr>

### Functions

In Dart Programming Language, each function is an object of class
function.

#### Syntax:

```nim
returnType FunctionName(argList) {

    Statements_1;
    Statements_2;

    return <data>
}
```

<hr>

#### Arrow function (`=>`)

Short way to define a function
<br>Example

```
dynamic square(var n) => n*n;
```

<hr>

#### Anonymous Function

A function with no name is called Anonymous function in Dart Programming
Language.

In python, It is known as Lambda Function.

```dart
void main() {
  showOutput(square(3));
  showOutput(square1(3.5));

  print(square1.runtimeType);

  var list = ['apples', 'bananas', 'oranges'];

  //wkt, forEach function takes a function as argument
  list.forEach(printF);

  //now, lets try to make a anonymous function
  list.forEach((item) {
    print(item);
  });
}

void printF(item) {
  print(item);
}

dynamic square(var num) {
  return num * num;
}

// Arrow function =>
dynamic square1(var num) => num * num;

void showOutput(var msg) {
  print(msg);
}
```

There are 2 types of parameters in dart programming language:

-   Positional Parameter/Argument
-   Named Parameter/Argument

<hr>

#### Named Parameter

When you are using named parameter, you have to specify the name of the
parameter when you are calling the function.

This is applicable for both: arrow & general function.

```dart
void main() {
    print(sum(num2:4, num1:2));
    dynamic sum({var num1, var num2}) => num1 + num2;
}
```

By default named parameter is optional and, we can also mix positional
and named parameter together.

```dart

void main()  {
    print(sum(10));
}
//method 1
dynamic sum(var num1, {var num2}) => num1 + (num ?? 0);
// default
dynamic sum(var num1, {var num2 = 0}) => num1 + (num ?? 0);
// Positional Optional
dynamic sum(var num1, [var num2]) => num1 + (num ?? 0);
```

## Class

Blueprint for an actual object

```dart
class Person {
  String name;
  int age;

  // Constructor

  Person(String name, [int age = 18]) {
    this.name = name;
    this.age = age;
  }

  // Person(this.name, [this.age = 18]); is also a constructor

  // named constructor
  Person.guest() {
    name = 'Guest';
    age = 10;
  }

  void showOutput() {
    print(name);
    print(age);
  }
}

void main() {
  Person person1 = Person('Leo', 24);

  // person1.name = 'Leo';
  // person1.age = 20;

  // person1 = Person.guest(); is possible.
  Person p2 = Person.guest();
  Person p3 = Person('Jason');

  person1.showOutput();
  p2.showOutput();
  p3.showOutput();
}
```

<hr>

### Static, Final, Const

<hr>

#### Final

For data members<br>
when you want to assign the value only once and want it to be fixed, use
final

There are two ways to define a constant:

-   Using final keyword
-   Using Const keyword

There's a difference in both ways<br>
In `const`, it happens at compile time and once assigned it cannot be
reassigned

In final within the class the value gets assigned at runtime. So, it can
be changed using the
constructor

If you want to use a constant value using a constructor within a class,
you have to put static in
front of the `const` variable.

So, when you use static it becomes the property of the class rather than
the object. static property
is same for all objects.

To access static variable

```dart
className.<staticVariableName>
```

You can use `final` and `const` outside classes too.

```dart
class X {
  final name; // type will be defined by inferred value
  static const int age = 24;

  X(this.name);
}

main() {
  var x = X('jack');
  print(x.name);

  print(X.age); // to access static object

  var y = X('Jill');
  print(y.name);

  // You can use final and const out of a class too
  final artistName = 'Lauv';
  const albums = 2;

  print(artistName);
  print(albums);
}
```

<hr>

### Inheritance

In dart, we use the extends keyword to implement inheritance.

```dart
class Vehicle {
  String model;
  int year;

  Vehicle(this.model, this.year) {
    print(this.model);
    print(this.year);
  }

  void showOutput() {
    print(model);
    print(year);
  }
}

class Car extends Vehicle {
  double price;

  Car(String model, int year, this.price) : super(model, year);

  void showOutput() {
    super.showOutput();
    print(this.price);
  }
}

void main() {
  var car1 = Car('Accord', 2014, 150000);
  car1.showOutput();
}
```

<hr>

### Method Overriding

Suppose in a class there is a class method and in the sub class there is
a method with the same name and we want to redefine it, it is called
method overriding.

If we want to let other programmers to know that this method is
overriding, you can use `@override` notation.

When you use `@override`, above a method signature, that means that the
compiler will know that this method is overriding.

Incase there is no method of the original name, it will show an error.
<br>i.e, If in desired, a method is defined with `@override` and there
is no method in base class with the same name, then it shows error like
"Method doesn't override an inherited method".

This is basically a safety feature in Dart. when you are overriding a
method, if you do not use the `@override` keyword, it would not show an
error. There is no issue for this.

You have to use `@override` when you don't have control of super class
method implementation.

Basically the intent of the `@override` notation is to catch situation
when a super class method
renames. <hr>

<b>A member on an independent subclass which used to override the member
could continue silently working with the superclass implementation.</b>

So, a good practice would be to use `@override` when you override a
superclass method.

```dart
class X {
  String name;

  X(this.name);

  void showOutput() {
    print(this.name);
  }

  dynamic square(dynamic val) {
    return val * val;
  }
}

class Y extends X {
  Y(String name) : super(name);

  @override
  void showOutput() {
    print(this.name);
    print('Hello');
  }

  //not using @override at this time
  dynamic square(dynamic val) {
    print(val);
    return val * val;
  }
}

void main() {
  Y y1 = Y('Leo');
  y1.showOutput();
  var k = y1.square(2);
  print(k);
}
```

<hr>

### Getter and Setters

They are special methods that provide read and write access to an
object's properties.

Normally, each instance variable has an implicit getter plus setter if
appropriate but if you want you can create additional property by
implementing getters and setters using the get and set keyword

num -> it is a type inherited from Integer and Double

When we have to call a method. we use () parenthesis but when we are
using the getter or setter, we
do not need to use parenthesis.

When we want to access any getter, we have to use the dot operator and
we want to use the setter, we have to call the setter name with an
assignment operator

```dart
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  //Define two calculated properties: right and bottom
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  print(rect.left);
  rect.right = 12;
  print(rect.left);
}
```

<hr>

### Exception Handling:

throw, catch, try, finally

To thrown exception, you have to use throw keyword and exception class
name and within the exception class name you can provide a message

```dart
int mustBeGreaterThanZero(int val) {
  if (val <= 0) {
    throw Exception('Value must be greater than zero');
  }
  return val;
}

void letsVerifyTheValue(var val) {
  var valueVerification;

  try {
    valueVerification = mustBeGreaterThanZero(val);
  } catch (e) {
    print(e);
  } finally {
    if (valueVerification == null) {
      print('Value is not accepted');
    } else {
      print('Value verifed: $valueVerification');
    }
  }
}

void main() {
  letsVerifyTheValue(10);
  letsVerifyTheValue(0);
}
```
