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
