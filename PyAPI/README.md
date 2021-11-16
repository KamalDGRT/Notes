# Python API Development

This file contains the notes that I have taken by watching
[this](https://www.youtube.com/watch?v=0sOvCWFmrtA) video.

In that course, the instructor is using `FastAPI` to create the APIs.

---

### Introduction

-   Your own API, 19 hours course
-   We don't need 19 hours to build out an API
-   We'll be building a fully fledged API that includes
    -   Authentication
    -   CRUD Operation
    -   Validation
    -   Documentation
-   We will also be learning about the tooling that surrounds building
    a complete and robust API.

---

### Topics Covered in the course

-   A large section is dedicated to learning SQL
-   For SQL, the instructor will teach. No need to know anything beforehand.
    But if you do, it will be like a revision. So, go through it.
-   Core SQL concepts: DML, DDL, etc.
-   Integrating SQL database in API using 2 different methods
    -   Raw SQL queries
    -   ORMs (Object Relational Models)
-   DB migration tools like _`Alembic`_ as it allows us to make incremental
    changes to our database schema.
-   _`Postman`_ - To test our API
-   Testing - how to setup automated Integrity Testing
-   2 Types of Deployment
    -   Cloud (Ubuntu, etc) eg. GCP, AWS, Digtal Ocean
    -   Heroku
-   How to dockerize your API
-   CI/CD pipeline using GitHub

---

### Techstack

-   Python - for the API creation using `FastAPI`
-   Postgres SQL - for the database
-   SQLAlchemy - for the ORM

---

### Application to be built

-   API for a social media application will be built.
-   There will be an interactive document too

---

### Development Environment Setup

-   Git (for version control)
-   Python (anything above 3.7 will/should do)
-   Setup a virtual environment in any folder. Lets name it `py-api`.
-   Install and Configure VS Code
    -   install Python Extension from Microsoft
    -   open the folder created in step 2 (`py-api`).
    -   Set the default python environment to the newly created virtual
        environment.
    -   In that virtual environment install FastAPI
        -   `pip install -U pip`
        -   `pip install fastapi[all]`
        -   `pip install autopep8`
-   Postgres SQL server setup
-   PG Admin (Postgres Admin) setup
    -   I did that using Python in the Linux
    -   For windows, there is a separate application
-   Postman API Destktop Client

---

### First basic app

I added the following content in a `main.py` that exists `py-api` folder.

```py
# https://fastapi.tiangolo.com/tutorial/first-steps/
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}
```

Lets see what each of it means.

| Item   | Meaning                      |
| ------ | ---------------------------- |
| `@`    | Decorator                    |
| `app`  | FastAPi instance             |
| `get`  | One of the many HTTP methods |
| `"/"`  | The Path Decorator           |
| `root` | Path operation function.     |

> **Note:**
> Path operation function can be named in any way and can be prefixed with
> `async` depending on the need. In the similar way the routes or the path
> operations can be named in anyway. With said that, it is better to have
> meaningful names.

Lets see how to execute the above code.

If you had setup the virtual environment correctly, then all the necessary
packages would be present.

```
uvicorn main:app --reload
```

Lets see what each word means in the above command.

-   `uvicon` - provides neccessary stuff for a web server
-   `main` - name of the python file
-   `app` - name of the `FastAPI` instance variable
-   `--reload` - takes care of reloading the server when any changes
    are done in the code.

> **Note**
> Anytime we send a request to the API, it goes down the list of all the
> path operations (routes) till it gets a first match. If found, the first
> match, it stops searching and returns that match. In other words, the
> order in which you declare the path operations matters.

---

### HTTP GET versus POST requests

![post](https://i.imgur.com/MTpb9tL.jpg)

-   Main difference is we send some sort of data to the API.

![post](https://i.imgur.com/5feXDz1.jpg)

-   The data that we send can be in any format, but having it in JSON is
    easier.

---

### Post requests

Lets update the `main.py` to make it look something like this.

```py
# https://fastapi.tiangolo.com/tutorial/first-steps/
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.post('/createpost')
def fetch_users():
    return {
        "message": "Your post has been created!"
    }
```

-   The above is just an example.
-   It is not the recommended way.
-   If you notice, we have not sent any data.
-   So, lets alter it to make it receive any data that is passed to it.
-   To do that, first open the Postman Desktop Client and do these
    -   Request Type: POST
    -   URL: `http://127.0.0.1:8000`
    -   Click on `Body`.
    -   Select Raw
    -   Select type as `JSON`
    -   Add this as the content for the body:
        ```json
        {
            "title": "Yii2 Framework",
            "content": "Yii2 is one of the top 5 PHP Frameworks"
        }
        ```
-   When we hit that end point, we still wouldn't be able to access
    the data passed in our path operation.
-   So, lets modify the function to make it access it.

```py
# https://fastapi.tiangolo.com/tutorial/first-steps/

from fastapi import FastAPI
from fastapi.params import Body

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


# This is the content that I gave in the Body -> Raw -> JSON in the Postman
# {
#     "title": "Yii2 Framework",
#     "content": "Yii2 is one of the top 5 PHP Frameworks"
# }
@app.post('/createpost')
def create_post(payLoad: dict = Body(...)):
    print(payLoad)
    return {
        "new_post": f"Title: {payLoad['title']}, Content: {payLoad['content']}"
    }
```

-   It is going to extract all of the fields from the body.
-   It is going to convert that to a python dictionary and is going to store
    it into a variable name `payLoad`.
-   The variable name can be anything, but payLoad makes more sense.
-   So, we will use that.

---

### Why we need schema

-   It is a pain to get all the values from the body.
-   The client can send whatever data they want.
-   The data isn't getting validated.
-   We ultimately want to force the client to send data in a schema
    that we expect.

We can use `pydantic` to define how our schema should look like.

> **Note:** `pydantic` has nothing to do with `FastAPI`. It is its own
> complete separate library that you can use with any of your Python
> applications.

---

### Example of pydantic in FastAPI application

```py
# https://fastapi.tiangolo.com/tutorial/first-steps/

from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional


class Post(BaseModel):
    """
    A pydantic model that does the part of data
    validation.

    It is because of this we can ensure that whatever
    data is sent by the frontend is in compliance
    with the backend.
    """
    title: str
    content: str
    published: bool = True
    rating: Optional[int] = None


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


# This is the content that I gave in the Body -> Raw -> JSON in the Postman
#  Feel free to test out with vallues of different types.
# {
#     "title": "Yii2 Framework",
#     "content": "Yii2 is one of the top 5 PHP Frameworks",
#     "rating": 4
# }
@app.post('/createpost')
def create_post(post: Post):
    post.dict()   # Converts a pydantic model to a dictionary
    return {
        "data": post
    }
```

---

### CRUD application

-   Concepts covered:
    -   What they are
    -   Standard conventions when it comes to creating an API for a CRUD
        based application.

![CRUD](https://i.imgur.com/tUAuhqM.jpg)

CRUD - It is an acronym that represents the 4 main functions of an
application:

-   Create
-   Read
-   Update
-   Delete

-   ##### Difference between a PUT and a PATCH request

-   PUT - All fields have to be sent to the API
-   PATCH - Just the specific field(s)

-   ##### Path Parameter

-   Arguments that are passed in path operations.
-   Example: in `/post/{id}`, `{id}` is a path parameter.

-   #### Important Points

-   It is always recommended to check the type of data before passing
    to the function to fetch or add stuff.
-   Make sure to give proper response codes while perfoming the operations:
    -   201 - Create
    -   404 - Not found
    -   401 - Empty

---

### A simple CRUD using arrays

```py
# https://fastapi.tiangolo.com/tutorial/first-steps/

from fastapi import FastAPI, status, HTTPException, Response
from pydantic import BaseModel
from typing import Optional
from random import randrange


class Post(BaseModel):
    """
    A pydantic model that does the part of data
    validation.

    It is because of this we can ensure that whatever
    data is sent by the frontend is in compliance
    with the backend.
    """
    title: str
    content: str
    published: bool = True
    rating: Optional[int] = None


my_posts = [
    {
        "title": "title of post 1",
        "content": "content of post 1",
        "id": 1
    },
    {
        "title": "favorite foods",
        "content": "I like pizza",
        "id": 2
    }
]


def find_post(id):
    for post in my_posts:
        if post['id'] == id:
            return post


def find_index_post(id):
    for index, post in enumerate(my_posts):
        if post['id'] == id:
            return index


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get('/posts')
def get_posts():
    return {
        "data": my_posts
    }


@app.post('/post/create', status_code=status.HTTP_201_CREATED)
def create_post(post: Post):
    post_dict = post.dict()
    post_dict['id'] = randrange(0, 10000000)
    my_posts.append(post_dict)
    return {"data": post_dict}


# {id} is a path parameter
@app.get('/post/{id}')
def get_post(id: int):
    post = find_post(id)
    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} not found!")
    return {
        "post_detail": post
    }


@app.delete('/post/delete/{id}', status_code=status.HTTP_204_NO_CONTENT)
def delete_post(id: int):
    # find the index in the array that has the required id
    # my_posts.pop(index)
    index = find_index_post(id)
    if index is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} does not exist!")

    my_posts.pop(index)
    return Response(status_code=status.HTTP_204_NO_CONTENT)


# make sure to add some body in the postman to check it.
@app.put('/post/update/{id}')
def update_post(id: int, post: Post):
    index = find_index_post(id)

    if index is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} does not exist!")

    post_dict = post.dict()  # take all data from frotend
    post_dict['id'] = id   # add the id
    my_posts[index] = post_dict  # updating the post in the array using index

    return {
        'data': post_dict
    }
```

---

### Folder Restructring

The project folder has been restructured to look like this.

```nim
├── app/
│    ├─  __init__.py
│    └── main.py
├── env/
├── .gitignore
└── README.md
```

So, to execute the code from the project root, we do this:

```
uvicorn app.main:app --reload
```

---

### What is a Database?

Database is a collection of organized data that can be easily accessed
and managed.

---

### DBMS

-   We don't work or interact with the databases directly.
-   Instead, we make use of a software referred to as a
    Database Management System (DBMS).
-   DBMS provides an interface to perform various operations like
    database creation, storing data in it, updating data, creating
    a table in the database and a lot more.

![DBMS](https://i.imgur.com/v1vfzR8.png)

#### Popular DBMS

-   ##### Relational DBMS

    -   MySQL
    -   PostgreSQL
    -   Oracle
    -   SQL Server

-   ##### NoSQL
    -   MongoDB
    -   DynamoDB
    -   Cassandra
    -   Apache HBase

#### Relational Database & SQL

-   A relational database organizes data into tables which can be
    linked—or related—based on data common to each.
-   This capability enables you to retrieve an entirely new table
    from data in one or more tables with a single SQL query.
-   You can communicate with relational databases using Structured Query
    Language (SQL), the standard language for interacting with management
    systems.
-   SQL allows the joining of tables using a few lines of code.

![SQL](https://i.imgur.com/NA6tAnt.png)

#### Posrgres

-   When you install an instance of Postgres, what we can actually do is, we
    can carve out multiple separate databases.
-   This is kind of confusing at first because we think if we install
    Postgres, we have a database.
-   Yes. But what we can do is we can create 2 different databases that are
    completely isolated and have nothing to do with one another.
-   In that way, if I have an application 1, I can have a database just for
    App1 and If I have a second application, this can application can have
    a separate database as well.
-   There might be some cases where you might need to have 2 databases for an
    application. But those are specific cases. In this course, we will be just
    using one database for the application.

![Pg](https://i.imgur.com/r4IsHY4.png)

-   By default, every Postgres installation comes with one database already
    created called `postgres`.
-   This is important because Postgres requires you to specify the name of a
    database to make a connection.
-   So, there needs to always be one database.
-   Usually Postgres runs on port `5432`.

#### Tables

-   A table represents a subject or event in an application.
-   Example: In an e-commerce application you will be having a table for
    users, products and purchases; plus they would be having a relationship
    that links them. Like, A user will be purchasing a product.

![tables](https://i.imgur.com/fjVBzVM.png)

#### Columns and Rows

-   A table is made up columns and rows.
-   Each column represents a different attribute.
-   Each row represents represents a different entry in the table.

![columns and rows](https://i.imgur.com/5KyueWH.png)

#### Postgres Datatypes

-   Databases have datatypes just like any programming language.

![Datatypes](https://i.imgur.com/ENrzmUD.png)

#### Primary Key

-   It is a column or a group of columns that uniquely identifies each row
    in a table.
-   A table can have one and only one primary key.

![Primary Key](https://i.imgur.com/vUQlKsL.png)

-   A primary key does not have to be the ID column always.
-   It is upto you to decide which column uniquey defines each record.
-   In this example, since an email only be registered once, the email
    column can also be used as the primary key.

![Primary Key](https://i.imgur.com/7Dyz9ZT.png)

#### UNIQUE Constraints

-   A UNIQUE constraint can be applied to any column to make sure every
    record has a unique value for that column.

![Unique](https://i.imgur.com/xEtFqkg.png)

#### NULL Constraints

-   By default, when adding a new entry to a database, any column can be
    left blank.
-   When a column is left blank, it has a `NULL` value.
-   If you need column to be properly filled in to create a new record, a
    `NOT NULL` constraint can be added to the column to ensure that the
    column is never left blank

![NULL](https://i.imgur.com/u3aK4RP.png)

---

### SQL Stuff

-   Number -> integer
-   Primary key with auto increment -> serial
-   Created a table `products` with lots of values and some fields.
-   Semicolon must be there end of each query.
-   `*` means all columns.
-   Capitalization doesn't matter. But, for built in SQL commands,
    lower case is also fine but it is better to capitalize it.
    For stuff like the table name, column name it is better to
    write it in the lowercase everywhere.

-   #### SELECT

    -   To fetch all the records with all the columns from a table:

        ##### Syntax:

        ```sql
        SELECT * FROM <table-name>;
        ```

        ##### Example:

        ```sql
        SELECT * FROM products;
        ```

    -   Renaming the column

        ```sql
        SELECT id AS products_id FROM products;
        ```

    -   Adding Filters [`WHERE` Query]

        ```sql
        SELECT * FROM products WHERE id = 10;
        ```

-   For strings add quotes.

-   #### Comparison operators

    -   Fetching the records that have price greater than 50.

        ```sql
        SELECT * FROM products WHERE price > 50;
        ```

    -   Fetching the records that have some value in the inventory.

        ```sql
        SELECT * FROM products WHERE inventory != 0;
        ```

        or

        ```sql
        SELECT * FROM products WHERE inventory <> 0;
        ```

    -   `<>` can also be used as not equal to operator.

-   #### IN Operator

    ```sql
    SELECT * FROM products WHERE id IN (1, 2, 3);
    ```

-   Fetching matching substrings
    ```sql
    SELECT * FROM products WHERE name LIKE 'TV%';
    ```
-   The `%` can be used in various ways. `%word`, `%word%`, `word%`

-   Sorting out the records

    ```sql
    SELECT * FROM products ORDER BY price DESC;
    ```

    > By default the sorting order is Ascending.
    > `ASC` can be used to specify though.

    ```sql
    SELECT * FROM products ORDER BY inventory DESC, price;
    ```

-   Fetching recent products

    ```sql
    SELECT * FROM products ORDER BY created_at DESC;
    ```

-   Limiting the records

    ```sql
    SELECT * FROM products LIMIT 10;
    ```

-   Skipping some rows.

    ```sql
    SELECT * FROM products ORDER BY id LIMIT 5 OFFSET 2;
    ```

-   #### INSERT Query

    -   Inserting One Record

    ```sql
    INSERT INTO products (name, price, inventory)
    VALUES ('Tortilla', 4, 100);
    ```

    -   Inserting multipe records

    ```sql
    INSERT INTO products (name, price, inventory)
    VALUES ('Tortilla', 4, 100), ('Toys', 50, 200);
    ```

-   Deleting entries from the database

    ```sql
    DELETE FROM products WHERE id='25';
    ```

-   Updating records
    ```sql
    UPDATE products set name = 'Flour Tortilla', price = 40
    WHERE id = 4;
    ```

---

### Social Media application API Creation begins.

-   Creating a table for the social media application using `pgAdmin`
-   Table Name: `posts`
-   Fields:

    -   `id`: serial, primary key, not null
    -   `title`: character varying, not null
    -   `content`: character varying, not null
    -   `published`: boolean, not null, default: `True`
    -   `created_at`: timestamp with timezone, not null, default: `NOW()`

-   Python module to be used for postgres stuff: `psycopg2`
-   Funny thing is it does not give you the column name while you are
    fetching the values. So, for that we can do this:

    ```py
    # In the top of the file
    from psycopg2 import RealDictCursor
    # ...
    # ...
    # ...
    try:
        conn = psycopg2.connect(
            host='localhost',
            databse='fastapi',
            user='postgres',
            password='notGonnaSayIt',
            cursor_factory=RealDictCursor
        )
    except:
        pass
    ```

-   **Implementing the default CRUD part using posrgress**

```py
# main.py file
# https://fastapi.tiangolo.com/tutorial/first-steps/
# How to run the code: uvicorn app.main:app --reload

from fastapi import FastAPI, status, HTTPException, Response
from pydantic import BaseModel
from typing import Optional
from random import randrange
import psycopg2 as pg
from psycopg2.extras import RealDictCursor
import time


class Post(BaseModel):
    """
    A pydantic model that does the part of data
    validation.

    It is because of this we can ensure that whatever
    data is sent by the frontend is in compliance
    with the backend.
    """
    title: str
    content: str
    published: bool = True


# Looping till we get a connection and breaking out of it
# once the connection is established.
while True:
    try:
        conn = pg.connect(
            host='localhost',
            database='fastapi',
            user='postgres',
            password='hahaYouThought',
            cursor_factory=RealDictCursor
        )
        cursor = conn.cursor()
        print("Database connection was successfull!")
        break
    except Exception as error:
        print('Connection to the database failed!')
        print('Error: ', error)
        time.sleep(2)


my_posts = [
    {
        "title": "title of post 1",
        "content": "content of post 1",
        "id": 1
    },
    {
        "title": "favorite foods",
        "content": "I like pizza",
        "id": 2
    }
]


def find_post(id):
    for post in my_posts:
        if post['id'] == id:
            return post


def find_index_post(id):
    for index, post in enumerate(my_posts):
        if post['id'] == id:
            return index


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get('/posts')
def get_posts():
    cursor.execute("""SELECT * FROM posts""")
    posts = cursor.fetchall()
    return {
        "data": posts
    }


@app.post('/post/create', status_code=status.HTTP_201_CREATED)
def create_post(post: Post):
    """
    Inserting a new post into the database
    """
    cursor.execute(
        """INSERT into posts (title, content, published) VALUES (%s, %s, %s) RETURNING * """,
        (post.title, post.content, post.published)
    )
    new_post = cursor.fetchone()
    conn.commit()
    return {"data": new_post}


@app.get('/post/{id}')
def get_post(id: int):
    """
    {id} is a path parameter
    """
    cursor.execute(""" SELECT * FROM posts WHERE id = %s """, (str(id), ))
    # We are
    # - taking an string from the parameter
    # - converting it to int
    # - then again converting it to str
    # We are doing this because we want to valid that the user is giving
    # only integers in the argument and not string like `adfadf`.
    # Plus we are adding a comma after the str(id) because we run into an
    # error later. Don't know the reason for the error yet.
    post = cursor.fetchone()

    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} not found!")
    return {"post_detail": post}


@app.delete('/post/delete/{id}', status_code=status.HTTP_204_NO_CONTENT)
def delete_post(id: int):
    cursor.execute(
        """ DELETE FROM posts WHERE id = %s RETURNING * """,
        (str(id), )
    )
    deleted_post = cursor.fetchone()
    conn.commit()

    if deleted_post is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} does not exist!")

    return Response(status_code=status.HTTP_204_NO_CONTENT)


# make sure to add some body in the postman to check it.
@app.put('/post/update/{id}')
def update_post(id: int, post: Post):

    cursor.execute(
        """UPDATE posts SET title = %s, content = %s, published = %s WHERE id = %s RETURNING * """,
        (post.title, post.content, post.published, str(id))
    )
    updated_post = cursor.fetchone()
    conn.commit()

    if updated_post is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} does not exist!")

    return {
        'data': updated_post
    }
```

---

### Object Relational Mapper (ORM)

We saw how to use the default Postgres driver to talk to a postgres database
by sending SQL commands. ORM is one of the best method for working with
databases. An ORM here is a layer of abstraction that sits between the
database and our FastAPI application. We never talk directly to a database
anymore. Instead we talk to an ORM and the ORM will then talk to our database.

Some of the benefits are that we don't have to work with SQL anymore. So,
what we do is instead of using raw SQL, we use standard Python code calling
various functions and methods that ultimately translate to SQL themselves.

![ORM](https://i.imgur.com/Ro3Bhyo.jpg)

---

### What can ORMs do

-   One of the first things is instead of us going into pgAdmin and creating the
    tables and all the columns ourselves, what we can do is we can define our tables
    as Python models.

-   Queries can be made exclusively through python code. No SQL is necessary.

```py
class Post(Base):
    __tablename__ = 'posts'

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True, nullable=False)
    content = Column(String, nullable=False)
    published = Column(Boolean)
```

Queries can be made using python code.

```py
db.query(models.Post).filter(models.Post.id == id).first()
```

---

### SQLAlchemy

-   SQLAlchemy is one of the most popular python ORMs.
-   It is a standalone library has no association with FastAPI.
-   It can be used with any other python web frameworks or any python based
    application
-   You can install SQLAlchemy through pip in your virtual environment

```
pip install sqlalchemy
```

When sqlachemy sees the `models.Base.metadata.create_all(bind=engine)` in
`main.py`, it will go the `models.py`. From the `models.py` it will check if
the tables exist. If the table(s) does not exist, it creates the table.
But, if the table already exists, then it wont create a table. So, even though
you make changes in your models file, it won't get reflected.
SQLAlchemy is not meant for handling database migrations / handling changes to
it. That is why we don't see it automatically making the changes.
So, we are going to use `Alembic`.

### Folder Structure

The project folder will look something like this.

```nim
├── app/
│    ├─  __init__.py
│    ├─  database.py
│    ├─  main.py
│    └── models.py
├── env/
├── .gitignore
└── README.md
```

Lets setup sqlachemy in the existing code.

#### database.py

```py
# Will handle our database connection
# https://fastapi.tiangolo.com/tutorial/sql-databases/
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Connection string. Specifies where is our SQL database located
# Format of a SQL string
# SQLALCHEMY_DATABASE_URL = "postgresql://<username>:password@<ip-address/hostname>/database"
SQLALCHEMY_DATABASE_URL = "postgresql://postgres:SomePassword@localhost/fastapi"

# Engine is responsible for etablishing a connection for
# SQLAlchemy to connect to postgres database.
engine = create_engine(SQLALCHEMY_DATABASE_URL)

# When you talk to a SQL database we need to make use of session
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Models that represent table extend the Base class.
Base = declarative_base()

# Dependency
def get_db():
    # Gets a connection the db
    db = SessionLocal()

    try:
        yield db
    finally:
        db.close()

# Dependency
def get_db():
    # Gets a connection the db
    db = SessionLocal()

    try:
        yield db
    finally:
        db.close()
```

#### models.py

```py
# Every model represents a table in our database.

from .database import Base
from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.sql.expression import text
from sqlalchemy.sql.sqltypes import TIMESTAMP


class Post(Base):
    __tablename__ = "posts"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True, nullable=False)
    content = Column(String, nullable=False)
    published = Column(Boolean, server_default='TRUE', nullable=False)
    created_at = Column(TIMESTAMP(
        timezone=True),
        nullable=False,
        server_default=text('now()')
    )
```

#### main.py

```py
# https://fastapi.tiangolo.com/tutorial/first-steps/
# How to run the code: uvicorn app.main:app --reload

from . import models
from .database import engine, get_db

from random import randrange
import time

from fastapi import FastAPI, status, HTTPException, Response, Depends
from pydantic import BaseModel
from typing import Optional
import psycopg2 as pg
from psycopg2.extras import RealDictCursor
from sqlalchemy.orm import Session

models.Base.metadata.create_all(bind=engine)

app = FastAPI()


class Post(BaseModel):
    """
    A pydantic model that does the part of data
    validation.

    It is because of this we can ensure that whatever
    data is sent by the frontend is in compliance
    with the backend.
    """
    title: str
    content: str
    published: bool = True


# Looping till we get a connection and breaking out of it
# once the connection is established.
while True:
    try:
        conn = pg.connect(
            host='localhost',
            database='py_api',
            user='postgres',
            password='',
            cursor_factory=RealDictCursor
        )
        cursor = conn.cursor()
        print("Database connection was successfull!")
        break
    except Exception as error:
        print('Connection to the database failed!')
        print('Error: ', error)
        time.sleep(2)


my_posts = [
    {
        "title": "title of post 1",
        "content": "content of post 1",
        "id": 1
    },
    {
        "title": "favorite foods",
        "content": "I like pizza",
        "id": 2
    }
]


def find_post(id):
    for post in my_posts:
        if post['id'] == id:
            return post


def find_index_post(id):
    for index, post in enumerate(my_posts):
        if post['id'] == id:
            return index


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get('/sqlachemy')
def test_post(db: Session = Depends(get_db)):
    return {"status": "success"}


@app.get('/posts')
def get_posts():
    cursor.execute("""SELECT * FROM posts""")
    posts = cursor.fetchall()
    return {
        "data": posts
    }


@app.post('/post/create', status_code=status.HTTP_201_CREATED)
def create_post(post: Post):
    """
    Inserting a new post into the database
    """
    cursor.execute(
        """INSERT into posts (title, content, published) VALUES (%s, %s, %s) RETURNING * """,
        (post.title, post.content, post.published)
    )
    new_post = cursor.fetchone()
    conn.commit()
    return {"data": new_post}


@app.get('/post/{id}')
def get_post(id: int):
    """
    {id} is a path parameter
    """
    cursor.execute(""" SELECT * FROM posts WHERE id = %s """, (str(id), ))
    # We are
    # - taking an string from the parameter
    # - converting it to int
    # - then again converting it to str
    # We are doing this because we want to valid that the user is giving
    # only integers in the argument and not string like `adfadf`.
    # Plus we are adding a comma after the str(id) because we run into an
    # error later. Don't know the reason for the error yet.
    post = cursor.fetchone()

    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} not found!")
    return {"post_detail": post}


@app.delete('/post/delete/{id}', status_code=status.HTTP_204_NO_CONTENT)
def delete_post(id: int):
    cursor.execute(
        """ DELETE FROM posts WHERE id = %s RETURNING * """,
        (str(id), )
    )
    deleted_post = cursor.fetchone()
    conn.commit()

    if deleted_post is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} does not exist!")

    return Response(status_code=status.HTTP_204_NO_CONTENT)


# make sure to add some body in the postman to check it.
@app.put('/post/update/{id}')
def update_post(id: int, post: Post):

    cursor.execute(
        """UPDATE posts SET title = %s, content = %s, published = %s WHERE id = %s RETURNING * """,
        (post.title, post.content, post.published, str(id))
    )
    updated_post = cursor.fetchone()
    conn.commit()

    if updated_post is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} does not exist!")

    return {
        'data': updated_post
    }
```

---

### SQLAlchemy or ORM implementation of the API

#### main.py

```py
# https://fastapi.tiangolo.com/tutorial/first-steps/
# How to run the code: uvicorn app.main:app --reload

from . import models
from .database import engine, get_db

from random import randrange
import time

from fastapi import FastAPI, status, HTTPException, Response, Depends
from pydantic import BaseModel
from typing import Optional
import psycopg2 as pg
from psycopg2.extras import RealDictCursor
from sqlalchemy.orm import Session

models.Base.metadata.create_all(bind=engine)

app = FastAPI()


class Post(BaseModel):
    """
    A pydantic model that does the part of data
    validation.

    It is because of this we can ensure that whatever
    data is sent by the frontend is in compliance
    with the backend.
    """
    title: str
    content: str
    published: bool = True


# Looping till we get a connection and breaking out of it
# once the connection is established.
while True:
    try:
        conn = pg.connect(
            host='localhost',
            database='py_api',
            user='postgres',
            password='',
            cursor_factory=RealDictCursor
        )
        cursor = conn.cursor()
        print("Database connection was successfull!")
        break
    except Exception as error:
        print('Connection to the database failed!')
        print('Error: ', error)
        time.sleep(2)


my_posts = [
    {
        "title": "title of post 1",
        "content": "content of post 1",
        "id": 1
    },
    {
        "title": "favorite foods",
        "content": "I like pizza",
        "id": 2
    }
]


def find_post(id):
    for post in my_posts:
        if post['id'] == id:
            return post


def find_index_post(id):
    for index, post in enumerate(my_posts):
        if post['id'] == id:
            return index


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get('/sqlalchemy')
def test_posts(db: Session = Depends(get_db)):
    posts = db.query(models.Post).all()
    return {"status": posts}


@app.get('/posts')
def get_posts(db: Session = Depends(get_db)):
    # cursor.execute("""SELECT * FROM posts""")
    # posts = cursor.fetchall()
    posts = db.query(models.Post).all()
    return {
        "data": posts
    }


@app.post('/post/create', status_code=status.HTTP_201_CREATED)
def create_post(post: Post, db: Session = Depends(get_db)):
    """
    Inserting a new post into the database
    """
    # cursor.execute(
    #     """INSERT into posts (title, content, published) VALUES (%s, %s, %s) RETURNING * """,
    #     (post.title, post.content, post.published)
    # )
    # new_post = cursor.fetchone()
    # conn.commit()
    new_post = models.Post(
        **post.dict()
    )
    # ** unpacks the dictionary into this format:
    # title=post.title, content=post.content, ...
    # This prevents us from specifiying individual fields

    db.add(new_post)
    db.commit()
    db.refresh(new_post)

    return {"data": new_post}


@app.get('/post/{id}')
def get_post(id: int, db: Session = Depends(get_db)):
    """
    {id} is a path parameter
    """
    # cursor.execute(""" SELECT * FROM posts WHERE id = %s """, (str(id), ))
    # We are
    # - taking an string from the parameter
    # - converting it to int
    # - then again converting it to str
    # We are doing this because we want to valid that the user is giving
    # only integers in the argument and not string like `adfadf`.
    # Plus we are adding a comma after the str(id) because we run into an
    # error later. Don't know the reason for the error yet.
    # post = cursor.fetchone()

    post = db.query(models.Post).filter(models.Post.id == id).first()

    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} not found!")
    return {"post_detail": post}


@app.delete('/post/delete/{id}', status_code=status.HTTP_204_NO_CONTENT)
def delete_post(id: int, db: Session = Depends(get_db)):
    # cursor.execute(
    #     """ DELETE FROM posts WHERE id = %s RETURNING * """,
    #     (str(id), )
    # )
    # deleted_post = cursor.fetchone()
    # conn.commit()

    post = db.query(models.Post).filter(models.Post.id == id)

    if post.first() is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} does not exist!")

    post.delete(synchronize_session=False)
    db.commit()

    return Response(status_code=status.HTTP_204_NO_CONTENT)


# make sure to add some body in the postman to check it.
@app.put('/post/update/{id}')
def update_post(id: int, updated_post: Post, db: Session = Depends(get_db)):

    # cursor.execute(
    #     """UPDATE posts SET title = %s, content = %s, published = %s WHERE id = %s RETURNING * """,
    #     (post.title, post.content, post.published, str(id))
    # )
    # updated_post = cursor.fetchone()
    # conn.commit()

    post_query = db.query(models.Post).filter(models.Post.id == id)
    post = post_query.first()

    if post is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=f"Post with id: {id} does not exist!")

    post_query.update(updated_post.dict(), synchronize_session=False)
    db.commit()

    # Sending the updated post back to the user
    return {
        'data': post_query.first()
    }
```

---

### Schema Models

-   Schema/Pydantic models define the structure of a request and response.
-   This ensure that when a user wants to create a post, the request will
    only go through if it has a "title" and "content" in the body.

![Schema Models](https://i.imgur.com/obaeove.png)

---

### SQLAlchemy Models

-   Responsible for defining the columns of our `posts` table within postgres.
-   Is used to query, create, delete and update entries within the database.

![SQLAlchemy Models](https://i.imgur.com/5dIH60a.png)

---

### Folder Restructure

The project folder will look something like this.

```nim
├── app/
│    ├─  __init__.py
│    ├─  database.py
│    ├─  main.py
│    ├─  models.py
│    └── schema.py
├── env/
├── .gitignore
└── README.md
```

-   The `Post` pydantic class present in `main.py` is moved to `schemas.py`
    and the appropriate import statements are added and changed in `main.py`
    and `schemas.py`

---

---

JWT Token Authentication

In this section we are gonna start tackling one of the most important topics when it comes to building out an API or any application and that is authentication. Now, when you are working on authentication on an API or any application, there is really 2 main ways to tackle authentication.

- Session Based Authentication (SBA)
- JWT

The idea behind SBA is that we store something on our backend server or API in this case to track whether a user is logged in. So, there is some piece of information, whether we store it in the database, whether we store in the memory that is going to keep track of if the user has logged in and when the user logs out.

That is one way of doing things.
The other way of doing things is using JWT token based authentication.
The idea behind JWT token based authentication is that it is stateless.
What it means by that is there is nothing on the backend, nothing on the API, nothing on our database that actually keeps track or stores some sort of information about whether a user is logged in our logged out.

You'll probally be thinking how do we know that they are logged in? Well, that's the power of JWT tokens. The token itself, which we don't store in our database or store in our API is stored on the Frontend on our client's, actually keeps track of whether a user is logged in or not.
