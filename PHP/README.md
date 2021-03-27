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

```
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
Create an Array in PHP
```

-   In PHP, there are three types of arrays:
    -   **Indexed arrays** - Arrays with a numeric index
    -   **Associative arrays** - Arrays with named keys
    -   **Multidimensional arrays** - Arrays containing one or more arrays

<hr>
