# SQL Practice

It is my view that if you solve these questions you would have a good
understanding and usage of various SQL commands.

For now, I will have the questions. <br>
Later when you complete them, I will provide with the answers in this
same file. <br>
Try to provide the output of the command too. <br>
So, to copy the output, it would be easier for you if you execute the
commands in the command prompt.

Create the following table with the following values. <br>

-   Database Name : `sqlpractice`
-   Table Name : `Student`

##### Note

-   The date is in `mm/dd/yyyy` format.
-   While storing in the database, store it in the format that our _MySQL_ recognises: `yyyy-mm-dd`.
-   While storing the names, it has to be given within the single quotes (`'`).
-   Date can be given in single quotes.
-   Use the table name instead of `TABLE` while inserting into a table.
-   For numerical values, the quotes is not needed.
-   For most of the questions answer will be the same for everyone.
-   For a few questions, it might vary depending on how you approach the question.

| Roll | Sname   | Gender | Dob        | Total | Average | Grade |
| ---- | ------- | ------ | ---------- | ----- | ------- | ----- |
| 1    | Anand   | M      | 05/13/2001 | 407   | 81.4    | B     |
| 2    | Ajay    | M      | 04/02/2001 | 406   | 80      | C     |
| 3    | Bharath | M      | 11/05/2000 | 355   | 71      | D     |
| 4    | Shivani | F      | 05/06/2001 | 476   | 95.2    | A     |
| 5    | Sarchin | M      | 12/23/2001 | 400   | 80      | C     |
| 6    | Dhoni   | M      | 11/17/2001 | 415   | 83      | B     |
| 7    | Kamala  | F      | 12/05/2001 | 400   | 80      | C     |
| 8    | Varun   | M      | 11/11/2001 | 470   | 94      | A     |
| 9    | Rekha   | F      | 10/15/2001 | 490   | 98      | A     |

#### Hints

-   This the command to create the table:

    ```sql
        CREATE TABLE Student(
            Roll INT NOT NULL,
            Sname char(15),
            Gender char(2),
            Dob DATE,
            Total INT,
            Average NUMERIC(10, 2),
            Grade char(2)
        );
    ```

-   This is just an example to insert into the table. I am showing the example for the first row.
-   For the remaining rows, do it on your own.

    ```sql
        INSERT INTO `student`
        (`Roll`, `Sname`, `Gender`, `Dob`, `Total`, `Average`, `Grade`)
        VALUES
        (1, 'Anand', 'M', '2001-05-13', 407, 81.4, 'B');
    ```

## Questions

### Q01. Display name and gender of all the students.

#### _Answer :_

##### _Query_ :

```sql
    SELECT Sname, Gender
    FROM `student`;
```

##### _Output_ :

```
+---------+--------+
|  Sname  | Gender |
+---------+--------+
| Anand   | M      |
| Ajay    | M      |
| Bharath | M      |
| Shivani | F      |
| Sarchin | M      |
| Dhoni   | M      |
| Kamala  | F      |
| Varun   | M      |
| Rekha   | F      |
+---------+--------+
```

### Q02. Display the contents of the entire table.

### Q03. Display the unique values of `Total` from the table.

### Q04. Display roll number and name of the male students.

### Q05. Display the roll number and name of male students who have scored above 400.

### Q06. Display the details of students who have scored between 400 and 450. (Limits inclusive)

### Q07. Display details of male students who have scored between 400 and 450.

### Q08. Display names of students who have scored the grades A, B or C from the table.

### Q09. Display the name of female students who have scored the grades A or B.

### Q10. Display the roll numbers of students who have scored grade other than A or B.
