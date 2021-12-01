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

### Setting Up

-   As mentioned there are 4 main types of NoSQL database systems each using a
    different data model.
-   Once again, they are:

    -   Key-Value
    -   Document
    -   Tabular
    -   Graph

-   Databases have multiple layers.
-   The first layer is an **interface** or in other words a visual platform
    where you can visit and interact with data which is where you find the
    format, the language and the transport.
-   In this course the interface that we are going to use is called
    DataStax Astra data management system.
-   DataStax Astra DB is an auto-scaling Database-As-A-Service built on
    Apache Cassandra designed to simplify cloud-native application
    development.
-   Because it is built on Apache Cassandra, one would be using the
    Cassandra Query Language or CQL.
-   CQL offers a model close to SQL in the sense that data is put in tables
    containing rows and columns.
-   It is through these languages that we interact with our database.
-   The next layer is the **execution** layer.
-   This is where we pass the incoming queries coming from our interface.
-   It is also used as an analyser and dispatcher.
-   Finally we have the **storage** layer in which the indexing of data
    happens.

The reason for using DataStax Astra is that it allows all 4 database models so
that we need to sign up for different stuff for different purposes.

We can group these Database Management Systems into families according to the
C.A.P Theorem. According to the C.A.P theorem, a NoSQL database cannot achieve
consistency, availability and partition tolerance. It must sacrifice one of the
three. For example, MongoDB and Kafka, chose to focus on CP and the DBMS that
we are going to use (DataStaxAstra) is built on Apache Cassandra which chose
to focus on A.P.

So to recap, what we are doing here is using DataStax Astra, which is an
interface essentially, that will will allows us to work with NoSQL database,
which is in this case, Apache Cassandra. To be exact, Apache Cassandra is an
open sourced NoSQL distributed database. The language that we would use to
communicate is Cassandra Query Language or CQL for short, which as mentioned
is very similar to SQL. Most NoSQL databases have their own Query Language
but not all.

---

In the DataStax Astra, create a database.

-   Name it as `fcc_tutorial`
-   Keyspace: `tabular`
-   Cloud provider: anything that you want, I am choosing AWS
-   Region: choose your closest region
-   When you create the DB, initially it will be `pending`.
-   Wait for it to turn `active`.

Now that we have set up our Database Management System let's start getting to
some examples.

---

### Tabular Type

-   It also known as Column Database Type or a Wide Column Database Type.
-   Tables are relational and come with a schema.
-   We will be creating a table called `books` and will be defining what kind
    of rows the table can take.

| Field Name | Type        |
| ---------- | ----------- |
| Book ID    | UUID        |
| Author     | Text        |
| Title      | Text        |
| Year       | Int         |
| Categories | Set of Text |
| Timestamp  | Timestamp   |

UUID = Universally Unique Identifier

In the DataAstrax dashboard:

-   Click on the database
-   Click on `CQL Console`
-   Type `describe keyspaces;`.
-   Keyspace means logical grouping of tables (in RDBMS, it would be `database`)
-   To use the newly created `tabular` keyspace, type `use tabular;`
-   Lets create a table in the `tabular` keyspace.

```sql
CREATE TABLE IF NOT EXISTS book (
    bookid uuid,
    author TEXT,
    title TEXT,
    year INT,
    categories SET <text>,
    added TIMESTAMP,
    PRIMARY KEY (bookid)
);
```

uuid is a 128-bit label used for information in computer systems.

Primary key is something that allows us to identify records uniquely.
The `bookid` will also be our partition key.

- `DESCRIBE keyspace tabular;` will describe our newly created table.
