# SQL Notes

#### Database Concepts

| Term                  | Description                |
| --------------------- | -------------------------- |
| Relational data model | Tabular form, relations    |
| relation              | table                      |
| attribute             | every column of a relation |
| tuple                 | every row of a relation    |
| degree of a relation  | number of attributes       |
| cardinality           | number of tuples           |
| view                  | virtual table              |

#### Types of Keys

-   Primary Key
-   Alternate Key
-   Candidate Key
-   Foreign Key

#### Some important points

**_Student_** Table

| Admission_no | Roll_no | Sname | Total |
| ------------ | ------- | ----- | ----- |
| 1234         | 1       | abc   | 123   |
| 5678         | 2       | def   | 431   |
| 8765         | 3       | ghi   | 436   |
| 4321         | 4       | jkl   | 172   |

I will try to explain some concepts using the above table.

-   Primary Key : `Roll_no`
-   Aternate Key : `Admission_no`
-   Candidates for Primary Key : `Roll_no`, `Admission_no`

-   Two types of operation on a table:

    -   Selection Operation
    -   Projection Operation

-   #### Selection Operation

    -   Done on `tuples` (rows)
    -   Repesented by &sigma;
    -   Example: &sigma; <sub>`Total < 400` </sub> (Student)
    -   Output:
        | Admission_no | Roll_no | Sname | Total |
        | ------------ | ------- | ----- | ----- |
        | 1234 | 1 | abc | 123 |
        | 4321 | 4 | jkl | 172 |

-   #### Projection Operation

    -   Done on `attributes` (columns)
    -   Represented by &pi;
    -   Example: &pi; <sub>`Total, Roll_no`</sub> (Student)
    -   Output:
        | Total | Roll_no |
        | ----- | ------- |
        | 123 | 1 |
        | 431 | 2 |
        | 436 | 3 |
        | 172 | 4 |

-   #### Combination of Projection and Selection

    -   Example: &pi; <sub>`Total, Roll_no`</sub> (&sigma; <sub>`Total < 400`</sub>) (Student)
    -   Output:
        | Total | Roll_no |
        | ----- | ------- |
        | 123 | 1 |
        | 172 | 4 |

-   #### Cartesion Product

    -   ##### Table 1 : _Student_

        | Roll | Name |
        | ---- | ---- |
        | 1    | abc  |
        | 2    | pqr  |
        | 3    | xyz  |

    -   ##### Table 2 : _Teacher_

        | id  | Tname |
        | --- | ----- |
        | 714 | LMN   |
        | 120 | RST   |

    -   ##### _Student_ x _Teacher_

        | Roll | Name | id  | Tname |
        | ---- | ---- | --- | ----- |
        | 1    | abc  | 714 | LMN   |
        | 1    | abc  | 120 | RST   |
        | 2    | pqr  | 714 | LMN   |
        | 2    | pqr  | 120 | RST   |
        | 3    | xyz  | 714 | LMN   |
        | 3    | xyz  | 120 | RST   |
