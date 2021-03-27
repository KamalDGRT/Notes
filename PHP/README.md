# PHP Notes

-   #### 1. Introduction to PHP & Features
-   #### 2. PHP Scripts
-   #### 3. Data Types
-   #### 4. Variables
-   #### 5. Operators
-   #### 6. Control Structures
-   #### 7. Working with Arrays
-   #### 8. Functions
-   #### 9. Working with Files
-   #### 10. Working with Databases

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
