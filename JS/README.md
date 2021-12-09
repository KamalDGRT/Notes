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
myStr[0] = "H"; // Not Possible
myStr = "Hello"; // Possible
```

---

### 33. Bracket Notation to find Nth Character in String

```js
var firstName = "Ada";
var secondLetterOfFirstName = firstName[1];
console.log(secondLetterOfFirstName);

var lastName = "Lovelace";
var thirdLetterOfLastName = lastName[2];
console.log(thirdLetterOfLastName);
```

##### Output

```
d
v
```

---

### 34. Bracket Notation to Find Last Character in String

```js
var firstName = "Ada";
var lastLetterOfFirstName = firstName[firstName.length - 1];
console.log(lastLetterOfFirstName);

// var lastName = "Lovelace";
```

##### Output

```
a
```

---

### 35. Bracket Notation to Find Nth-to-Last Character in String

```js
var firstName = "Ada";
var secondLastLetterOfFirstName = firstName[firstName.length - 2];
console.log(secondLastLetterOfFirstName);
```

##### Output

```
d
```

---

-   In the arrays you can have any datatype.

```js
var arr = ["Jan", 24];
console.log(arr);
```

-   A nested array looks like this:

```js
var arr = [
    ["Bulls", 23],
    ["White Sox", 34],
];
```

-   Indexing works with arrays too.
-   Array indexes can be used to modify the data at a given index.
-   Bracket notation `[]` can be used to access elements of a multi-dimensional
    arrays.
-   Data can be appended to the end of an array using the `push()` function.
    It needs the value to be pushed as an argument.
-   Data can be removed from the end of an array using the `pop()` function.
    It returns the element removed.
-   Data can be removed from the start of an array using the `shift()` function.
    It returns the element removed.
-   Data can be appended to the start of an array using the `unshift()`
    function. It needs the value to be pushed as an argument.
-   Functions allow us to create reusable codes.
-   It is possible to assign a variable without using `var` keyword.
    If done such way, then the variable becoms global.
-   You can use `===` for strict equality checking.
-   You can use `!==` for strict inequality checking.
-   The usual comparision operators [`>`, `<`, `>=`, `<=`,] apply to JS too.
-   The usual logical operators [`!`, `&&`, `||`] apply to JS too.
-   If-else condition is also same as CPP.
-   Switch case concepts is same as CPP.
-   Switch case fall through is also present.

---

-   Object's values can be used through the `.` operator or the `[]` notation.
-   To delete a property use `delete <objectName>.<objectProperty>`.
-   To check if a object has a specific property:
    `<objName>.hasOwnProperty(<"propertyName">)`. It is often used with if
    condition.

---

### Record Collection

```js
/* Question:
If the value is an empty string remove that property.
If the property is tracks and if you have a value, instead of updating the
whole tracks, append the new value to the end of the tracks.
If the object does not have the property mentioned then create it.
*/

var collection = {
    2548: {
        album: "Slippery When Wet",
        artist: "Bon Jovi",
        tracks: ["Let it Rock", "You Give Love a Bad Name"],
    },
    2468: {
        album: "1999",
        artist: "Prince",
        tracks: ["1999", "Little Red Corvette"],
    },
    1245: {
        artist: "Robert Palmer",
        tracks: [],
    },
    5439: {
        album: "ABBA Gold",
    },
};

// Making a copy of the orginal object
var collectionCopy = JSON.parse(JSON.stringify(collection));

// Answer starts here.
function updateRecords(id, prop, value) {
    // if value is blank, remove the property
    if (value === "") {
        delete collection[id][prop];
    } else if (prop === "tracks") {
        // if the tracks property is doesn't exist, we need to create it
        collection[id][prop] = collection.[id][prop] || [];
        collection[id][prop].push(value);
    } else {
        collection[id][prop] = value;
    }

    return collection;
}

updateRecords(2468, "tracks", "test");
console.log(updateRecords(5439, "artist", "ABBA"));
```

---

-   `Math.random()` returns a random number `[0, 1)`
-   `Math.floor(Math.random() * n)` to generate random whole numbers `[0, n)`
-   To get a random number 2 limits:

```js
function randomRange(myMin, myMax) {
    return Math.floor(Math.random() * (myMax - myMin + 1)) + myMin;
}

console.log(randomRange(5, 15));
```

-   `parseInt()` takes in a string and returns an integer
-   `parseInt()` can also be used with a radix. i.e. bases.
-   Ternary operator `?:` concept is same as CPP.
-   Even though an array is declared as `const`, it can still be mutated.

```js
const = [5, 7, 2];
function editInPlace() {
    // s = [2, 7, 2]; This type of direct assignment is not possible.

    // This is possible
    s[0] = 2;
    s[1] = 5;
    s[2] = 7;
}
editInPlace();
console.log(s);
```

-   `Object.freeze(<objectName>);` prevents mutation even when `const` is used.

---

### Use Arrow functions to write concise anonymous functions

```js
// Example of an anonymous function
var magic = function () {
    return new Date();
};
```

-   Whenever you have an anonymous function, you can convert it to arrow a
    function.
-   The above thing can be done as:

```js
// Example of an arrow function
var magic = () => {
    return new Date();
};
```

-   The above line can still be simplified.

```js
var magic = () => new Date();
// Instead of `var`, `const` could be used.
```

-   Arrow functions with parameters

```js
// anonymous function
var myConcat = function (arr1, arr2) {
    return arr1.concat(arr2);
};
console.log(myConcat([1, 2], [3, 4, 5]));

// arrow function
var myConcat = (arr1, arr2) => arr1.concat(arr2);
console.log(myConcat([1, 2], [3, 4, 5]));
// Once again, instead of `var`, `const` could be used.
```

---

### Writing Higher Order Arrow Functions

-   Arrow functions work really well with higher order functions(HOF)
    such as `map`, `filter` and `reduce`
-   HOFs take functions as arguments for processing collections of data.
-   Whenever one function takes another function as an argument, that is a
    good time to use an arrow function.

```js
// Question: Get the square of positive integers.

const realNumberArray = [4, 5.6, -9.8, 3.14, 42, 6, 8, 8.34, -2];

const squareList = (arr) => {
    // This line is succint because of the arrow functions

    const squaredIntegers = arr
        .filter(
            // The filter function is going to give us the positive integers
            // Usually you use paranthesis for arrow functions.
            // but if you have a single argument it is not needed.
            (num) => Number.isInteger(num) && num > 0
        )
        .map(
            // To get the square of each number in the array we are using map()
            // x means every element from the array that is passed to it
            (x) => x * x
        );
    return squaredIntegers;
};

const squaredIntegers = squaredList(realNumberArray);
console.log(squaredIntegers);
```

---

#### Rest Operator

-   The rest operator allows you to create a function that takes a variable
    number of arguments.
-   The rest operator is 3 dots `...`

```js
const sum = (function () {
    return function sum(...args) {
        return args.reduce((a, b) => a + b, 0);
    };
})();

console.log(sum(1, 2, 3, 4, 5));
```

#### Use the spread operator to evaluate arrays in-place

-   The spread operator looks just like the rest operator (3 dots `...`)
-   It expands an already existing array or it spreads out an array.
-   It takes an array and spreads out into its individual parts.
-   So, it can be used to make a copy of an existing variable.

```js
const arr1 = ["JAN", "FEB", "MAR", "APR", "MAY"];
let arr2;

(function () {
    arr2 = [...arr1];
    arr1[0] = "potato";
})();
console.log(arr2);
```

#### Use destructuring assignment to assign variables from objects

```js
var voxel = { x: 3.6, y: 7.4, z: 6.54 };

// Old way of reading the object's values and assigning to another variable
var x = voxel.x; // x = 3.6
var y = voxel.y; // y = 7.4
var z = voxel.z; // z = 6.54

// New way of doing things.
// The values of x, y, z from the object are assigned to a, b, c respectively
const { x: a, y: b, z: c } = voxel; // a = 3.6, b = 7.4, c = 6.54
```

#### Destructuring assignment with nested objects

```js
const LOCAL_FORECAST = {
    today: { min: 72, max: 83 },
    tomorrow: { min: 73.3, max: 84.6 },
};

function getMaxOfTomorrow(forecast) {
    const {
        tomorrow: { max: maxOfTomorrow },
    } = forecast;
    return maxOfTomorrow;
}

console.log(getMaxOfTomorrow(LOCAL_FORECAST));
```

#### Use Destructuring Assignment to Assign Variables from Arrays

-   You can use destructuring assignment to assign variables from arrays.

```js
const [z, x] = [1, 2, 3, 4, 5, 6];
console.log(z, x);
// 1,2
// assigns the first 2 elements of the array to z and x respectively.
```

-   The difference between destructuring from arrays and destructuring from
    objects is that you cannot specify which element from the array should go
    into a variable.
-   It just goes in order.
-   However, if you want the 4th element, you can add empty commas.

```js
const [z, x, , y] = [1, 2, 3, 4, 5, 6];
console.log(z, x, y);
// 1,2,4
```

-   You can use destructuring of arrays to switch the places of variables.

```js
let a = 8,
    b = 6;

(() => {
    [a, b] = [b, a];
})();

console.log(a);
console.log(b);
```

#### Use destructuring assignment with the rest operator

-   We can do it to re-assign array elements.

```js
const source = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
function removeFirstTwo(list) {
    const [, , ...arr] = list;

    return arr;
}

const arr = removeFirstTwo(source);
console.log(arr);
console.log(source);
```

##### Output

```
[
  3, 4, 5,  6,
  7, 8, 9, 10
]
[
  1, 2, 3, 4,  5,
  6, 7, 8, 9, 10
]
```

#### Use destructuring assignment to pass an object as a function's parameters

```js
const stats = {
    max: 56.78,
    standard_deviation: 4.34,
    median: 34.54,
    mode: 23.87,
    min: -0.75,
    average: 35.85,
};
const half = (function () {
    return function half({ max, min }) {
        return (max + min) / 2.0;
    };
})();
console.log(stats);
console.log(half(stats));
```

##### Output

```
{
  max: 56.78,
  standard_deviation: 4.34,
  median: 34.54,
  mode: 23.87,
  min: -0.75,
  average: 35.85
}
28.015
```

#### Creating Strings using Template Literals

```js
const person = {
    name: "Zodiac Hasbro",
    age: 56,
};

// Template literal with multi-line and string interpolation
const greeting = `Hello, my name is ${person.name}!
I am ${person.age} years old.`;

console.log(greeting);

const result = {
    success: ["max-length", "no-amd", "prefer-arrow-functions"],
    failure: ["no-var", "var-on-top", "linebreak"],
    skipped: ["id-blacklist", "no-dup-keys"],
};
function makeList(arr) {
    const resultDisplayArray = [];
    for (let i = 0; i < arr.length; i++) {
        resultDisplayArray.push(`<li class="text-warning">${arr[i]}</li>`);
    }

    return resultDisplayArray;
}
/**
 * makeList(result.failure) should return:
 * [ `<li class="text-warning">no-var</li>`,
 *   `<li class="text-warning">var-on-top</li>`,
 *   `<li class="text-warning">linebreak</li>` ]
 **/
const resultDisplayArray = makeList(result.failure);

console.log(resultDisplayArray);
```

##### Output

```
Hello, my name is Zodiac Hasbro!
I am 56 years old.
[
  '<li class="text-warning">no-var</li>',
  '<li class="text-warning">var-on-top</li>',
  '<li class="text-warning">linebreak</li>'
]
```

#### Write Concise Object Literal Declarations Using Simple Fields

Usually we do this

```js
const createPerson = (name, age, gender) => {
    return {
        name: name,
        age: age,
        gender: gender,
    };
};
console.log(createPerson("Zodiac Hasbro", 56, "male"));
```

-   In the above example we have the `name:name`, `age:age` and `gender:gender`.
-   Instead of doing that, you can just do this:

```js
const createPerson = (name, age, gender) => ({ name, age, gender });
console.log(createPerson("Zodiac Hasbro", 56, "male"));
```

#### Write Concise Declarative Functions with ES6

-   Old roundabout way of using a funciton inside an object

```js
const bicycle = {
    gear: 2,
    setGear: function (newGear) {
        this.gear = newGear;
    },
};

bicycle.setGear(3);
console.log(bicycle.gear);
```

-   ES6 way of doing it - just removed the `: function` part

```js
const bicycle = {
    gear: 2,
    setGear(newGear) {
        this.gear = newGear;
    },
};

bicycle.setGear(3);
console.log(bicycle.gear);
```

#### Use class Syntax to Define a Constructor Function

-   Older way of creating object with a `new` keyword.

```js
var SpaceShuttle = function (targetPlanet) {
    this.targetPlanet = targetPlanet;
};
var zeus = new SpaceShuttle("Jupiter");

console.log(zeus.targetPlanet);
```

-   ES6 way of doing things:

```js
class SpaceShuttle {
    constructor(targetPlanet) {
        this.targetPlanet = targetPlanet;
    }
}
var zeus = new SpaceShuttle("Jupiter");

console.log(zeus.targetPlanet);
```

-   Example 2

```js
function makeClass() {
    class Vegetable {
        constructor(name) {
            this.name = name;
        }
    }
    return Vegetable;
}
const Vegetable = makeClass();
const carrot = new Vegetable("carrot");
console.log(carrot.name);
```

#### Use getters and setters to Control Access to an Object

-   Example 1

```js
class Book {
    constructor(author) {
        this._author = author;
    }
    // getter
    get writer() {
        return this._author;
    }
    // setter
    set writer(updatedAuthor) {
        this._author = updatedAuthor;
    }
}
```

-   Example 2

```js
function makeClass() {
    class Thermostat {
        constructor(temp) {
            this._temp = (5 / 9) * (temp - 32);
        }
        get temperature() {
            return this._temp;
        }
        set temperature(updatedTemp) {
            this._temp = updatedTemp;
        }
    }
    return Thermostat;
}

const Thermostat = makeClass();
const thermos = new Thermostat(76);
let temp = thermos.temperature;
thermos.temperature = 26;
temp = thermos.temperature;
console.log(temp);
```

#### Why Using Getters and Setters?

-   It gives simpler syntax
-   It allows equal syntax for properties and methods
-   It can secure better data quality
-   It is useful for doing things behind-the-scenes
-   It's perfect for classes that will usually only be instantiated
    once per include.

#### Understand the differences between require and import

-   In the past people would use the require function to import functions and
    code from other files.
-   But now we have import and export.
-   You can export code from one file and import it in another file.
-   It also allows you to only import certain functions or certain variables.

```js
// string_function.js
export const capitalizeString = str => str.toUpperCase()
```

```js
// index.js
import { capitalizeString } from "./string_function"
const cap = capitalizeString("hello!");

console.log(cap);
```

#### Use export export to reuse a code block

```js
const capitalizeString = (string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

export { capitalizeString };

export const foo = "bar";
export const bar = "foo";
```

#### Use * to Import Everything from a File

```js
import * as capitalizeStrings from "capitalize_strings";

// capitalizeStrings is the object name.
// The object name can be anything but for best practices it is recommended
// to use the camel casing of the imported file.
// It is through this object we will access imported objects.
```

#### Create an Export Fallback with export default

-   In the previous exports, we saw about named exports.
-   There is also something called as export defaults.
-   This is a fallback export and it is often used if you want to export
    only one thing from a file.

```js
export default function subtract(x,y) {return x - y;}
```

#### Import a default export

-   It is pretty much the same as before but there is a slight difference.
-   Lets say we have a file `math_functions.js` and in that we have a default
    export `subtract`.
-   The difference is we won't be using curly braces for default import but we
    still have to say what it is from. i.e. `math_functions`.

```js
import subtract from "math_functions";

subtract(7,4);
```
