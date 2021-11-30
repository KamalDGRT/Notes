# NoSQL Database

This file contains the notes that I have taken by watching
[this](https://www.youtube.com/watch?v=xh4gy1lbL2k) video.

In that course, the instructor is teaching the following stuff:

-   NoSQL
-   What is NoSQL
-   NoSQL vs SQL
-   4 types of NoSQL databases
-   Explanation, Example, Exercise would be given
-   Implementing the newly learnt concepts in 2 real life use cases (Projects)

---

### What is NoSQL?

-   It is an approach to Database Management.
-   It is considered to be super flexible as it allows for a variety of data
    models such as:
    -   Key-Value
    -   Document
    -   Tabular
    -   Graph

![data models](https://i.imgur.com/txvMV4Y.png)

-   These are the 4 we will be looking at in multi-model databases.
-   We have already mentioned that NoSQL databases are casually considered to
    be flexible; but officially the defining characteristics of NoSQL
    databases are considered to be that they are:
    -   Non-relational
    -   Distributed
    -   Scalable
-   Distributed refers to running on clusters of machines globally distributed
    to support apps at different geographical locations.
-   Scalable means that NoSQL databases are able to store and query large
    scale data as well as support high transaction throughput scaling
    horizontally.
-   In addition to this, they are also partition tolerant -- meaning that they
    are able to work in the presence of network partitioning.
-   They are also highly available -- meaning that they are able to send
    requests even when some machines go down. They can do this as they have
    data replication built-in.
-   Non-Relational - let's see what it entails. To understand this fully, we
    need to look at relational databases first. The relational data model
    and SQL were designed for databases that work on a single machine and scale
    vertically. We will go into this in a bit more detail later on. In fact,
    everything that is mentioned in this point is in contrast to what relational
    database is all about which is:

    -   Atomicity
    -   Consistency
    -   Isolation
    -   Durability

    or A.C.I.D for short.
    We are discussing relational databases as to understand where NoSQL came
    from. We have to look at them as well as SQL.

---

### Structured Query Language (SQL)

-   SQL stands for Structured Query Language.
-   It is used for relational databases.
-   By relational, it means a collection of tables with rows and columns that
    stores a specific set of structured data.
-   NoSQL is used for non-relational and relational databases.
-   NoSQL means not only SQL. You can use SQL in it if you want to.

| NoSQL                          | SQL                                |
| ------------------------------ | ---------------------------------- |
| A database management approach | Not a database management approach |
| Not a Query Language           | A Query Language                   |

---

### Why use NoSQL?

There are 2 reasons for it.

-   Application Development Productivity
-   Large Scale Data

#### Application Development Productivity

-   When developing an app, there is a significant amount of time spent on
    organizing data.
-   By organizing, I mean mapping data between in-memory data structures
    and a relational database.
-   So, in another words, a type of database that supports SQL.
-   As a Non Relational Database Mangement approach, NoSQL can provide a data
    model that benefits the application's need and in turn makes our lives
    easier in the long run.
-   As the data model is most suited for the application, it makes the
    debugging and writing code easier and as well as allows easy evaluation.

#### Large Scale Data

-   As we know organizations today love to capture as much data as possible
    to improve their offerings as well as other things.
-   However, capturing large amount of data and processing it quickly is
    expensive in terms of operation.
-   So, whilst it is easy to do so with relational databases, it is usually
    more economic to run large data and processes on lots and lots of little
    cheaper machines or clusters that NoSQL databases are explicitly designed
    to run on rather than one large one large one as it is typical for
    relational databses.

In conclusion, NoSQL is a database management approach. The characteristics
we can expect from a NoSQL database are that it is:

-   Non-Relational
-   Distributed
-   Scalable

---

### NoSQL vs SQL

-   Now, when people look at NoSQL and SQL, they might be tempted to compare
    the two.
-   But by now, we know we can't do this.
-   Why again? This is because once again, NoSQL is a database management
    approach and SQL is a language. So, 2 completely different things.
-   It might be better going forward to start referring to NoSQL databases
    as Non-Relational databases.

| Non-relational or NoSQL                   | Relational                       |
| ----------------------------------------- | -------------------------------- |
| Uses SQL or doesn't use SQL               | Uses SQL                         |
| Not only tables with fixed columns & rows | Tables with fixed columns & rows |
| Flexible Schema                           | Fixed Schema                     |
| Scales out horizontally                   | Scales up vertically             |

---
