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
