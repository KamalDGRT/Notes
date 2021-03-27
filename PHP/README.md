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
<html>
    <body>
        <?php
            echo "Hellow World!";
        ?>
    </body>
</html>
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

###### Output

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
<html>
    <body>
    <?php
        $x = "Hello world!";
        $y = 'Hello world!';
        echo $x;
        echo "<br>";
        echo $y;
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        echo strlen("Hello world!"); ?>
    </body>
</html>
```

###### Output

```
12
```

#### Count The Number of Words in a String

-   The PHP str_word_count() function counts the number of words in a string.

##### Example

```php
<html>
    <body>
    <?php
        echo str_word_count("Hello world!");
    ?>
    </body>
</html>
```

###### Output

```
2
```

#### Reverse a String

-   The PHP strrev() function reverses a string.

##### Example

```php
<html>
    <body>
    <?php
        echo strrev("Hello world!");
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        echo strpos("Hello world!", "world");
    ?>
    </body>
</html>
```

###### Output

```
6
```

#### Replace Text Within a String

-   The PHP str_replace() function replaces some characters with some other characters in a string.
-   The example below replaces the text "world" with "Dolly".

##### Example

```php
<html>
    <body>
    <?php
        echo str_replace("world", "Dolly", "Hello world!");
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        $x = 5985;
        var_dump($x);
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        $x = 10.365;
        var_dump($x);
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        $cars = array("Volvo", "BMW", "Toyota");
        echo "I like " . $cars[0] . ", " . $cars[1] . " and " . $cars[2] . ".";
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
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
    </body>
</html>
```

-   After the execution of the statements above
    -   the variable `$txt` will hold the value `Hello world!`
    -   the variable `$x` will hold the value `5`
    -   the variable `$y` will hold the value `10.5`

###### Output

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
<html>
    <body>
    <?php
        $txt = "Hogwarts";
        echo "I love $txt!";
    ?>
</body>
</html>
```

###### Output

```
I love Hogwarts!
```

##### Example

```php
<html>
    <body>
    <?php
        $txt = "Hogwarts";
        echo "I love " . $txt . "!";
    ?>
</body>
</html>
```

###### Output

```
I love Hogwarts!
```

##### Example

```php
<html>
    <body>
    <?php
        $x = 5;
        $y = 4;
        echo $x + $y;
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        $x = 5; // global scope
        function myTest() {
            // using x inside this function will generate an error
            echo "Variable x inside function is: $x";
        }
        myTest();
        echo "Variable x outside function is: $x"; ?>
    </body>
</html>
```

###### Output

```
Variable x inside function is:
Variable x outside function is: 5
```

-   A variable declared within a function has a LOCAL SCOPE and can only be accessed within that function.

##### Example

```php
<html>
    <body>
    <?php
        function myTest() {
            $x = 5; // local scope
            echo "Variable x inside function is: $x";
        }
        myTest();
        // using x outside the function will generate an error
        echo "Variable x outside function is: $x";
    ?>
    </body>
</html>
```

###### Output

```
Variable x inside function is: 5
Variable x outside function is:
```

#### The global Keyword

-   The global keyword is used to access a global variable from within a function.
-   To do this, use the global keyword before the variables (inside the function).

##### Example

```php
<html>
    <body>
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
    </body>
</html>
```

###### Output

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
<html>
    <body>
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
    </body>
</html>
```

###### Output

```
0
1
2
```

#### `echo` and `print` Statements

-   In PHP there are two basic ways to get output: `echo` and `print`.
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
<html>
    <body>
    <?php
        echo "PHP is Fun!<br>";
        echo "Hello world!<br>";
        echo "I'm about to learn PHP!<br>";
        echo "This ", "string ", "was ", "made ", "with multiple parameters.";
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        $txt1 = "Learn PHP";
        $txt2 = "Hogwarts";
        $x = 5;
        $y = 4;
        echo "<h2>" . $txt1 . "</h2>";
        echo "Study PHP at " . $txt2 . "<br>";
        echo $x + $y;
    ?>
</body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        print "<h2>PHP is Fun!</h2>";
        print "Hello world!<br>";
        print "I'm about to learn PHP!";
    ?>
    </body>
</html>
```

###### Output

```
PHP is Fun!
Hello world!
I'm about to learn PHP!
```

##### Display Variables

-   The following example shows how to output text and variables with the `print` statement.

##### Example

```php
<html>
    <body>
    <?php
        $txt1 = "Learn PHP";
        $txt2= "Hogwarts";
        $x = 5;
        $y = 4;
        print "<h2>" . $txt1 . "</h2>";
        print "Study PHP at " . $txt2 . "<br>";
        print $x + $y;
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
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
</body>
</html>
```

###### Output

```
VW
```

#### PHP NULL Value

-   Null is a special data type which can have only one value: NULL.
-   A variable of data type NULL is a variable that has no value assigned to it.
-   If a variable is created without a value, it is automatically assigned a value of NULL.
-   Variables can also be emptied by setting the value to NULL.

##### Example

```php
<html>
    <body>
    <?php
        $x = "Hello world!";
        $x = null;
        var_dump($x);
    ?>
    </body>
</html>
```

###### Output

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
<html>
    <body>
    <?php
        // case-sensitive constant name
        define("GREETING", "Welcome to Hogwarts!");
        echo GREETING;
    ?>
    </body>
</html>
```

###### Output

```
Welcome to Hogwarts!
```

-   The example below creates a constant with a case-insensitive name:

##### Example

```php
<html>
    <body>
    <?php
        // case-insensitive constant name
        define("GREETING", "Welcome to Hogwarts!", true);
        echo greeting;
    ?>
    </body>
</html>
```

###### Output

```
Welcome to Hogwarts!
```

#### Constants are Global

-   Constants are automatically global and can be used across the entire script.
-   The example below uses a constant inside a function, even if it is defined outside the function.

##### Example

```php
<html>
    <body>
    <?php
        define("GREETING", "Welcome to Hogwarts!");
        function myTest() {
            echo GREETING;
        }
        myTest();
    ?>
</body>
</html>
```

###### Output

```
Welcome to Hogwarts!
```

<hr>
