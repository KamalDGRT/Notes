# PHP Notes

-   1.  Introduction to PHP & Features
-   2.  PHP Scripts
-   3.  Data Types
-   4.  Variables
-   5.  Operators
-   6.  Control Structures
-   7.  Working with Arrays
-   8.  Functions
-   9.  Working with Files
-   10. Working with Databases

### 1. Introduction to PHP & Features

PHP is a server scripting language, and a powerful tool for making dynamic and interactive
Web pages.

PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft's ASP.

##### Example

```php
    <?php
        echo "Hellow World!";
    ?>
```

##### What You Should Already Know

Before you continue you should have a basic understanding of the following:

-   HTML
-   CSS
-   JavaScript

#### What is PHP?

-   PHP is an acronym for "PHP: Hypertext Preprocessor"
-   PHP is a widely-used, open source scripting language
-   PHP scripts are executed on the server
-   PHP is free to download and use

#### What is a PHP File?

-   PHP files can contain text, HTML, CSS, JavaScript, and PHP code
-   PHP code are executed on the server, and the result is returned to the browser as plain HTML
-   PHP files have extension ".php"

#### What Can PHP Do?

-   PHP can generate dynamic page content
-   PHP can create, open, read, write, delete, and close files on the server
-   PHP can collect form data
-   PHP can send and receive cookies
-   PHP can add, delete, modify data in your database
-   PHP can be used to control user-access
-   PHP can encrypt data
-   With PHP you are not limited to output HTML. You can output images, PDF files, and even Flash movies. You can also output any text, such as XHTML and XML.

#### Why PHP?

-   PHP runs on various platforms (Windows, Linux, Unix, Mac OS X, etc.)
-   PHP is compatible with almost all servers used today (Apache, IIS, etc.)
-   PHP supports a wide range of databases
-   PHP is free. Download it from the official PHP resource: www.php.net
-   PHP is easy to learn and runs efficiently on the server side

#### To start using PHP, you can:

-   Find a web host with PHP and MySQL support
-   Install a web server on your own PC, and then install PHP and MySQL

#### Use a Web Host with PHP Support

-   If your server has activated support for PHP you do not need to do anything.
-   Just create some .php files, place them in your web directory, and the server will automatically parse them for you.
-   You do not need to compile anything or install any extra tools.
-   Because PHP is free, most web hosts offer PHP support.
-   Set Up PHP on Your Own PC

#### However, if your server does not support PHP, you must:

install a web server
install PHP
install a database, such as MySQL

<hr>

### 2. PHP Scripts

#### Basic PHP Syntax

-   A PHP script can be placed anywhere in the document.
-   A PHP script starts with `<?php` and ends with `?>`
-   PHP statements end with a semicolon (;)

```php
<?php
    //PHP code goes here
?>
```

#### Comments in PHP

-   A comment in PHP code is a line that is not read/executed as part of the program.
-   Its only purpose is to be read by someone who is looking at the code.

#### Comments can be used to:

-   Let others understand what you are doing
-   Remind yourself of what you did - Most programmers have experienced coming
    back to their own work a year or two later and having to re-figure out what they
    did.
-   Comments can remind you of what you were thinking when you wrote the code

##### Example

```php
<?php
    // This is a single-line comment

    # This is also a single-line comment

    /*
        This is a multiple-lines comment
        block that spans over multiple
        lines
    */

    // You can also use comments to leave out parts of a code line
    $x = 5 /* + 15 */ + 5;
    echo $x;
?>
```

##### Output

```
10
```

<hr>

### 3. Data Types

-   Variables can store data of different types, and different data types can do
    different things.
-   PHP supports the following data types:
    -   String
    -   Integer
    -   Float (floating point numbers - also called double)
    -   Boolean
    -   Array
    -   Object
    -   NULL
    -   Resource

#### PHP String

-   A string is a sequence of characters, like "Hello world!".
-   A string can be any text inside quotes. You can use single or double quotes:

##### Example

```php
    <?php
        $x = "Hello world!";
        $y = 'Hello world!';
        echo $x;
        echo "<br>";
        echo $y;
    ?>
```

##### Output

```
Hello world!
Hello world!
```

#### String Functions

-   Get The Length of a String
-   The PHP strlen() function returns the length of a string.
-   The example below returns the length of the string "Hello world!":

##### Example

```php
    <?php
        echo strlen("Hello world!");
    ?>
```

##### Output

```
12
```

#### Count The Number of Words in a String

-   The PHP str_word_count() function counts the number of words in a string.

##### Example

```php
<?php
    echo str_word_count("Hello world!");
?>
```

##### Output

```
2
```

#### Reverse a String

-   The PHP strrev() function reverses a string.

##### Example

```php
<?php
    echo strrev("Hello world!");
?>
```

##### Output

```
!dlrow olleH
```

#### Search For a Specific Text Within a String

-   The PHP strpos() function searches for a specific text within a string.
-   If a match is found, the function returns the character position of the first match.
-   If no match is found, it will return FALSE.
-   The example below searches for the text "world" in the string "Hello world!".

##### Example

```php
<?php
    echo strpos("Hello world!", "world");
?>
```

##### Output

```
6
```

#### Replace Text Within a String

-   The PHP str_replace() function replaces some characters with some other characters in a string.
-   The example below replaces the text "world" with "Dolly".

##### Example

```php
<?php
    echo str_replace("world", "Dolly", "Hello world!");
?>
```

##### Output

```
Hello Dolly!
```

#### PHP Integer

-   An integer data type is a non-decimal number between -2,147,483,648 and
    2,147,483,647.

#### Rules for integers

-   An integer must have at least one digit
-   An integer must not have a decimal point
-   An integer can be either positive or negative
-   Integers can be specified in three formats: decimal (10-based), hexadecimal (16-
    based - prefixed with 0x) or octal (8-based - prefixed with 0)
-   In the following example $x is an integer. The PHP var_dump() function
    returns the data type and value.

##### Example

```php
<?php
    $x = 5985;
    var_dump($x);
?>
```

##### Output

```
int(5985)
```

#### PHP Float

-   A float (floating point number) is a number with a decimal point or a number in
    exponential form.
-   In the following example $x is a float. The PHP var_dump() function returns the
    data type and value.

##### Example

```php
<?php
    $x = 10.365;
    var_dump($x);
?>
```

##### Output

```
float(10.365)
```

##### PHP Boolean

-   A Boolean represents two possible states: TRUE or FALSE.

```php
$x = true;
$y = false;
```

-   Booleans are often used in conditional testing.

#### PHP Array

-   An array stores multiple values in one single variable.
-   An array is a special variable, which can hold more than one value at a time.
-   If you have a list of items (a list of car names, for example), storing the cars
    in single variables could look like this.

```php
$cars1 = "Volvo";
$cars2 = "BMW";
$cars3 = "Toyota";
```

-   However, what if you want to loop through the cars and find a specific one?
-   And what if you had not 3 cars, but 300?
-   The solution is to create an array!
-   An array can hold many values under a single name, and you can access the
    values by referring to an index number.
-   In PHP, the array() function is used to create an array:
    array();

##### Example

```php
<?php
    $cars = array("Volvo", "BMW", "Toyota");
    echo "I like " . $cars[0] . ", " . $cars[1] . " and " . $cars[2] . ".";
?>
```

##### Output

```
I like Volvo, BMW and Toyota.
```

-   In PHP, there are three types of arrays:
    -   **Indexed arrays** - Arrays with a numeric index
    -   **Associative arrays** - Arrays with named keys
    -   **Multidimensional arrays** - Arrays containing one or more arrays

<hr>

### 4. Variables

-   Variables are "containers" for storing information.
-   Creating (Declaring) PHP Variables : In PHP, a variable starts with the `$` sign,
    followed by the name of the variable.

##### Example

```php
<?php
    $txt = "Hello world!";
    $x = 5;
    $y = 10.5;
    echo $txt;
    echo "<br>";
    echo $x;
    echo "<br>";
    echo $y;
?>
```

-   After the execution of the statements above
    -   the variable `$txt` will hold the value `Hello world!`
    -   the variable `$x` will hold the value `5`
    -   the variable `$y` will hold the value `10.5`

##### Output

```
Hello world!
5
10.5
```

##### Note

-   When you assign a text value to a variable, put quotes around the value.
-   Unlike other programming languages, PHP has no command for declaring a variable.
-   It is created the moment you first assign a value to it.

#### Rules for PHP variables:

-   A variable can have a short name (like x and y) or a more descriptive name (age,
    carname, total_volume).
-   A variable starts with the $ sign, followed by the name of the variable
-   A variable name must start with a letter or the underscore character
-   A variable name cannot start with a number
    A variable name can only contain alpha-numeric characters and underscores (`A`-
    `z`, `0`-`9`, and `_` )
-   Variable names are case-sensitive (`$age` and `$AGE` are two different variables)

#### Output Variables

-   The PHP `echo` statement is often used to output data to the screen.
-   The following example will show how to output text and a variable.

##### Example

```php
<?php
    $txt = "Hogwarts";
    echo "I love $txt!";
?>
```

##### Output

```
I love Hogwarts!
```

##### Example

```php
<?php
    $txt = "Hogwarts";
    echo "I love " . $txt . "!";
?>
```

##### Output

```
I love Hogwarts!
```

##### Example

```php
<?php
    $x = 5;
    $y = 4;
    echo $x + $y;
?>
```

##### Output

```
9
```

#### PHP Variables Scope

-   In PHP, variables can be declared anywhere in the script.
-   The scope of a variable is the part of the script where the variable can be referenced/used.
-   PHP has three different variable scopes:
    -   local
    -   global
    -   static

#### Global and Local Scope

-   A variable declared outside a function has a GLOBAL SCOPE and can only be accessed outside a function.

##### Example

```php
<?php
    $x = 5; // global scope
    function myTest() {
        // using x inside this function will generate an error
        echo "Variable x inside function is: $x";
    }
    myTest();
    echo "Variable x outside function is: $x";
?>
```

##### Output

```
Variable x inside function is:
Variable x outside function is: 5
```

-   A variable declared within a function has a LOCAL SCOPE and can only be accessed within that function.

##### Example

```php
<?php
    function myTest() {
        $x = 5; // local scope
        echo "Variable x inside function is: $x";
    }
    myTest();
    // using x outside the function will generate an error
    echo "Variable x outside function is: $x";
?>
```

##### Output

```
Variable x inside function is: 5
Variable x outside function is:
```

#### The global Keyword

-   The global keyword is used to access a global variable from within a function.
-   To do this, use the global keyword before the variables (inside the function).

##### Example

```php
<?php
    $x = 5;
    $y = 10;

    function myTest() {
        global $x, $y;
        $y = $x + $y;
    }

    myTest(); // run function
    echo $y; // output the new value for variable $y
?>
```

##### Output

```
15
```

#### The static Keyword

-   Normally, when a function is completed/executed, all of its variables are deleted.
-   However, sometimes we want a local variable NOT to be deleted. We need it for a
    further job.
-   To do this, use the static keyword when you first declare the variable.

##### Example

```php
<?php
    function myTest() {
        static $x = 0;
        echo $x;
        $x++;
    }
    myTest();
    echo "<br>";
    myTest();
    echo "<br>";
    myTest();
?>
```

##### Output

```
0
1
2
```

#### `echo` and `print` Statements

##### - In PHP there are two basic ways to get output: `echo` and `print`

-   In most of the examples here we have used `echo` (and `print`).
-   `echo` and `print` are more or less the same.
-   They are both used to output data to the screen.
-   The differences are small:
    -   `echo` has no return value while `print` has a return value of 1 so it can be used in expressions.
    -   `echo` can take multiple parameters (although such usage is rare) while `print` can take one argument.
    -   `echo` is marginally faster than `print`.

#### `echo` Statement

-   The `echo` statement can be used with or without parentheses: `echo` or `echo()`.

#### Display Text

-   The following example shows how to output text with the `echo` command (notice that the
    text can contain HTML markup).

##### Example

```php
<?php
    echo "PHP is Fun!<br>";
    echo "Hello world!<br>";
    echo "I'm about to learn PHP!<br>";
    echo "This ", "string ", "was ", "made ", "with multiple parameters.";
?>
```

##### Output

```
PHP is Fun!
Hello world!
I'm about to learn PHP!
This string was made with multiple parameters.
```

#### Display Variables

-   The following example shows how to output text and variables with the echo statement.

##### Example

```php
<?php
    $txt1 = "Learn PHP";
    $txt2 = "Hogwarts";
    $x = 5;
    $y = 4;
    echo "<h2>" . $txt1 . "</h2>";
    echo "Study PHP at " . $txt2 . "<br>";
    echo $x + $y;
?>
```

##### Output

```
Learn PHP
Study PHP at Hogwarts
9
```

#### The PHP `print` Statement

-   The `print` statement can be used with or without parentheses: `print` or `print()`.

##### Display Text

-   The following example shows how to output text with the `print` command (notice that the
    text can contain HTML markup).

##### Example

```php
<?php
    print "<h2>PHP is Fun!</h2>";
    print "Hello world!<br>";
    print "I'm about to learn PHP!";
?>
```

##### Output

```
PHP is Fun!
Hello world!
I'm about to learn PHP!
```

##### Display Variables

-   The following example shows how to output text and variables with the `print` statement.

##### Example

```php
<?php
    $txt1 = "Learn PHP";
    $txt2= "Hogwarts";
    $x = 5;
    $y = 4;
    print "<h2>" . $txt1 . "</h2>";
    print "Study PHP at " . $txt2 . "<br>";
    print $x + $y;
?>
```

##### Output

```
Learn PHP
Study PHP at Hogwarts
9
```

#### PHP Object

-   An object is a data type which stores data and information on how to process that data.
-   In PHP, an object must be explicitly declared.
-   First we must declare a class of object.
-   For this, we use the class keyword.
-   A class is a structure that can contain properties and methods.

##### Example

```php
<?php
    class Car {
        function Car() {
            $this->model = "VW";
        }
    }

    // create an object
    $herbie = new Car();
    // show object properties
    echo $herbie->model;
?>


```

##### Output

```
VW
```

#### PHP Objects

-   An??Object??is an individual instance of the data structure defined by a class.
-   We define a class once and then make many objects that belong to it.
-   Objects are also known as instances.

#### Creating an Object:

-   Following is an example of how to create object using??new??operator.

```php
<?php
    class Books {
        var $price;
        var $title;

        function setPrice($par){
            $this->price = $par;
        }

        function getPrice(){
            echo $this->price."<br>";
        }

        function setTitle($par){
            $this->title = $par;
        }

        function getTitle(){
            echo $this->title."<br>" ;
        }
    }
    $maths = new Books;
    $maths->setTitle( "Algebra" );  /* Setting title and prices for the object */
    $maths->setPrice( 7 );
    $maths->getTitle();
    $maths->getPrice();             /* Calling Member Functions */????
?>
```

#### PHP NULL Value

-   Null is a special data type which ca n have only one value: NULL.
-   A variable of data type NULL is a variable that has no value assigned to it.
-   If a variable is created without a value, it is automatically assigned a value of NULL.
-   Variables can also be emptied by setting the value to NULL.

##### Example

```php
<?php
    $x = "Hello world!";
    $x = null;
    var_dump($x);
?>
```

##### Output

```
NULL
```

#### Constants

-   Constants are like variables except that once they are defined they cannot be changed or undefined.

#### PHP Constants

-   A constant is an identifier (name) for a simple value.
-   The value cannot be changed during the script.
-   A valid constant name starts with a letter or underscore (no `$` sign before the constant name).
-   Note: Unlike variables, constants are automatically global across the entire script.

#### Create a PHP Constant

-   To create a constant, use the define() function.
-   Syntax
    ```php
        define(name, value, case-insensitive)
    ```

##### Parameters:

-   `name`: Specifies the name of the constant
-   `value`: Specifies the value of the constant
-   `case-insensitive`: Specifies whether the constant name should be case- insensitive. Default is false.
-   The example below creates a constant with a case-sensitive name.

##### Example

```php
<?php
    // case-sensitive constant name
    define("GREETING", "Welcome to Hogwarts!");
    echo GREETING;
?>
```

##### Output

```
Welcome to Hogwarts!
```

-   The example below creates a constant with a case-insensitive name:

##### Example

```php
<?php
    // case-insensitive constant name
    define("GREETING", "Welcome to Hogwarts!", true);
    echo greeting;
?>
```

##### Output

```
Welcome to Hogwarts!
```

#### Constants are Global

-   Constants are automatically global and can be used across the entire script.
-   The example below uses a constant inside a function, even if it is defined outside the function.

##### Example

```php
<?php
    define("GREETING", "Welcome to Hogwarts!");
    function myTest() {
        echo GREETING;
    }
    myTest();
?>
```

##### Output

```
Welcome to Hogwarts!
```

<hr>

### 5. Operators

-   Operators are used to perform operations on variables and values.

##### PHP divides the operators in the following groups

-   Arithmetic operators
-   Assignment operators
-   Comparison operators
-   Increment/Decrement operators
-   Logical operators
-   String operators
-   Array operators

#### PHP Arithmetic Operators

The PHP arithmetic operators are used with numeric values to perform common
arithmetical operations, such as addition, subtraction, multiplication etc.

| Operator | Name           | Example    | Result                                                              |
| -------- | -------------- | ---------- | ------------------------------------------------------------------- |
| `+`      | Addition       | `$x + $y`  | Sum of `$x` and `$y`                                                |
| `-`      | Subtraction    | `$x - $y`  | Difference of `$x` and `$y`                                         |
| `*`      | Multiplication | `$x * $y`  | Product of `$x` and `$y`                                            |
| `/`      | Division       | `$x / $y`  | Quotient of `$x` and `$y`                                           |
| `%`      | Modulus        | `$x % $y`  | Remainder of `$x` divided by `$y`                                   |
| `**`     | Exponentiation | `$x ** $y` | Result of raising `$x` to the `$y`'th power (Introduced in PHP 5.6) |

#### PHP Assignment Operators

-   The PHP assignment operators are used with numeric values to write a value to a variable.
-   The basic assignment operator in PHP is "`=`".
-   It means that the left operand gets set to the value of the assignment expression on the right.

| Assignment | Same as     | Description    |
| ---------- | ----------- | -------------- |
| `x += y`   | `x = x + y` | Addition       |
| `x -= y`   | `x = x - y` | Subtraction    |
| `x *= y`   | `x = x * y` | Multiplication |
| `x /= y`   | `x = x / y` | Division       |
| `x %= y`   | `x = x % y` | Modulus        |

#### PHP Comparison Operators

-   The PHP comparison operators are used to compare two values (number or string).

| Operator | Name                     | Example     | Result                                                                        |
| -------- | ------------------------ | ----------- | ----------------------------------------------------------------------------- |
| `==`     | Equal                    | `$x == $y`  | Returns `true` if `$x` is equal to `$y`                                       |
| `===`    | Identical                | `$x === $y` | Returns `true` if `$x` is equal to `$y`, and they are of the same type        |
| `!=`     | Not equal                | `$x != $y`  | Returns `true` if `$x` is not equal to `$y`                                   |
| `<>`     | Not equal                | `$x <> $y`  | Returns `true` if `$x` is not equal to `$y`                                   |
| `!==`    | Not identical            | `$x !== $y` | Returns `true` if `$x` is not equal to `$y`, or they are not of the same type |
| `>`      | Greater than             | `$x > $y`   | Returns `true` if `$x` is greater than `$y`                                   |
| `<`      | Less than                | `$x < $y`   | Returns `true` if `$x` is less than `$y`                                      |
| `>=`     | Greater than or equal to | `$x >= $y`  | Returns `true` if `$x` is greater than or equal to `$y`                       |
| `<=`     | Lesser than or equal to  | `$x <= $y`  | Returns `true` if `$x` is less than or equal to `$y`                          |

#### PHP Increment / Decrement Operators

-   The PHP increment operators are used to increment a variable's value by one.
-   The PHP decrement operators are used to decrement a variable's value by one.

| Operator | Name           | Description                               |
| -------- | -------------- | ----------------------------------------- |
| `++$x`   | Pre-increment  | Increments `$x` by one, then returns `$x` |
| `$x++`   | Post-increment | Returns `$x`, then increments `$x` by one |
| `--$x`   | Pre-decrement  | Decrements `$x` by one, then returns `$x` |
| `$x--`   | Post-decrement | Returns `$x`, then decrements `$x` by one |

#### PHP Logical Operators

-   The PHP logical operators are used to combine conditional statements.

```nim
| Operator | Name | Example     | Result                                        |
| -------- | ---- | ----------- | --------------------------------------------- |
| and      | And  | $x and $y   | true if both $x and $y are true               |
| or       | Or   | $x or $y    | true if either $x or $y is true               |
| xor      | XOR  | $x xor $y   | true if either $x or $y is true, but not both |
| &&       | And  | $x && $y    | true if both $x and $y are true               |
| ||       | Or   | $x || $y    | true if either $x or $y is true               |
| !        | Not  | !$x         | true if $x is not true                        |
```

#### PHP String Operators

-   PHP has two operators that are specially designed for strings.

| Operator | Name                     | Example          | Result                               |
| -------- | ------------------------ | ---------------- | ------------------------------------ |
| `.`      | Concatenation            | `$txt1 . $txt2`  | Concatenation of `$txt1` and `$txt2` |
| `.=`     | Concatenation assignment | `$txt1 .= $txt2` | Appends `$txt2` to `$txt1`           |

#### PHP Array Operators

| Operator | Name         | Example     | Result                                                                                                |
| -------- | ------------ | ----------- | ----------------------------------------------------------------------------------------------------- |
| `+`      | Union        | `$x + $y`   | Union of `$x` and `$y`                                                                                |
| `==`     | Equality     | `$x == $y`  | Returns `true` if `$x` and `$y` have the same key/value pairs                                         |
| `===`    | Identity     | `$x === $y` | Returns `true` if `$x` and `$y` have the same key/value pairs in the same order and of the same types |
| `!=`     | Inequality   | `$x != $y`  | Returns `true` if `$x` is not equal to `$y`                                                           |
| `<>`     | Inequality   | `$x <> $y`  | Returns `true` if `$x` is not equal to `$y`                                                           |
| `!==`    | Non-identity | `$x !== $y` | Returns `true` if `$x` is not identical to `$y`                                                       |

<hr>

### PHP Conditional Statements

-   Very often when you write code, you want to perform different actions for
    different conditions.
-   You can use conditional statements in your code to do this.

#### In PHP we have the following conditional statements:

-   `if` statement - executes some code if one condition is true
-   `if...else` statement - executes some code if a condition is true and another code
    if that condition is false
-   `if...elseif....else` statement - executes different codes for more than two conditions
-   `switch` statement - selects one of many blocks of code to be executed

#### The if Statement

-   The if statement executes some code if one condition is true.

##### Syntax

```php
if (condition) {
    // code to be executed if condition is true;
}
```

-   The example below will output "Have a good day!" if the current time (HOUR) is
    less than 20.

##### Example

```php
<?php
    $t = date("H");
    if ($t < "20") {
        echo "Have a good day!";
    }
?>
```

##### Output

```
Have a good day!
```

#### The if...else Statement

-   The if....else statement executes some code if a condition is true and another code
    if that condition is false.

##### Syntax

```php
if (condition) {
    // code to be executed if condition is true;
} else {
    // code to be executed if condition is false;
}
```

-   The example below will output "Have a good day!" if the current time is less than 20,
    and "Have a good night!" otherwise.

##### Example

```php
<?php
    $t = date("H");
    if ($t < "20") {
        echo "Have a good day!";
    } else {
        echo "Have a good night!";
    }
?>
```

##### Output

```
Have a good day!
```

#### The if... elseif ....else Statement

-   The if.... elseif... else statement executes different codes for more than two conditions.

##### Syntax

```php
if (condition) {
    // code to be executed if this condition is true;
} else if (condition) {
    // code to be executed if this condition is true;
} else {
    // code to be executed if all conditions are false;
}
```

-   The example below will output "Have a good morning!" if the current time is less than
    10, and "Have a good day!" if the current time is less than 20.
-   Otherwise it will output "Have a good night!".

##### Example

```php
<?php
    $t = date("H");
    echo "<p>The hour (of the server) is " . $t;
    echo ", and will give the following message:</p>";
    if ($t < "10") {
        echo "Have a good morning!";
    }   elseif ($t < "20") {
        echo "Have a good day!";
    }  else {
        echo "Have a good night!";
    }
?>
```

##### Output

```
The hour (of the server) is 01, and will give the following message:
Have a good morning!
```

#### The switch Statement

-   The switch statement is used to perform different actions based on
    different conditions.

-   Use the switch statement to select one of many blocks of code to be executed.

##### Syntax

```php
switch (n) {
    case label1:
        // code to be executed if n=label1;
        break;
    case label2:
        // code to be executed if n=label2;
        break;
    case label3:
        // code to be executed if n=label3;
        break;
    ...
    default:
        // code to be executed if n is different from all labels;
}
```

##### This is how it works:

-   First we have a single expression n (most often a variable), that is
    evaluated once.
-   The value of the expression is then compared with the values for each
    case in the structure.
-   If there is a match, the block of code associated with that case is
    executed.
-   Use break to prevent the code from running into the next case automatically.
-   The default statement is used if no match is found.Example

```php
<?php
    $favcolor = "red";
    switch ($favcolor) {
        case "red":
            echo "Your favorite color is red!";
            break;
        case "blue":
            echo "Your favorite color is blue!";
            break;
        case "green":
            echo "Your favorite color is green!";
            break;
        default:
            echo "Your favorite color is neither red, blue, nor green!";
    }
?>
```

##### Output

```
Your favorite color is red!
```

#### PHP Loops

-   Often when you write code, you want the same block of code to run over and over again
    in a row.
-   Instead of adding several almost equal code-lines in a script, we can use loops
    to perform a task like this.
-   In PHP, we have the following looping statements:
    -   `while` - loops through a block of code as long as the specified condition is true
    -   `do...while` - loops through a block of code once, and then repeats the loop as
        long as the specified condition is true
    -   `for` - loops through a block of code a specified number of times
    -   `foreach` - loops through a block of code for each element in an array

#### The PHP while Loop

The while loop executes a block of code as long as the specified condition is
true.

##### Syntax

```php
while (condition is true) {
    // code to be executed;
}
```

- The example below first sets a variable `$x` to 1 (`$x = 1`). 
- Then, the while loop will continue to run as long as `$x` is less than, or equal to `5` (`$x <= 5`). 
- `$x` will increase by 1 each time the loop runs (`$x++`).

##### Example

```php
<?php
    $x = 1;
    while($x <= 5) {
        echo "The number is: $x<br>";
        $x++;
    }
?>
```

##### Output

```
The number is: 1
The number is: 2
The number is: 3
The number is: 4
The number is: 5
```

#### The PHP do...while Loop

-   The do...while loop will always execute the block of code once, it will then check the
    condition, and repeat the loop while the specified condition is true.

##### Syntax

```php
do {
    // code to be executed;
} while (condition is true);
```

-   The example below first sets a variable `$x` to `1` (`$x = 1`).
-   Then, the do while loop will write some output, and then increment the variable `$x` with 1.
-   Then the condition is checked (is `$x` less than, or equal to 5?),
    and the loop will continue to run as long as `$x` is less than,
    or equal to 5:

##### Example

```php
<?php
    $x = 1;
    do {
        echo "The number is: $x <br>";
        $x++;
    } while ($x <= 5);
?>
```

##### Output

```
The number is: 1
The number is: 2
The number is: 3
The number is: 4
The number is: 5
```

-   Notice that in a do while loop the condition is tested AFTER executing the statements
    within the loop.
-   This means that the do while loop would execute its statements at least
    once, even if the condition is false the first time.
-   The example below sets the `$x` variable to `6`, then it runs the loop, and then the
    condition is checked.

##### Example

```php
<?php
    $x = 6;
    do {
        echo "The number is: $x <br>";
        $x++;
    } while ($x <= 5);
?>
```

##### Output

```
The number is: 6
```

#### for Loops

-   PHP for loops execute a block of code a specified number of times.

#### The PHP for Loop

-   The for loop is used when you know in advance how many times the script
    should run.

##### Syntax

```php
    for (init counter; test counter; increment counter) {
        // code to be executed;
    }
```

##### Parameters

-   `init counter`: Initialize the loop counter value
-   `test counter`: Evaluated for each loop iteration. If it evaluates to TRUE, the
    loop continues. If it evaluates to FALSE, the loop ends.
-   `increment counter`: Increases the loop counter value

-   The example below displays the numbers from 0 to 10:

##### Example

```php
<?php
    for ($x = 0; $x <= 10; $x++) {
        echo "The number is: $x <br>";
    }
?>
```

##### Output

```
The number is: 0
The number is: 1
The number is: 2
The number is: 3
The number is: 4
The number is: 5
The number is: 6
The number is: 7
The number is: 8
The number is: 9
The number is: 10
```

#### The PHP foreach Loop

-   The foreach loop works only on arrays, and is used to loop through each
    key/value pair in an array.

##### Syntax

```php
foreach ($array as $value)
{
    // code to be executed;
}
```

-   For every loop iteration, the value of the current array element is assigned to
    `$value` and the array pointer is moved by one, until it reaches the last array
    element.
-   The following example demonstrates a loop that will output the values of the
    given array (`$colors`):

##### Example

```php
<?php
    $colors = array("red", "green", "blue", "yellow");
    foreach ($colors as $value) {
        echo "$value <br>";
    }
?>
```

##### Output

```
red
green
blue
yellow
```
