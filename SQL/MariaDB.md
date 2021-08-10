# MariaDB Reference Notes (MySql)

## About MySql

MySQL is a Swedish company. The name of the parent company that created this DB is MySQL AB. The first version of the software was launched in May 1995. Currently, MySQL is managed by Oracle.

## About MariaDB

MariaDB is forked out of MySQL. So, there are lot of similarities between these two databases.

---

## Common Data Types

| Data Type        | Description                                                                                                                                                                                                                                                                                                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| char (Character) | Fixed width string value. Values of this type is enclosed in single quotes. For ex. Anu’s will be written as ‘Anu’ ‘s’.                                                                                                                                                                                                                                                            |
| varchar          | Variable width character string. This is similar to char except the size of the data entry vary considerably.                                                                                                                                                                                                                                                                      |
| dec (Decimal)    | It represents a fractional number such as 15.12, 0.123 etc. Here the size argument consist of two parts : precision and scale. The precision indicates how many digits the number may have and the scale indicates the maximum number of digits to the right of the decimal point. The size (5, 2) indicates precision as 5 and scale as 2. The scale cannot exceed the precision. |
| numeric          | It is same as decimal except that the maximum number of digits may not exceed the precision argument.                                                                                                                                                                                                                                                                              |
| int (Integer)    | It represents a number without a decimal point. Here the size argument is not used.                                                                                                                                                                                                                                                                                                |
| smallint         | It is same as integer but the default size may be smaller than Integer.                                                                                                                                                                                                                                                                                                            |
| float            | It represents a floating point number in base 10 exponential notation and may define a precision up to a maximum of 64.                                                                                                                                                                                                                                                            |
| real             | It is same as float, except the size argument is not used and may define a precision up to a maximum of 64.                                                                                                                                                                                                                                                                        |
| double           | Same as real except the precision may exceed 64.                                                                                                                                                                                                                                                                                                                                   |
| DATE             | It is used to specify date format YYYY-MM-DD. Its supported range is from '1000-01-01' to '9999-12-31'.                                                                                                                                                                                                                                                                            |

---

## About SQL Commands

**Five types of SQL queries:**

1. Data Definition Language (DDL)
2. Data Manipulation Language (DML)
3. Data Control Language(DCL)
4. Transaction Control Language(TCL)
5. Data Query Language (DQL)

**DDL commands:**
`CREATE`, `DROP`, `ALTER`, `TRUNCATE`, `RENAME`

**DQL command:**
`SELECT`

**DML commands:**
`INSERT`, `UPDATE`, `DELETE`

**DCL commands:**
`GRANT`, `REVOKE`

**TCL commands:**
`COMMIT`, `ROLLBACK`, `SAVEPOINT`, `SET TRANSACTION`

---

## Basic SQL Commands

#### CREATE

`CREATE` is as keyword to create database and table

```sql
MariaDB [(none)]> CREATE DATABASE dbms_sample;
Query OK, 1 row affected (0.024 sec)
```

Here, the `dbms_sample` is a user-defined name (Any name can be given but database name with lower case is recommended)

#### SHOW DATABASES

`SHOW DATABASES` is a query to list all databases in the server

```sql
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| dbms_sample        |
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
6 rows in set (0.062 sec)
```

#### USE

`USE` is a keyword to use a specified database.

```sql
MariaDB [(none)]> USE dbms_sample;
Database changed
MariaDB [dbms_sample]>
```

#### CREATE TABLE

`CREATE TABLE` is a keyword to create table(s) inside the database

```sql
MariaDB [dbms_sample]> CREATE TABLE sample (number int, name char(25));
Query OK, 0 rows affected (0.297 sec)
```

Here, the `dbms_sample`, `number`, `name` is a user-defined name (Any name can be given to table name and column name but it is recommended to name with lower case)

#### SHOW TABLES

`SHOW TABLES` is a query to list all tables in the database

```sql
MariaDB [dbms_sample]> SHOW tables;
+-----------------------+
| Tables_in_dbms_sample |
+-----------------------+
| sample                |
+-----------------------+
1 row in set (0.001 sec)
```

#### DESC

`DESC` is a keyword to describe the table. Alternatively, we can use `DESCRIBE` and `EXPLAIN`.

```language
MariaDB [dbms_sample]> DESC sample;
+--------+----------+------+-----+---------+-------+
| Field  | Type     | Null | Key | Default | Extra |
+--------+----------+------+-----+---------+-------+
| number | int(11)  | YES  |     | NULL    |       |
| name   | char(25) | YES  |     | NULL    |       |
+--------+----------+------+-----+---------+-------+
2 rows in set (0.002 sec)

```

#### INSERT

`INSERT` is a keyword to add data into the table.

```sql
MariaDB [dbms_sample]> INSERT INTO sample values(1, "Manoj");
Query OK, 1 row affected (0.057 sec)
```

Inserting data to particular column only

```sql
MariaDB [dbms_sample]> INSERT INTO sample (name) values ("Paramsetti");
Query OK, 1 row affected (0.058 sec)
```

#### SELECT

`SELECT` is a keyword to show table(s)

```sql
MariaDB [dbms_sample]> SELECT * FROM sample;
+--------+------------+
| number | name       |
+--------+------------+
|      1 | Manoj      |
|   NULL | Paramsetti |
+--------+------------+
2 rows in set (0.014 sec)
```

#### UPDATE

`UPDATE` is a keyword to update a value in table

```sql
MariaDB [dbms_sample]> UPDATE sample SET number=2 WHERE name="Paramsetti";
Query OK, 1 row affected (0.094 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbms_sample]> SELECT * FROM sample;
+--------+------------+
| number | name       |
+--------+------------+
|      1 | Manoj      |
|      2 | Paramsetti |
+--------+------------+
2 rows in set (0.001 sec)
```

If `WHERE` is not specified then all the tuples will be updated

#### DELETE

`DELETE` is a keyword to remove tuples.

```sql
MariaDB [dbms_sample]> DELETE FROM sample WHERE number=2;
Query OK, 1 row affected (0.054 sec)

MariaDB [dbms_sample]> SELECT * FROM sample;
+--------+-------+
| number | name  |
+--------+-------+
|      1 | Manoj |
+--------+-------+
1 row in set (0.001 sec)
```

If `WHERE` is not mentioned then all the data in the table will be deleted

#### ALTER

`ALTER` is a keyword to modify the structure of the table.<br>
In alter we can do with 4 things

-   `ADD COLUMN`
-   `MODIFY`
-   `RENAME COLUMN`
-   `DROP COLUMN`
-   `RENAME` | (Table Name)

##### ALTER (ADD COLUMN)

```sql
MariaDB [dbms_sample]> ALTER TABLE sample ADD department varchar(5);
Query OK, 0 rows affected (0.094 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbms_sample]> EXPLAIN sample;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| number     | int(11)     | YES  |     | NULL    |       |
| name       | varchar(25) | YES  |     | NULL    |       |
| department | varchar(5)  | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.002 sec)
```

##### ALTER (MODIFY)

```sql
MariaDB [dbms_sample]> ALTER TABLE sample MODIFY department varchar(40);
Query OK, 0 rows affected (0.122 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbms_sample]> DESCRIBE sample;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| number     | int(11)     | YES  |     | NULL    |       |
| name       | varchar(25) | YES  |     | NULL    |       |
| department | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.002 sec)
```

##### ALTER (RENAME)

```sql
MariaDB [dbms_sample]> ALTER TABLE sample RENAME COLUMN department TO class;
Query OK, 0 rows affected (0.171 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbms_sample]> DESC sample;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| number | int(11)     | YES  |     | NULL    |       |
| name   | varchar(25) | YES  |     | NULL    |       |
| class  | varchar(40) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.138 sec)
```

##### ALTER (RENAME TABLE NAME)

```sql
MariaDB [dbms_sample]> ALTER TABLE sample RENAME TO class;
Query OK, 0 rows affected (0.200 sec)

MariaDB [dbms_sample]> SHOW tables;
+-----------------------+
| Tables_in_dbms_sample |
+-----------------------+
| class                 |
+-----------------------+
1 row in set (0.231 sec)
```

##### ALTER (DROP COLUMN)

```sql
MariaDB [dbms_sample]> ALTER TABLE sample DROP COLUMN class;
Query OK, 0 rows affected (0.110 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbms_sample]> DESC sample;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| number | int(11)     | YES  |     | NULL    |       |
| name   | varchar(25) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.002 sec)
```

#### TRUNCATE

`TRUNCATE` will delete all the data but it will not modify the structure of the table

```sql
MariaDB [dbms_sample]> TRUNCATE class;
Query OK, 0 rows affected (0.703 sec)

MariaDB [dbms_sample]> SELECT * FROM class;
Empty set (0.116 sec)
```

#### DROP TABLE

`DROP TABLE` will delete all the data including the structure of the table.
<br>It is not recommended to use `DROP TABLE` every time, `TRUNCATE` first and then use `DROP TABLE`

```sql
MariaDB [dbms_sample]> DROP TABLE class;
Query OK, 0 rows affected (0.093 sec)

MariaDB [dbms_sample]> SHOW TABLES;
Empty set (0.001 sec)
```

### Comments

Comment part will be ignored in the SQL queries. we can use this to
describe the commands.

##### In SQL it has two types of comments

1. Single line comments
2. Multi line comments

#### Single Line Comments

Single line comments will ignore the complete one line. We have
to add `--` in the start to represent it is a comment. If the comment
is added at the end of the query, then the query will
ignore only the comment part and not the query

```sql
MariaDB [dbms_sample]> --create table with name as char with the length of 25 and register number with the integer type
MariaDB [dbms_sample]> CREATE TABLE student (name char(25), registerName int);
Query OK, 0 rows affected (0.714 sec)
```

Here the SQL ignored the first line completely.

#### Multi Line Comment

Multi line comment will ignore some part of lines with
`/*COMMENT*/` as syntax. we can ignore only some part of text in one line which will not
consider the full line as comment

```sql
MariaDB [dbms_sample]> DESC student /*describing the table*/;
+--------------+----------+------+-----+---------+-------+
| Field        | Type     | Null | Key | Default | Extra |
+--------------+----------+------+-----+---------+-------+
| name         | char(25) | YES  |     | NULL    |       |
| registerName | int(11)  | YES  |     | NULL    |       |
+--------------+----------+------+-----+---------+-------+
2 rows in set (0.110 sec)
```

Here `/*describing the table*/` part is ignored

```sql
MariaDB [dbms_sample]> /* Insert 2 students data inside the student table
   /*> Name: Manoj, Reg No: 40110901
   /*> Name: Paramsetti, Reg No: 40110902
   /*> */
MariaDB [dbms_sample]> INSERT INTO student values ("Manoj", 40110901);
Query OK, 1 row affected (0.144 sec)

MariaDB [dbms_sample]> INSERT INTO student values ("Paramsetti", 40110902);
Query OK, 1 row affected (0.340 sec)
```

Here the below lines are comments

```sql
/* Insert 2 students data inside the student table
   /*> Name: Manoj, Reg No: 40110901
   /*> Name: Paramsetti, Reg No: 40110902
   /*> */
```

---

## Keys & Constraints

Constraint will allow data with some condition

#### There are two ways of constraining:

> 1.  Column constraint: **Column constraint** will constraints only to column at a time

> 2.  Table constraint: **Table constraint** will declare the
>     constraints the two or more column at same time

#### Types of constraints:

-   `UNIQUE`
-   `PRIMARY KEY`
-   `DEFAULT`
-   `CHECK`
-   `NOT NULL`
-   `FOREIGN KEY`
-   `ALTERNATE KEY`
-   `COMPOSITE KEY` | (Table constraint)

#### NOT NULL

`NOT NULL` will not allow empty data in the specified column

```sql
MariaDB [dbms_sample]> CREATE TABLE student (registerNo int(8) NOT NULL, name char(30));
Query OK, 0 rows affected (0.197 sec)


MariaDB [dbms_sample]> INSERT INTO student (registerNo, name) VALUES (40110901, "Manoj");
Query OK, 1 row affected (0.353 sec)

MariaDB [dbms_sample]> INSERT INTO student (name) VALUES ("Manoj");
ERROR 1364 (HY000): Field 'registerNo' doesn't have a default value
```

Here, In third line we haven't passed registerNo data. So, the tuple is not inserted into the table

#### UNIQUE

`UNIQUE` Constraint will allow duplication in the specified column and shows warning

```sql
MariaDB [dbms_sample]> CREATE TABLE student1 (name char(25), registerNumber int UNIQUE);
Query OK, 0 rows affected (0.749 sec)

MariaDB [dbms_sample]> INSERT INTO student1 values ("Paramsetti", 40110901);
Query OK, 1 row affected (0.173 sec)

MariaDB [dbms_sample]> INSERT INTO student1 values ("Manoj", 40110901);
ERROR 1062 (23000): Duplicate entry '40110901' for key 'registerNumber'
```

#### ALTERNATE KEY

Alternate key is method to have one or more columns has unique to represent one tuple.
but all the unique key aren't `PRIMARY KEY`. `PRIMARY KEY` is strictly allocated to only one column

#### PRIMARY KEY

`PRIMARY KEY` Constraint will not allow duplication in the specified column. Primary key is allowed to only one column

```sql
MariaDB [dbms_sample]> CREATE TABLE student2 (name char(25), registerNumber int NOT NULL PRIMARY KEY);
Query OK, 0 rows affected (0.234 sec)

MariaDB [dbms_sample]> INSERT INTO student2 values ("Manoj", 40110901);
Query OK, 1 row affected (0.053 sec)

MariaDB [dbms_sample]> INSERT INTO student2 values ("Paramsetti", 40110902);
Query OK, 1 row affected (0.044 sec)

MariaDB [dbms_sample]> INSERT INTO student2 values ("Param", 40110902);
ERROR 1062 (23000): Duplicate entry '40110902' for key 'PRIMARY'

MariaDB [dbms_sample]> INSERT INTO student2 values ("Param");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
```

#### DEFAULT

`DEFAULT` is a keyword to add default value for a column. If the value is not specified, it will take the default value.

```sql
MariaDB [dbms_sample]> CREATE TABLE college (collegeName char(25) DEFAULT "Sathyabama", registerNumber int(10));
Query OK, 0 rows affected (0.375 sec)

MariaDB [dbms_sample]> DESC college;
+----------------+----------+------+-----+------------+-------+
| Field          | Type     | Null | Key | Default    | Extra |
+----------------+----------+------+-----+------------+-------+
| collegeName    | char(25) | YES  |     | Sathyabama |       |
| registerNumber | int(10)  | YES  |     | NULL       |       |
+----------------+----------+------+-----+------------+-------+
2 rows in set (0.051 sec)

MariaDB [dbms_sample]> INSERT INTO college (registerNumber) VALUES (40110901);
Query OK, 1 row affected (0.130 sec)

MariaDB [dbms_sample]> SELECT * FROM college;
+-------------+----------------+
| collegeName | registerNumber |
+-------------+----------------+
| Sathyabama  |       40110901 |
+-------------+----------------+
1 row in set (0.062 sec)
```

#### CHECK

`CHECK` is a keyword to allow only the specified data for a particular column

```sql
MariaDB [dbms_sample]> CREATE TABLE batch24 (registerNumber int, age int(2) CHECK (age = 19));
Query OK, 0 rows affected (0.315 sec)

MariaDB [dbms_sample]> INSERT INTO batch24 VALUES (40110901, 19);
Query OK, 1 row affected (0.066 sec)

MariaDB [dbms_sample]> INSERT INTO batch24 VALUES (40110901, 18);
ERROR 4025 (23000): CONSTRAINT `batch24.age` failed for `dbms_sample`.`batch24`
```

#### FOREIGN KEY

`FOREIGN KEY` is used to take only the primary key values presented in mentioned column. This values can be duplicated but it should contain the data in the derived table

```sql
MariaDB [dbms_sample]> desc student2;
+----------------+----------+------+-----+---------+-------+
| Field          | Type     | Null | Key | Default | Extra |
+----------------+----------+------+-----+---------+-------+
| name           | char(25) | YES  |     | NULL    |       |
| registerNumber | int(11)  | NO   | PRI | NULL    |       |
+----------------+----------+------+-----+---------+-------+
2 rows in set (0.002 sec)

MariaDB [dbms_sample]> CREATE TABLE student4 (registerNo int, FOREIGN KEY (registerNo) REFERENCES student2(registerNumber));
Query OK, 0 rows affected (0.215 sec)

MariaDB [dbms_sample]> select * from student2;
+------------+----------------+
| name       | registerNumber |
+------------+----------------+
| Manoj      |       40110901 |
| Paramsetti |       40110902 |
+------------+----------------+
2 rows in set (0.001 sec)

MariaDB [dbms_sample]> INSERT INTO student4 VALUES (40110901);
Query OK, 1 row affected (0.042 sec)

MariaDB [dbms_sample]> select * from student4;
+------------+
| registerNo |
+------------+
|   40110901 |
+------------+
1 row in set (0.001 sec)

MariaDB [dbms_sample]> INSERT INTO student4 VALUES (40110903);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`dbms_sample`.`student4`, CONSTRAINT `student4_ibfk_1` FOREIGN KEY (`registerNo`) REFERENCES `student2` (`registerNumber`))

```

#### COMPOSITE KEY

`COMPOSITE KEY` is a method to assign constraints for the columns. It is mentioned at the last while creating a new table. where either two or more column should have different data from previous tuples. In the below queries, registerNo and mobileNo column combines and makes a UNIQUE key. We can also use `PRIMARY KEY` in this columns because two or more columns are treated as one `PRIMARY KEY` column
`Eg: registerNo-mobileNo (40110901-1212101920)`

```sql
MariaDB [dbms_sample]> CREATE TABLE student3 (registerNo int, mobileNo int(10), name char(50), UNIQUE (registerNo, mobileNo));
Query OK, 0 rows affected (0.319 sec)

MariaDB [dbms_sample]> INSERT INTO student3 VALUES (40110901, 1212101920, "Manoj");
Query OK, 1 row affected (0.029 sec)

MariaDB [dbms_sample]> INSERT INTO student3 VALUES (40110902, 1212101920, "Paramsetti");
Query OK, 1 row affected (0.022 sec)

MariaDB [dbms_sample]> INSERT INTO student3 VALUES (40110901, 1212101920, "Jonam");
ERROR 1062 (23000): Duplicate entry '40110901-1212101920' for key 'registerNo'
```

---

## Clauses

#### WHERE

`WHERE` is a keyword to apply condition on query

```sql
MariaDB [dbms_sample]> SELECT * FROM student3;
+------------+------------+------------+
| registerNo | mobileNo   | name       |
+------------+------------+------------+
|   40110901 | 1212101920 | Manoj      |
|   40110902 | 1212101920 | Paramsetti |
+------------+------------+------------+
2 rows in set (0.124 sec)

MariaDB [dbms_sample]> SELECT * FROM student3 WHERE registerNo=40110901;
+------------+------------+-------+
| registerNo | mobileNo   | name  |
+------------+------------+-------+
|   40110901 | 1212101920 | Manoj |
+------------+------------+-------+
1 row in set (0.061 sec)
```

#### AND

`AND` is a keyword used to check between two condition. It will be true, when two condition satisfies

```sql
MariaDB [dbms_sample]> SELECT * FROM student3;
+------------+------------+------------+
| registerNo | mobileNo   | name       |
+------------+------------+------------+
|   40110901 | 1212101920 | Manoj      |
|   40110902 | 1212101920 | Paramsetti |
+------------+------------+------------+
2 rows in set (0.124 sec)

MariaDB [dbms_sample]> SELECT * FROM student3 WHERE registerNo=40110901 AND mobileNo=1212101920;
+------------+------------+-------+
| registerNo | mobileNo   | name  |
+------------+------------+-------+
|   40110901 | 1212101920 | Manoj |
+------------+------------+-------+
1 row in set (1.456 sec)
```

#### OR

`AND` is a keyword used to check between two condition. It will be true, when at least one condition is satisfied

```sql
MariaDB [dbms_sample]> SELECT * FROM student3;
+------------+------------+------------+
| registerNo | mobileNo   | name       |
+------------+------------+------------+
|   40110901 | 1212101920 | Manoj      |
|   40110902 | 1212101921 | Paramsetti |
+------------+------------+------------+
2 rows in set (0.124 sec)

MariaDB [dbms_sample]> SELECT * FROM student3 WHERE registerNo=40110901 OR mobileNo=1212101921;
+------------+------------+------------+
| registerNo | mobileNo   | name       |
+------------+------------+------------+
|   40110901 | 1212101920 | Manoj      |
|   40110902 | 1212101921 | Paramsetti |
+------------+------------+------------+
1 row in set (1.456 sec)
```

#### AS

`AS` is a keyword to give temporary name to column

```sql
MariaDB [dbms_sample]> select * from student;
+------------+------------+
| registerNo | name       |
+------------+------------+
|   40110901 | Manoj      |
|   44011090 | Manoj      |
|   40110902 | Prince     |
|   40110903 | Anwar Khan |
|   40110904 | Santhosh   |
+------------+------------+
5 rows in set (0.001 sec)

MariaDB [dbms_sample]> select registerNo as regno, name as StudentName from student;
+----------+-------------+
| regno    | StudentName |
+----------+-------------+
| 40110901 | Manoj       |
| 44011090 | Manoj       |
| 40110902 | Prince      |
| 40110903 | Anwar Khan  |
| 40110904 | Santhosh    |
+----------+-------------+
5 rows in set (0.001 sec)
```

#### Sub Query

```sql
MariaDB [dbms_sample]> SELECT * FROM student1;
+------------+----------------+
| name       | registerNumber |
+------------+----------------+
| Paramsetti |       40110901 |
+------------+----------------+
1 row in set (0.001 sec)

MariaDB [dbms_sample]> SELECT * FROM student2;
+------------+----------------+
| name       | registerNumber |
+------------+----------------+
| Manoj      |       40110901 |
| Paramsetti |       40110902 |
+------------+----------------+
2 rows in set (0.001 sec)

MariaDB [dbms_sample]> SELECT * FROM student1 WHERE registerNumber=(SELECT registerNumber FROM student2 WHERE registerNumber=40110901);
+------------+----------------+
| name       | registerNumber |
+------------+----------------+
| Paramsetti |       40110901 |
+------------+----------------+
1 row in set (0.043 sec)
```

---

## SQL JOIN

For this topic, I'm using two new table with more columns

**TABLE 1 | (Course1)**

```sql
+------------+-------------+--------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo |
+------------+-------------+--------------+---------+
|   40110901 | Manoj       | 2020-08-08   |       1 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |
|   40110903 | Shalom      | 2020-08-08   |       1 |
|   50110901 | Prince      | 2020-08-09   |       2 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |
|   70923032 | Moses       | 2020-08-11   |       5 |
+------------+-------------+--------------+---------+
```

**Table 2 | (course1_teachers)**

```sql
+----------+---------------+---------+
| staff_id | staff_name    | BatchNo |
+----------+---------------+---------+
|   401123 | Kamalesh      |       3 |
|   203211 | Ulagamuthalvi |       2 |
|   401125 | Jacob         |       1 |
|   320002 | James         |       4 |
+----------+---------------+---------+
```

**Graphical Representation for Join Types:**

<p align="center">
   <img src='https://letsdobigdata.files.wordpress.com/2016/03/joins.png?w=800'></img>
</p>

#### INNER JOIN

Inner join is a method to get the intersection between two data. In the below example, I'm trying to display the teacher assigned for each student

```sql
MariaDB [dbms_sample]> SELECT staff_id, staff_name, RegisterNo, C.BatchNo, StudentName FROM course1_teachers c, Course1 C WHERE c.BatchNo = C.BatchNo;
+----------+---------------+------------+---------+-------------+
| staff_id | staff_name    | RegisterNo | BatchNo | StudentName |
+----------+---------------+------------+---------+-------------+
|   401125 | Jacob         |   40110901 |       1 | Manoj       |
|   401125 | Jacob         |   40110902 |       1 | Paramsetti  |
|   401125 | Jacob         |   40110903 |       1 | Shalom      |
|   203211 | Ulagamuthalvi |   50110901 |       2 | Prince      |
|   203211 | Ulagamuthalvi |   50110902 |       2 | Santhosh    |
|   401123 | Kamalesh      |   60110902 |       3 | Anwar Khan  |
+----------+---------------+------------+---------+-------------+
6 rows in set (0.001 sec)
```

#### LEFT JOIN

`LEFT JOIN` is a keyword to show A difference B of the table

```sql
MariaDB [dbms_sample]> SELECT B.staff_id, B.staff_name, A.RegisterNo, A.BatchNo, A.StudentName FROM Course1 A LEFT JOIN course1_teachers B ON A.BatchNo = B.BatchNo;
+----------+---------------+------------+---------+-------------+
| staff_id | staff_name    | RegisterNo | BatchNo | StudentName |
+----------+---------------+------------+---------+-------------+
|   401123 | Kamalesh      |   60110902 |       3 | Anwar Khan  |
|   203211 | Ulagamuthalvi |   50110901 |       2 | Prince      |
|   203211 | Ulagamuthalvi |   50110902 |       2 | Santhosh    |
|   401125 | Jacob         |   40110901 |       1 | Manoj       |
|   401125 | Jacob         |   40110902 |       1 | Paramsetti  |
|   401125 | Jacob         |   40110903 |       1 | Shalom      |
|     NULL | NULL          |   70923032 |       5 | Moses       |
+----------+---------------+------------+---------+-------------+
7 rows in set (0.051 sec)
```

#### RIGHT JOIN

`RIGHT JOIN` is a keyword to show B difference A of the table

```sql
MariaDB [dbms_sample]> SELECT B.staff_id, B.staff_name, A.RegisterNo, B.BatchNo, A.StudentName FROM Course1 A RIGHT JOIN course1_teachers B ON A.BatchNo = B.BatchNo;
+----------+---------------+------------+---------+-------------+
| staff_id | staff_name    | RegisterNo | BatchNo | StudentName |
+----------+---------------+------------+---------+-------------+
|   401125 | Jacob         |   40110901 |       1 | Manoj       |
|   401125 | Jacob         |   40110902 |       1 | Paramsetti  |
|   401125 | Jacob         |   40110903 |       1 | Shalom      |
|   203211 | Ulagamuthalvi |   50110901 |       2 | Prince      |
|   203211 | Ulagamuthalvi |   50110902 |       2 | Santhosh    |
|   401123 | Kamalesh      |   60110902 |       3 | Anwar Khan  |
|   320002 | James         |       NULL |       4 | NULL        |
+----------+---------------+------------+---------+-------------+
7 rows in set (0.001 sec)
```

#### FULL JOIN

FULL JOIN is a method to combine two tables. In simple words `LEFT JOIN` table and `RIGHT JOIN` table are taken union (A U B)

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1 LEFT JOIN course1_teachers
    -> ON Course1.BatchNo = course1_teachers.BatchNo
    -> UNION
    -> SELECT * FROM Course1 RIGHT JOIN course1_teachers
    -> ON Course1.BatchNo = course1_teachers.BatchNo
    -> ;
+------------+-------------+--------------+---------+----------+---------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo | staff_id | staff_name    | BatchNo |
+------------+-------------+--------------+---------+----------+---------------+---------+
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   401123 | Kamalesh      |       3 |
|   50110901 | Prince      | 2020-08-09   |       2 |   203211 | Ulagamuthalvi |       2 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   203211 | Ulagamuthalvi |       2 |
|   40110901 | Manoj       | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   70923032 | Moses       | 2020-08-11   |       5 |     NULL | NULL          |    NULL |
|       NULL | NULL        | NULL         |    NULL |   320002 | James         |       4 |
+------------+-------------+--------------+---------+----------+---------------+---------+
8 rows in set (0.002 sec)
```

#### CROSS JOIN

`CROSS JOIN` is a keyword and method for Cartesian Product between two table. In simple words all row are mapped with another table's row

**With CROSS JOIN keyword**

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1 CROSS JOIN course1_teachers;
+------------+-------------+--------------+---------+----------+---------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo | staff_id | staff_name    | BatchNo |
+------------+-------------+--------------+---------+----------+---------------+---------+
|   40110901 | Manoj       | 2020-08-08   |       1 |   401123 | Kamalesh      |       3 |
|   40110901 | Manoj       | 2020-08-08   |       1 |   203211 | Ulagamuthalvi |       2 |
|   40110901 | Manoj       | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   40110901 | Manoj       | 2020-08-08   |       1 |   320002 | James         |       4 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   401123 | Kamalesh      |       3 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   203211 | Ulagamuthalvi |       2 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   320002 | James         |       4 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   401123 | Kamalesh      |       3 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   203211 | Ulagamuthalvi |       2 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   320002 | James         |       4 |
|   50110901 | Prince      | 2020-08-09   |       2 |   401123 | Kamalesh      |       3 |
|   50110901 | Prince      | 2020-08-09   |       2 |   203211 | Ulagamuthalvi |       2 |
|   50110901 | Prince      | 2020-08-09   |       2 |   401125 | Jacob         |       1 |
|   50110901 | Prince      | 2020-08-09   |       2 |   320002 | James         |       4 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   401123 | Kamalesh      |       3 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   203211 | Ulagamuthalvi |       2 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   401125 | Jacob         |       1 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   320002 | James         |       4 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   401123 | Kamalesh      |       3 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   203211 | Ulagamuthalvi |       2 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   401125 | Jacob         |       1 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   320002 | James         |       4 |
|   70923032 | Moses       | 2020-08-11   |       5 |   401123 | Kamalesh      |       3 |
|   70923032 | Moses       | 2020-08-11   |       5 |   203211 | Ulagamuthalvi |       2 |
|   70923032 | Moses       | 2020-08-11   |       5 |   401125 | Jacob         |       1 |
|   70923032 | Moses       | 2020-08-11   |       5 |   320002 | James         |       4 |
+------------+-------------+--------------+---------+----------+---------------+---------+
28 rows in set (0.001 sec)
```

**Without CROSS JOIN Keyword**

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1, course1_teachers;
+------------+-------------+--------------+---------+----------+---------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo | staff_id | staff_name    | BatchNo |
+------------+-------------+--------------+---------+----------+---------------+---------+
|   40110901 | Manoj       | 2020-08-08   |       1 |   401123 | Kamalesh      |       3 |
|   40110901 | Manoj       | 2020-08-08   |       1 |   203211 | Ulagamuthalvi |       2 |
|   40110901 | Manoj       | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   40110901 | Manoj       | 2020-08-08   |       1 |   320002 | James         |       4 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   401123 | Kamalesh      |       3 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   203211 | Ulagamuthalvi |       2 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |   320002 | James         |       4 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   401123 | Kamalesh      |       3 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   203211 | Ulagamuthalvi |       2 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   401125 | Jacob         |       1 |
|   40110903 | Shalom      | 2020-08-08   |       1 |   320002 | James         |       4 |
|   50110901 | Prince      | 2020-08-09   |       2 |   401123 | Kamalesh      |       3 |
|   50110901 | Prince      | 2020-08-09   |       2 |   203211 | Ulagamuthalvi |       2 |
|   50110901 | Prince      | 2020-08-09   |       2 |   401125 | Jacob         |       1 |
|   50110901 | Prince      | 2020-08-09   |       2 |   320002 | James         |       4 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   401123 | Kamalesh      |       3 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   203211 | Ulagamuthalvi |       2 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   401125 | Jacob         |       1 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |   320002 | James         |       4 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   401123 | Kamalesh      |       3 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   203211 | Ulagamuthalvi |       2 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   401125 | Jacob         |       1 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |   320002 | James         |       4 |
|   70923032 | Moses       | 2020-08-11   |       5 |   401123 | Kamalesh      |       3 |
|   70923032 | Moses       | 2020-08-11   |       5 |   203211 | Ulagamuthalvi |       2 |
|   70923032 | Moses       | 2020-08-11   |       5 |   401125 | Jacob         |       1 |
|   70923032 | Moses       | 2020-08-11   |       5 |   320002 | James         |       4 |
+------------+-------------+--------------+---------+----------+---------------+---------+
28 rows in set (0.001 sec)
```

---

### More `SELECT` Queries

#### CONCAT

`CONCAT` is a key word to join string

```sql
MariaDB [dbms_sample]>  SELECT CONCAT ('FIRST', 'SECOND');
+----------------------------+
| CONCAT ('FIRST', 'SECOND') |
+----------------------------+
| FIRSTSECOND                |
+----------------------------+
1 row in set (0.109 sec)
```

#### UNIQUE & DISTINCT

`UNIQUE` & `DISTINCT` are the keywords to get the unique or distinct values in the specified column

```sql
MariaDB [dbms_sample]> SELECT UNIQUE BatchNo FROM Course1;
+---------+
| BatchNo |
+---------+
|       1 |
|       2 |
|       3 |
|       5 |
+---------+
4 rows in set (0.112 sec)
```

```sql
MariaDB [dbms_sample]> SELECT DISTINCT BatchNo FROM Course1;
+---------+
| BatchNo |
+---------+
|       1 |
|       2 |
|       3 |
|       5 |
+---------+
4 rows in set (0.200 sec)
```

#### COUNT

`COUNT` is a built-in function to count the number of entries

```sql
MariaDB [dbms_sample]> SELECT COUNT(*) FROM Course1;
+----------+
| COUNT(*) |
+----------+
|        7 |
+----------+
1 row in set (0.000 sec)

MariaDB [dbms_sample]> SELECT COUNT(*) FROM Course1 where BatchNo=2;
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.001 sec)

```

#### IN

`IN` is a keyword to check the matched data in the array

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1 WHERE EnrolledDate IN ('2020-08-08', '2020-08-09');
+------------+-------------+--------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo |
+------------+-------------+--------------+---------+
|   40110901 | Manoj       | 2020-08-08   |       1 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |
|   40110903 | Shalom      | 2020-08-08   |       1 |
|   50110901 | Prince      | 2020-08-09   |       2 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |
+------------+-------------+--------------+---------+
5 rows in set (0.058 sec)
```

#### MAX

`MAX` is a built-in function to check the maximum value in the specified column

```sql
MariaDB [sandeep]> SELECT * FROM student;
+------+---------+
| sid  | sname   |
+------+---------+
|    1 | Mark    |
|    2 | Manas   |
|    3 | SanShiv |
|    4 | Manoj   |
|    5 | 'Manoj' |
+------+---------+
5 rows in set (0.078 sec)

MariaDB [sandeep]> SELECT MAX(sid) FROM student;
+----------+
| MAX(sid) |
+----------+
|        5 |
+----------+
1 row in set (0.006 sec)
```

#### MIN

`MIN` is a built-in function to check the minimum value in the specified column

```sql
MariaDB [sandeep]> SELECT * FROM student;
+------+---------+
| sid  | sname   |
+------+---------+
|    1 | Mark    |
|    2 | Manas   |
|    3 | SanShiv |
|    4 | Manoj   |
|    5 | 'Manoj' |
+------+---------+
5 rows in set (0.078 sec)

MariaDB [sandeep]> SELECT MIN(sid) FROM student;
+----------+
| MIN(sid) |
+----------+
|        1 |
+----------+
1 row in set (0.001 sec)
```

#### SUM

`SUM` is a built-in function to add all the values of column

```sql
MariaDB [sandeep]> SELECT * FROM sales;
+----------------------+-------+
| ProductName          | Price |
+----------------------+-------+
| Lenovo E31-45 Laptop | 50000 |
| Dell Inspiron 3501   | 70000 |
| Acer Nitro           | 85000 |
| HP Wireless Mouse    |   500 |
| MI Wireless Keyboard |  2000 |
+----------------------+-------+
5 rows in set (0.001 sec)

MariaDB [sandeep]> SELECT SUM(Price) FROM sales;
+------------+
| SUM(Price) |
+------------+
|     207500 |
+------------+
1 row in set (0.002 sec)
```

#### ORDER BY | (Descending)

`ORDER BY` with `DESC` will show the specified column(s) in descending order

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1 ORDER BY EnrolledDate DESC;
+------------+-------------+--------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo |
+------------+-------------+--------------+---------+
|   70923032 | Moses       | 2020-08-11   |       5 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |
|   50110901 | Prince      | 2020-08-09   |       2 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |
|   40110901 | Manoj       | 2020-08-08   |       1 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |
|   40110903 | Shalom      | 2020-08-08   |       1 |
+------------+-------------+--------------+---------+
7 rows in set (0.001 sec)

```

#### ORDER BY | (Ascending)

`ORDER BY` with `ASC` will show the specified column(s) in ascending order

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1 ORDER BY EnrolledDate ASC;
+------------+-------------+--------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo |
+------------+-------------+--------------+---------+
|   40110901 | Manoj       | 2020-08-08   |       1 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |
|   40110903 | Shalom      | 2020-08-08   |       1 |
|   50110901 | Prince      | 2020-08-09   |       2 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |
|   70923032 | Moses       | 2020-08-11   |       5 |
+------------+-------------+--------------+---------+
7 rows in set (0.001 sec)
```

#### ORDER BY | (RANDOM)

`RAND()` is a built-in function to give tuples in random order

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1 ORDER BY RAND();
+------------+-------------+--------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo |
+------------+-------------+--------------+---------+
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |
|   70923032 | Moses       | 2020-08-11   |       5 |
|   40110903 | Shalom      | 2020-08-08   |       1 |
|   50110901 | Prince      | 2020-08-09   |       2 |
|   50110902 | Santhosh    | 2020-08-09   |       2 |
|   40110901 | Manoj       | 2020-08-08   |       1 |
+------------+-------------+--------------+---------+
7 rows in set (0.001 sec)
```

#### LIMIT

`LIMIT` is a keyword to limit the selected data

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1 LIMIT 3;
+------------+-------------+--------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo |
+------------+-------------+--------------+---------+
|   40110901 | Manoj       | 2020-08-08   |       1 |
|   40110902 | Paramsetti  | 2020-08-08   |       1 |
|   40110903 | Shalom      | 2020-08-08   |       1 |
+------------+-------------+--------------+---------+
3 rows in set (0.001 sec)
```

#### Copy another table

```sql
MariaDB [dbms_sample]> INSERT INTO course2_teachers SELECT * FROM course1_teachers C;
Query OK, 4 rows affected (0.060 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [dbms_sample]> SELECT * FROM course2_teachers;
+----------+---------------+---------+
| staff_id | staff_name    | BatchNo |
+----------+---------------+---------+
|   401123 | Kamalesh      |       3 |
|   203211 | Ulagamuthalvi |       2 |
|   401125 | Jacob         |       1 |
|   320002 | James         |       4 |
+----------+---------------+---------+
4 rows in set (0.001 sec)
```

#### GROUP BY

The `GROUP BY` statement groups rows that have the same values into summary rows, like "find the number of customers in each country". The `GROUP BY` statement is often used with aggregate functions (`COUNT()`, `MAX()`, `MIN()`, `SUM()`, `AVG()`) to group the result-set by one or more columns.

```sql
MariaDB [dbms_sample]> SELECT * FROM Course1 GROUP BY BatchNo;
+------------+-------------+--------------+---------+
| RegisterNo | StudentName | EnrolledDate | BatchNo |
+------------+-------------+--------------+---------+
|   40110901 | Manoj       | 2020-08-08   |       1 |
|   50110901 | Prince      | 2020-08-09   |       2 |
|   60110902 | Anwar Khan  | 2020-08-10   |       3 |
|   70923032 | Moses       | 2020-08-11   |       5 |
+------------+-------------+--------------+---------+
4 rows in set (0.001 sec)

MariaDB [dbms_sample]> SELECT count(*), BatchNo FROM Course1 GROUP BY BatchNo;
+----------+---------+
| count(*) | BatchNo |
+----------+---------+
|        3 |       1 |
|        2 |       2 |
|        1 |       3 |
|        1 |       5 |
+----------+---------+
4 rows in set (0.001 sec)
```

---

## References

[SQL Tutorial - JavaPoint](https://www.javatpoint.com/sql-tutorial)
<br>
[SQL Group By - W3Schools](https://www.w3schools.com/sql/sql_groupby.asp)
<br>
[MariaDB vs MySql - softwaretestinghelp](https://www.softwaretestinghelp.com/mariadb-vs-mysql/)
<br>
[SQL (ddl, dql, dml, dcl, tcl commands) - Geeks for geeks](https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/)
<br>
[12th Computer Science - Samacheer kavli](https://drive.google.com/file/d/1JCjwGNrGbdlsg82xucbQ0E8LdzWTLnjr/view)
