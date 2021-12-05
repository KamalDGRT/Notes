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

-   `DESCRIBE keyspace tabular;` will describe our newly created table.
-   To add a record,

```sql
INSERT INTO book
(bookid, author, title, year, categories, added)
VALUES
(uuid(), 'Bobby Brown', 'Dealing with Tables', 1999, {'programming', 'computers'}, toTimeStamp(now()));
```

-   To check if they have been inserted, you can check with this:

```sql
SELECT * FROM book;
```

-   Inserting another record.

```sql
INSERT INTO book
(bookid, author, title, year, categories, added)
VALUES
(uuid(), 'Andrea Agnes', 'The Moon', 2001, {'space', 'non-fiction'}, toTimeStamp(now()));
```

-   Fetching a specific record

```sql
SELECT * FROM book
WHERE bookid = 2f0e7571-aa06-4716-bbc0-2f42880a007e;
```

-   Creating another table.

```sql
CREATE TABLE IF NOT EXISTS restaurant_by_country (
    country TEXT,
    name TEXT,
    cuisine TEXT,
    url TEXT,
    PRIMARY KEY ((country), name, url)
) WITH CLUSTERING ORDER BY (name DESC, url ASC);
```

Whatever we pass in PRIMARY KEY will be our partition key.

So,

-   `country` - partition key
-   `name`, `url` - clustering keys

Inserting records into this new table.

```sql
INSERT INTO restaurant_by_country
(country, name, cuisine, url)
VALUES
('POLAND', 'Wiejska Karczma', 'traditional', 'www.karczma.pl');
```

```sql
INSERT INTO restaurant_by_country
(country, name, cuisine, url)
VALUES
('SINGAPORE', 'The Shack', 'american', 'www.shack.sg');
```

```sql
INSERT INTO restaurant_by_country
(country, name, cuisine, url)
VALUES
('UNITED KINGDOM', 'The Red Rose', 'pub', 'www.redrose.co.uk');
```

Fetching all the newly inserted records.

```sql
SELECT * FROM restaurant_by_country;
```

Fetching a specific record:

```sql
SELECT * from restaurant_by_country
WHERE country='SINGAPORE';
```

```sql
INSERT INTO restaurant_by_country
(country, name, cuisine, url)
VALUES
('SINGAPORE', 'The Hut', 'lebanese', 'www.hut.sg');
```

```sql
SELECT * from restaurant_by_country
WHERE country='SINGAPORE';
```

---

### Document Type Model

-   Document or document oriented database types are arguably one of the
    easiest types to deal with.
-   This is because they require no schema.
-   In tabular data model, we had to define schema, but here we don't.
-   As long as our data comes as an object, it is fine.
-   The objects are made up of keys and values.
-   Example of an object in a `to-do-list application`:

```json
{
    "id": 0,
    "title": "Fix Bike",
    "description": "Fix bike before housemate finds out",
    "done": true
}
```

-   The values part in these objects can be numbers, strings, boolean or
    another object.
-   This is called JSON (JavaScript Object Notation) and is the popular
    format for document database types.
-   A group of documents is called a **collection**.
-   So, we will not be using the word _tables_ anymore.
-   It has been replaced by collections.
-   So, keep that in mind moving forward.

---

-   Lets make a collection of to-do items using a Document API.
-   An API stands for **Application Programming Interface**.
-   They allow for technologies to essentially talk with each other and are
    essential to so many services we rely on today.
-   Examples of API
    -   twitter API - to fetch tweets
    -   Map API - for delivery services

---

#### HTTP Request Methods

The most common are:

-   GET Request
-   POST Request
-   PUT Request
-   DELETE Request

---

#### Creating a new keyspace: document

-   Create a new keyspace in the DataStax Astra dashboard.
-   To work with document types, we have to connect with a document API.
-   Before we do that, we have to get a token in order to communicate
    with our database.
-   To do this, go to `Settings` -> `Application Settings` ->
    `Organization Settings` -> Choose `Adminsrator` user ->
    `Generate Token`.
-   Copy Token.
-   Click on the database -> `Connect` -> `Swagger UI`
-   Create a new empty collection by choosing this

```js
POST
​/v2​/namespaces​/{namespace-id}​/collections
Create a new empty collection in a namespace
```

-   Click on `Try it Out`.
-   Under `X-Cassandra Token` paste the token value that you copied in above
    step.
-   Under `namespace-id` fill `document` in it because that is the one that
    we created.
-   In the body, add the JSON data for the new collection name.

```json
{
    "name": "first_collection"
}
```

-   Scroll down and click `Execute`.
-   If it went successfully, you would be getting a response status of 201.

---

##### Adding stuff into the collection

-   Lets add new stuff into the newly created collection.
-   Go to the following endpoint.

```js
POST
​/v2​/namespaces​/{namespace-id}​/collections​/{collection-id}
Create a new document
```

-   Click on `Try it Out`.
-   Fill in the token.
-   `namespace-id` -> `document`
-   `collection-id` -> `first_collection`
-   In the body I am gonna add this

```json
{
    "id": 1,
    "title": "Make Dinner",
    "description": "Make dinner for friends coming over.",
    "done": false
}
```

-   Click on `Execute`.
-   If it all went fine, you will get a `201` response with
    a JSON object containing the `documentId`.

---

##### Getting all the documents present in a collection

-   Lets fetch all the objects present in a collection.
-   Go to the following endpoint.

```js
GET
​/v2​/namespaces​/{namespace-id}​/collections​/{collection-id}
Search documents in a collection
```

-   Click on `Try it Out`.
-   Fill in the token.
-   `namespace-id` -> `document`
-   `collection-id` -> `first_collection`
-   Click on `Execute`.
-   If it all went fine, you will be getting a response code of `200` along
    with a response body that has all the items.

---

##### Get a specific document

-   Lets fetch a specific document from a collection.
-   Go to the following endpoint.

```js
GET
​/v2​/namespaces​/{namespace-id}​/collections​/{collection-id}​/{document-id}
Get a document
```

-   Click on `Try it Out`.
-   Fill in the token.
-   `namespace-id` -> `document`
-   `collection-id` -> `first_collection`
-   `document-id` -> `<id of the newly created document>`
-   Click on `Execute`.
-   If it all went fine, you will be getting a response code of `200` along
    with a response body that has one item from from our collection based by
    its `documentId`

---

##### Fetching multiple records based on a condition

-   Lets add another document into the collection.
-   Go to the following endpoint.

```js
POST
​/v2​/namespaces​/{namespace-id}​/collections​/{collection-id}
Create a new document
```

-   Click on `Try it Out`.
-   Fill in the token.
-   `namespace-id` -> `document`
-   `collection-id` -> `first_collection`
-   In the body I am gonna add this

```json
{
    "id": 2,
    "title": "Make Dinner",
    "description": "Clean Dishes after dinner",
    "done": false
}
```

-   Click on `Execute`.
-   If it all went fine, you will get a `201` response with
    a JSON object containing the `documentId`.
-   Let's add another document.

```json
{
    "id": 10,
    "title": "Fix Shoes",
    "description": "Take Shoes to fix.",
    "done": false
}
```

Now lets try to fetch the records that have the title `Make Dinner`.

-   Go to the following endpoint.

```js
GET
​/v2​/namespaces​/{namespace-id}​/collections​/{collection-id}
Search documents in a collection
```

-   Click on `Try it Out`.
-   Fill in the token.
-   `namespace-id` -> `document`
-   `collection-id` -> `first_collection`
-   `where` -> `{"title": {"$eq": "Make Dinner"}}`
-   Click on `Execute`.
-   If it all went fine, you will be getting a response code of `200` along
    with a response body that has all the items.

---

##### Updating a document

You can use this end point to update a document that is present in a collection.

```js
PUT
​/v2​/namespaces​/{namespace-id}​/collections​/{collection-id}​/{document-id}
Create or update a document with the provided document-id
```

Feel free to play around the various endpoints present in the Swagger UI.

---

### Key Value Database Model

-   They are considered to be the easiest database type and usually come
    looking like this:

    ```js
    KEY     VALUE
    A1      AAA,BBB,CCC
    A2      111,222,333
    A3      CCC,111,XXX
    ```

-   There will be a key column and a value column.
-   You can actually have as many value columns as you wish.
-   The important thing here is that we can retrieve data back to us, i.e.
    an entire row by the key as that is the identifier in this case.
-   Example of a Key Value Database

```

```

---

#### Creating a new keyspace: keyvalue

-   In the DataStax Astra Dashbord, go to the databases tab and create a new
    keyspace with the name `keyvalue`.
-   This time let us use GraphQL as we have already used Document API before.
-   Click on `Connect`.
-   Open the GraphQL playground URL.
-   Add your Cassandra Token in the `HTTP Headers`.
-   By default the graphql query is:

```gql
{
    keyspaces {
        name
    }
}
```

-   To create a table using GraphQL run this command

```gql
mutation {
    createTable(
        keyspaceName: "keyvalue"
        tableName: "shop_inventory"
        partitionKeys: [{ name: "key", type: { basic: TEXT } }]
        values: [{ name: "value", type: { basic: TEXT } }]
    )
}
```

If it all went fine, you will be getting this message in the output

```json
{
    "data": {
        "createTable": true
    }
}
```

Now that the table is created, lets add keys and values.

-   In the URL part, change `/api/graphql-schema` to `/api/graphql/keyvalue`.
-   We are adding `keyvalue` as that is the keyspace that we created earlier.

```gql
mutation {
    insertshop_inventory(value: { key: "3dr53", value: "beans" }) {
        value {
            key
            value
        }
    }
}
```

The line

```gql
insertshop_inventory(value: { key: "3dr53", value: "beans" })
```

is the insertion part.

-   The statement below it

```gql
value {
    key
    value
}
```

is added to return the newly added record in the table.

-   If it all went fine, you will be getting this:

```json
{
    "data": {
        "insertshop_inventory": {
            "value": {
                "key": "3dr53",
                "value": "beans"
            }
        }
    }
}
```

-   Lets add another item.

```gql
mutation {
    insertshop_inventory(value: { key: "42dhw", value: "shampoo" }) {
        value {
            key
            value
        }
    }
}
```

-   Before actually fetch the data using GraphQL, lets check if we can fetch
    the data in the `CQL Console`.

-   `USE keyvalue;`
-   `DESCRIBE TABLE "shop_inventory";`
-   `SELECT * FROM "shop_inventory";`

-   If you run the above queries in order, you can see the newly inserted
    records.
-   Lets now see how we can fetch them using GraphQL.

```gql
query {
    shop_inventory {
        values {
            key
            value
        }
    }
}
```

-   This would return this:

```json
{
    "data": {
        "shop_inventory": {
            "values": [
                {
                    "key": "42dhw",
                    "value": "shampoo"
                },
                {
                    "key": "3dr53",
                    "value": "beans"
                }
            ]
        }
    }
}
```

Lets insert another record:

```gql
mutation {
    insertshop_inventory(value: { key: "dhe342", value: "coca cola" }) {
        value {
            key
            value
        }
    }
}
```

Now lets see how to delete a record.

```gql
mutation {
    deleteshop_inventory(value: { key: "dhe432" }) {
        value {
            key
        }
    }
}
```

**If we try to remove something by the value instead of the primary key that**
**we have assigned, we will get an error.**

---

### Graph Type Data Model

-   Graph databases are a great way to store data that has relationsips
    between other pieces of data or in other words, nodes.
-   Each node is connected by an edge to represent this relationship.
-   For example, your friends on social media. You and your friends would be
    the nodes and the connection you have would be represented by the edges.
-   `docker network create graph`

Clone the repository

```
git clone https://github.com/datastaxdevs/workshop-introduction-to-nosql.git
```

Go inside the newly created directory.

```
docker-compose up -d
```

It will take some time to set it up.

Graph Database will use Gremlin language. So, you can learn that and then
implement it.
