# JavaScript Notes

### 1. Running a JS

-   No installation needed.
-   All web browsers can run JS.

To code:

-   Sublime Text / VS Code / Atom
-   freeCodeCamp Editor
-   CodePen - JS & Console
-   Scrimba

---

### 2. Comment Your JS Code

-   Comments are lines of code that JS will intentionally ignore.
-   They are just used to create notes for yourself and others about what the
    code does.

```js
// in-line comment
```

```js
/* 
This is a multi line
comment
*/
```

---

### 3. Datatypes & Variables

-   In CS, data is anything that is meaningful to the computer.
-   JS provides 7 different datatypes that you can see.
-   Datatypes:

    -   Undefined
    -   null
    -   boolean
    -   string
    -   symbol
    -   number
    -   object

-   **string** is any sort of text
-   **undefined**: It is something that hasn't been defined. You may have a
    variable that you haven't set to be anything yet.
-   **null** means nothing. You've set it to be something and that sometimes
    is nothing.
-   **boolean**: means true or false.
-   **symbol**: It is an immutable primitive value that is unique.
-   **object** can store a lot of different key value pairs.

-   You are often going to set data into a variable.
-   A variable allows computers to store and manipulate data in a dynamic
    fashion.
-   It is basically a lable to point to the data.
-   A variable is almost like a box and you can fill it with anything.

##### Declaring variables

-   To declare a variable, one way is to use the `var` keyword.
-   `var` stands for variable.
-   It can be set to anything and can be of any datatypes above but it's
    common to set it to a string.
-   Example:

    ```js
    var myName = "Kamal";
    ```

-   There are 3 ways to declare a variable in JS.
-   2<sup>nd</sup> way is using `let` keyword.
-   Example:

    ```js
    let ourName = "freeCodeCamp";
    ```

-   The third way is to use `const`.
-   Example:

    ```js
    const pi = 3.14;
    ```

##### The difference between `var`, `let` & `const`

-   `var` is going to be able to be used throughout your whole program.
-   `let` will only be used within the scope of where you declare it.
-   `const` is a variable that should never & can never change. i.e., it is
    immutable.

---

### 4. Storing values with Assignment Operator

-   There is a difference between declaring variables and assigning variables.
-   Example:

```js
var a; // declaration
var b = 2; // declaration + assignment
// It means '2' is assigned to 'b'
a = 7; // just assignment
```

---

### 5. Initializing variables with Assignment operator

```js
var a = 9;
```

---

### 6. Uninitialized variables

Example:

```js
var a;
var b;
var c;
```

-   They are uninitialized.
-   That means their value is undefined.
-   We have not set them to anything.

So,

```js
var a = 5;
var b = 10;
var c = "I am a ";

a = a + 1;
b = b + 5;
c = c + "String!";

console.log(a);
console.log(b);
console.log(c);
```

##### Output

```
6
15
I am a String!
```

---

### 7. Case sensitivity in variable

-   Variable names and function names in JS are case-sensitive.
-   That means the capitalization matters.

So,

```js
var aBc;
ABC = 10;
```

-   Both are not the same even though they have the same letters.
-   General practice is to use camel case.

---

### 8. Adding numbers

-   Adding 2 numbers in JS is pretty straightforward.
-   You use the `+` operator.

```js
var sum = 10 + 10;
console.log(sum);
```

##### Output

```
20
```

---

### 9. Subtracting Numbers

-   The `-` operator is used.

```js
var diff = 45 - 33;
console.log(diff);
```

##### Output

```
12
```

---

### 10. Multiplying Numbers

-   The `*` operator is used.

```js
var product = 8 * 10;
console.log(product);
```

##### Output

```
80
```

---

### 11. Dividing numbers

-   The `/` operator is used.

```js
var quotient = 66 / 33;
console.log(quotient);
```

##### Output

```
2
```

---

### 12. Incrementing Numbers

-   To increment a number, add `1` to it.

```js
var myVar = 87;
myVar = myVar + 1;
console.log(myVar);

myVar++;
console.log(myVar);

myVar += 1;
console.log(myVar);

++myVar;
console.log(myVar);
```

##### Output

```
88
89
90
91
```

---

### 13. Decrementing Numbers

-   To decrement a number, subtract `1` from it.

```js
var myVar = 11;
myVar = myVar - 1;
console.log(myVar);

myVar--;
console.log(myVar);

myVar -= 1;
console.log(myVar);

--myVar;
console.log(myVar);
```

##### Output

```
10
9
8
7
```

---

### 14. Decimal Numbers

-   These arealso referred to as floating point numbers or floats.
-   Example:
-   Any number that has a decimal point in it is a decimal point number.

```js
var ourDecmial = 5.7;
```

---

### 15. Multiply Decimals

-   It is same as multiplying integers.
-   `*` operator is used.

```js
var product = 2.05 * 2.5;
console.log(product);
```

##### Output

```
5.125
```

---

### 16. Dividing Decimals

-   It is same as dividing integers.
-   `/` operator is used.

```js
var quotient = 4.4 / 2.0;
console.log(quotient);
```

##### Output

```
2.2
```

---

### 17. Finding a remainderr

-   The modulo `%` operator gives us the remainder of 2 numbers.
-   Example:

```js
var remainder = 11 % 3;
console.log(remainder);
```

##### Output

```
2
```

---

### 18. Compound Assignment with Augmented Addition

```js
var a = 3;
var b = 17;
var c = 12;

a = a + 12;
b = a + b;
c = c + 7;

// The above statements can be written as

a += 12;
b += a;
c += 7;
```

---

### 19. Compound Assignment with Augmented Subtraction

```js
var a = 11;
var b = 9;
var c = 3;

a = a - 6;
b = b - 15;
c = c + 1;

// The above statements can be written as

a -= 6;
b -= 15;
c -= 1;
```

---

### 20. Compound Assignment with Augmented Multiplication

```js
var a = 5;
var b = 12;
var c = 4.6;

a = a * 5;
b = b * 3;
c = c * 10;

// The above statements can be written as

a *= 5;
b *= 3;
c *= 10;
```

---

### 21. Compound Assignment with Augmented Division

```js
var a = 48;
var b = 108;
var c = 33;

a = a / 12;
b = b / 4;
c = c / 11;

// The above statements can be written as

a /= 12;
b /= 4;
c /= 11;
```

---

### 22. Declaring String Variables

-   Can be enclosed in either single quotes or the double quotes.

```js
var firstName = "Alan";
var lastName = "Turning";
```

---

### 23. Escaping Literal Quotes in Strings

Example:

```js
var myStr = 'I am a "double quoted" string inside "double quotes"';
console.log(myStr);
```

##### Output

```
I am a "double quoted" string inside "double quotes"
```

---

### 24. Quoting Strings with Single Quotes

-   Instead of using escape sequences you can first enclose the entire string
    in single quotes and then can use the double quotes in it.

```js
var myStr = '<a href="http://www.example.com" target="_blank">link</a>';
```

-   To use single quotes and double quotes you can use back ticks.

```js
var myStr = `'<a href="www.google.com">link</a>'`;
console.log(myStr);
```

##### Output

```
'<a href="www.google.com">link</a>'
```

---

### 25. Escape Sequence in Strings

| Code | Output          |
| ---- | --------------- |
| `\'` | single quote    |
| `\"` | double quote    |
| `\\` | back slash      |
| `\n` | new line        |
| `\r` | carriage return |
| `\t` | tab             |
| `\b` | back space      |
| `\f` | form feed       |

```js
var myStr = "First Line \n\t\\Second Line\nThird Line";
console.log(myStr);
```

##### Output

```
First Line
	\Second Line
Third Line
```

---

### 26. Concatenating Strings With Plus Operator

```js
var str1 = "first" + "second";
var str2 = "start" + "end";
console.log(str1);
console.log(str2);
```

##### Output

```
firstsecond
startend
```

---

### 27. Concatenating Strings with Plus Equals operator.

```js
var str1 = "first";
str1 += "second";
console.log(str1);
```

##### Output

```
firstsecond
```

---

### 28. Constructing Strings with variables

```js
var myName = "Alan";
var str = "My name is " + myName + ".";
console.log(str);
```

##### Output

```
My name is Alan.
```

---

### 29. Appending variables to Strings

```js
var anAdjective = "awesome";
var myStr = "I am ";
myStr += anAdjective;
console.log(myStr);
```

##### Output

```
I am awesome
```

---

### 30. Finding the length of a string

```js
var nameLength = 0;
var myName = "Alan";
nameLength = myName.length;
console.log(nameLength);
```

##### Output

```
4
```

---

### 31. Bracket Notation to find first character in string

```js
var name = "Alan";
var firstCharacter = name[0];
console.log(firstCharacter);
```

##### Output

```
A
```

---

### 32. String Immutability

-   Strings are immutable. i.e., they cannot be altered once created.
-   This does not mean they cannot be changed.
-   Just that the individual characters of a string literal cannot be changed.

```js
var myStr = "Jello";
myStr[0] = "H";  // Not Possible
myStr = "Hello"; // Possible
```
