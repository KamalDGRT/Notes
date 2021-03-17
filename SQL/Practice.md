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
| 2    | Ajay    | M      | 04/02/2001 | 400   | 80      | C     |
| 3    | Bharath | M      | 11/05/2000 | 355   | 71      | D     |
| 4    | Shivani | F      | 05/06/2001 | 476   | 95.2    | A     |
| 5    | Sarchin | M      | 12/23/2001 | 400   | 80      | C     |
| 6    | Dhoni   | M      | 11/17/2000 | 415   | 83      | B     |
| 7    | Kamala  | F      | 12/05/2001 | 400   | 80      | C     |
| 8    | Varun   | M      | 11/11/2000 | 470   | 94      | A     |
| 9    | Rekha   | F      | 10/15/2000 | 490   | 98      | A     |

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
        INSERT INTO `Student`
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
    FROM `Student`;
```

##### _Output_ :  SELECT Sname, Gender
    FROM `Student`;

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
#### _Output :_
```sql
    select * from student;
```

### Q03. Display the unique values of `Total` from the table.

### Q04. Display roll number and name of the male students.

### Q05. Display the roll number and name of male students who have scored above 400.

### Q06. Display the details of students who have scored between 400 and 450. (Limits inclusive)

### Q07. Display details of male students who have scored between 400 and 450.

### Q08. Display names of students who have scored the grades A, B or C from the table.

### Q09. Display the name of female students who have scored the grades A or B.

### Q10. Display the roll numbers of students who have scored grade other than A or B.

### Q11. Display the names of the students born in the year 2001.

### Q12. Display the names of the students born in the month of November 2000.

### Q13. Display the names of the students born in the year 2000 but not in the month of November.

### Q14. Display the different grades obtained by the students.

### Q15. Display the name, average and grade of all female students in the following format:

```
Shivani has scored an average of 95.2 with grade A.
```

### Q16. Assume there is no average column in the table and the Total attribute is the expression of 5 subjects mark. Display the name and average marks of all the female students.

### Q17. Display names of students whose name starts with 'A'.

### Q18. Display the roll number, name, total of the students whose starts with 'A' and ends with 'd'.

### Q19. Display the details of students whose name is exactly 5 charcters in length.

### Q20. Display the details of students whose name has 'i'.

### Q21. Display the names of students not starting with A or S.

### Q22. Display names of students whose birth date is 5.

### Q23. Display the names of students in the table in alphabetical order.

### Q24. Display the name and total of female students in descending order of total.

### Q25. Display the name, grade and total of all the students who have scored above 395 in descending order of their grades and ascending order of their name.

### Q26. Find the sum of the total marks obtained by students who have scored the grade 'A'.

### Q27. Display the average of the average marks scored by 'A' graders.

### Q28. Display the total number of students in the table.

### Q29. Display the number of different grades available in the table.

### Q30. Display the details of the student(s) who is the youngest in the table.

### Q31. Write the Output for the following

#### Q31.1

```sql
    SELECT MAX(Dob), MIN(Dob), SUM(Total)
    FROM `Student`
    WHERE Dob BETWEEN '2001-01-01' AND '2001-12-31';
```

#### Q31.2

```sql
    SELECT COUNT(*), MAX(Total), MIN(Total)
    FROM `Student`
    WHERE Grade IN ('A', 'B');
```

#### Q31.3

```sql
    SELECT SUM(Total + 5)
    FROM `Student`
    WHERE Grade='D';
```

#### Q31.4

```sql
    SELECT AVG(Total / 5)
    FROM `Student`;
```

### Q32. Display the count of gender based on gender.

### Q33. Display the maximum and minimum marks obtained by the students grade wise.

### Q34. Display the maximum and minimum total of the students born in the year 2001 based on their grade.

### Q35. Display the number of students grade wise where grades include A and B.

### Q36. Display the number of students grade wise where number of students in each grade is more than two.

### Q37. Update Varun's date of birth to 12th November 2000.

### Q38. Increment Sarchin's mark by 10 and alter his grade to B.

### Q39. Create a view V1 which is an exact copy of the _Student_ table. Display it after creation.

Note: 2 seperate queries to be executed. One for the view and another for the displaying part.

### Q40. Create a view V2 which contains roll number and name of all the 'A' graders.

### Q41. Display the contents of the new view V2.

### Q42. Create a view V3 that has a a copy of roll number and name of all the 'A' graders but with new column names. Display the view after creation.

Note: 2 seperate queries to be executed. One for the view and another for the displaying part.

### Q43. Add a new column age of appropriate data type to the existing table and fill the age.

Note: First you will be adding a the column. Then you will be calculating the age and updating it in the table. So, 2 separate queries. Have the output of both the queries.

### Q44. Remove the column age from the _Student_ table.

### Q45. Alter the Average column to FLOAT(10, 2).

Note:

-   Before executing the query for this question, execute `DESC Student;` and have the output in the markdown file.
-   Display the `Student` Table.
-   Have the query and the output for that in the markdown file.
-   Execute the query to change the column type.
-   Paste the query and the output to the markdown file.
-   Execute `DESC Student;` and paste the output in the markdown file.
-   Display the `Student` table again.

### Q46. Display the value of Total / 5 for every female student and give a new column name.

<hr>

We need this table for the next set of queries.

-   Table Name : `Personal`

| Roll | Parent | Address          | Phone_No |
| ---- | ------ | ---------------- | -------- |
| 2    | ABC    | 1st Cross Street | 12345678 |
| 3    | XYZ    | 2nd Cross Street | 41234561 |
| 4    | PQR    | 3rd Cross Street | 12370171 |
| 7    | LMN    | 4th Cross Street | 40007714 |
| 9    | ABCD   | 5th Cross Street | 56789101 |

<hr>

### Q47. Display the student name, parent name and address of all the students.

### Q48. Display the roll number, student name and parent name of all 'A' graders.

### Q49. Remove the details of those students from the `Student` table who have got 'D' grade.

### Q50. Remove the Student table from the database.
