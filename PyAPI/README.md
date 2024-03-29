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

![ORM](https://i.imgur.com/Ca8QBth.jpg)

---

### What can ORMs do

-   One of the first things is instead of us going into pgAdmin and creating
    the tables and all the columns ourselves, what we can do is we can define
    our tables as Python models.

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

### JWT Token Authentication

In this section we are gonna start tackling one of the most important topics
when it comes to building out an API or any application and that is
authentication. Now, when you are working on authentication on an API or any
application, there is really 2 main ways to tackle authentication.

-   Session Based Authentication (SBA)
-   JWT

The idea behind SBA is that we store something on our backend server or API in
this case to track whether a user is logged in. So, there is some piece of
information, whether we store it in the database, whether we store in the
memory that is going to keep track of if the user has logged in and when the
user logs out.

That is one way of doing things.
The other way of doing things is using JWT token based authentication.
The idea behind JWT token based authentication is that it is stateless.
What it means by that is there is nothing on the backend, nothing on the API,
nothing on our database that actually keeps track or stores some sort of
information about whether a user is logged in our logged out.

You'll probally be thinking how do we know that they are logged in? Well,
that's the power of JWT tokens. The token itself, which we don't store in our
database or store in our API is stored on the Frontend on our client's,
actually keeps track of whether a user is logged in or not.

#### Flow involved in JWT

So, lets take a look at the flow for how a user logs in, how a user is
authenticated and then how a accesses a specific path operation resource or
endpoint by using the JWT token to ensure that the API knows that we are logged
in, so that we can provide the user some information.

![Flow JWT](https://i.imgur.com/t6TwP6G.jpg)

-   So, what's gonna happen is that the client or the frontend, whoever
    it is, they are going to try and login.
-   What we are going to do is, we are gonna utlimately create a path
    operation called `/login` and the client is going to pass the
    `username` and the `password`. The credentials could be anything.
-   It need not be `username`, it could be `email` and the password
    could also be anything.
-   In our application, it is going to be `email` and `password` because
    we don't have usernames in the table. We mostly just have emails.

-   After we get their credentials, what we are gonna do is, first of all,
    we are going to verify if the credentials are valid.
-   If the credentials are correct, if the `username` and `password` match
    with the account, we are going to create a JWT token.
-   More on the JWT token later.
-   A sample JWT token

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJpc3MiOiJ0b3B0YWwuY29tIiwiZXhwIjox.
yRQYnWzskCZUxPwaQupWkiUzKELZ49QK_ZXw
```

-   You probably think like it looks like a bunch of gibberish and for the most
    part it is.
-   So, moving forward, I want you think of this as nothing but a string.
-   The client doesn't know what it is. It doesn't cares. All it knows that
    it is a string. Only the API cares what's actually in the token and what
    it means.

-   We will send a response back with the token.
-   Now the client has the token and he can start acessing resources that
    require authentication.
-   So, any time he wants to, like for example, lets say a user has to be
    logged in to retrieve posts, what he will do is he will send a request to
    the `/posts` endpoint, but he also provides the token in the header of the
    request.
-   The header is usually in the payload of the request.

-   So, he sends that and now what the API (FastAPI) is going to do is, first
    of all, it is going to verify the token is valid.
-   There is a couple of different steps needed to verify if a token is valid
    and we are going to cover it in the next slide, but just know that, the API
    just checks "Hey, is this a valid token?" and if it is well it just sends
    back the data.
-   It is just that simple.
-   You provide your credentials, you get it tokened, and then anytime you
    want to access anything that requires you to be logged in, you just send
    the token in the header and that is it.
-   Hopefully, this wasn't confusing and hopefully you guys see the simplicity
    in this solution. The API doesn't actually track anything. There is no
    information stored on the API, instead the client just holds on to the
    token and he provides it to us, and if the token is valid, we just send
    back the required data.

#### JWT Tokens

Let's break down what exactly a JWT token is and what are the components that
make up a token with the below example.

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJpc3MiOiJ0b3B0YWwuY29tIiwiZXhwIjox.
yRQYnWzskCZUxPwaQupWkiUzKELZ49QK_ZXw
```

> \*_Note_ This is just a sample token. The encrypted text may or may not match
> the actual data.

-   The JWT token looks encrypted but it is not.
-   The token is made up of 3 individual pieces.

-   ##### Header: Algorithm & Token Type

```json
{
    "alg": "H256",
    "typ": "JWT"
}
```

-   The header includes metadata about the token.
-   We are actually going to sign this token.
-   It is kind of like hashing the token.
-   We have to specify the algorithm that we are gonna use and in this case
    the default is `H256` and the type is set to `JWT` which indicates that
    it is a JWT Token.
-   So, the metadata is goinng to be the same for all our tokens.

-   ##### Payload: Data

```json
{
    "sub": "123456",
    "name": "John Doe",
    "iat": "151623232"
}
```

-   The payload of a token is ultimately upto you.
-   You can send absolutely no payload.
-   You can send any piece of information that you wanna send within the
    payload.
-   You can include anything that you want.
-   However, you wanna be careful with what you put in the payload because it
    is important to understand that the token itself is not encrypted.
-   So, that means anybody in the outside world can take a look at the token
    and they can see what's in the payload.
-   So, you don't wanna put any confidential information like passwords,
    secrets, or any like that.
-   Instead you wanna stick to some very basic things like `id` of the user.
-   So, when I log in, normally our API is going to create a token and then
    embed my user `id` into the token.
-   So, when I try to get all of my posts, the API will be able to take
    a look at the token, verify it is correct, extract from the payload and automatically know the id the user that requested this.
-   We can include other things like the user's role (`admin`, `superuser`
    `normal user`, etc.).
-   We can technically include any information.
-   One thing to keep in mind is that any time we need to access anything
    authenticated, we need to include this token.
-   So, if we jam a lot of information in there, it is going to increase the
    size of our packet. That is going to be a waste of some bandwidth. So, you
    don't wanna jam too much information, just a couple of small things here
    and there.

-   ##### Verify Signature

```js
HMACSHA256(
    base64UrlEncode(header) + "." + base64UrlEncode(payload),
    your - 256 - bit - secret
);
```

> Secret base64 encoded

-   A signature is a combination of 3 things.
-   We got the header that is already in the token.
-   We take the payload that is already in the token.
-   Then, we add our secret.
-   So, there is a special password that we are going to keep on our API.
-   This is only in our API.
-   The clients will not know it.
-   No one else would know it and it is probably the most important thing
    to our whole authentication system.
-   So, you don't want the secret to get out.
-   But we take those 3 things and pass it to the signing algorithm which
    is h256 and it is going to return a signature.
-   This signature is important because we are going to use this to determine
    if this token is valid 'cause we don't want anyone else tampering with our
    token; we don't want them changing the data.
-   I don't want some user to login and change some numbers in the token to
    imitate a different user and access information.
-   Signature is just there for data integrity.

---

### Purpose of Signature

Let's deep dive into why need a signature within the token.

![Purpose of Signature](https://i.imgur.com/fmwzyXC.jpg)

Content for the same can be viewed [here](https://youtu.be/0sOvCWFmrtA?t=24105).

---

### Logging In User

![Logging In User](https://i.imgur.com/3Prx7wx.jpg)

Content can be found [here](https://youtu.be/0sOvCWFmrtA?t=24423);

---

### Stuff done in between

-   Implemented logging in feature in the API
-   Created some variable `{{JWT}}` for easier usage

#### Steps to create the `{{JWT}}` variable in Postman

-   Login Endpoint -> `Tests` -> add this code:

```
pm.environment.set("JWT", pm.response.json().access_token);
```

-   After that, in the other end points
-   `Authorization` -> `Authorization Type` -> `Bearer Token`
-   In the Token Field, pass in the environment variable ``{{JWT}}``

-   Installed `python-jose[cryptography]` pip package
-   Used bcrypt to hash the passwords and use it in login
-   Created `oauth2.py` for storing the jwt authentication
-   Allowed only logged in users to fetch posts and do stuff
-   Restricted the owner of the post to update and delete post
-   Learnt how to create a foreign key using `pgAdmin`
-   Used Python to create a foreign key in the database
-   Implemented arguments passing in the URL (Query Parameters)
-   Stored secrets and stuff in a `.env` file
-   Used `BaseSettings` class from `pydantic` to fetch env variables.

-   #### Votes/Likes/ System Requirements

    -   Users should be able to like a post
    -   Should only be able to like a post once
    -   Retrieving posts should also fetch the total number of likes

-   #### Vote Model

    -   Column referencing post id
    -   Column referencing id of user who liked the post
    -   A user should only be able to like a post once so that means we need
        to ensure every post_id/voter_id is a unique combination
    -   ![vote model](https://i.imgur.com/8bcoYO1.png)

-   #### Composite Keys

    -   Primary Key that spanss multiple columns
    -   Since Primary Keys must be unique, this will ensure that no user can
        like a post twice
    -   ![Composite Keys](https://i.imgur.com/Otk42mX.png)

-   #### Vote Route

    -   Path will be at `/vote`
    -   The user id will be extracted from the JWT token
    -   The body will contain the id of the post the user is voting on as
        well as the direction of the vote.

        ```json
        {
            "post_id": 1432,
            "vote_dir": 0
        }
        ```

    -   A vote direction of 1 means we want to add a vote, a vote of
        direction of 0 means we want to delete a vote.

-   Implemented voting logic in the API
-   Learnt how to implement joins in postgres using raw SQL
-   ```sql
    SELECT posts.*, COUNT(votes.post_id) AS votes
    FROM posts
    LEFT JOIN votes
    ON posts.id = votes.id
    GROUP BY posts.id
    ```
-   Implemented vote count logic for the posts in the API
-   Started with learning `Alembic` - a database migration tool
-   It allows to do incremental changes to the database and keep track of it

---

### Database Migrations

-   Developers can track changes to code and rollback easily with GIT.
    Why can't we do the same for database models/tables?
-   Database migrations allow us to incrementally track changes to the
    database schema and rollback changes to any point in time.
-   We will use a tool called `Alembic` to make changes to our database.
-   Alembic can also automatically pull database models from
    `SQLAlchemy` and generate the proper tables.

-   `pip install alembic`
-   To initialize `alembic`:

    ```
    alembic init <foldername>
    ```

    Example:

    ```
    alembic init alembic
    ```

-   We have to import the `Base` object present in `app/models.py` in
    `alembic/env.py`.
-   When we want to make changes to our database, we need to create a
    `revision`. The revision is what tracks our changes on a step by step
    basis.
-   `alembic revision -m "create posts table"`
-   The above command will create a file. Mention the table stuff that you
    wanna do in that file.

    ```py
    def upgrade():
        op.create_table(
            'posts',
            sa.Column('id', sa.Integer(), nullable=False, primary_key=True),
            sa.Column('title', sa.String(), nullable=False)
        )
        pass


    def downgrade():
        op.drop_table('posts')
        pass
    ```

-   Use `alembic upgrade <revision id>` to make those migrations.
    Eg. `alembic upgrade d9ead45cf617`

-   `alembic current` displays the current migration.
-   `alembic heads` displays the latest revision done
-   Since head has the latest revison id, one can make mirations like this:
    `alembic upgrade head`
-   `alembic downgrade <revision id>` rolls back to that revision.
-   `alembic downgrade -1` rolls back one migration.
-   `alembic downgrade -2` rolls back two migrations.
-   `alembic upgrade +1` upgrades one migration.
-   `alembic upgrade +2` upgrades two migrations.
-   We can also use `alembic` to create tables automatically.
-   `alembic revision --autogenerate -m "auto-gen-votes"` will look at our
    `sqlalchemy` models and modify our database accordingly and make the
    changes.

---

### CORS

-   Cross Origin Resource Sharing (CORS) allows you to make requests
    from a web browser on one domain to a server on a different domain.
-   By default our API will only allow web browsers running onn the same
    domain as our server to make requests to it.
-   More stuff on the same can be found
    [here](https://fastapi.tiangolo.com/tutorial/cors/).
-   Middleware is kind of a function that runs before any request.

### Heroku Deploy

-   Create a Heroku account.
-   Verify the account, Login in the browser.
-   Install Heroku CLI in your system.
-   `heroku login`
-   The above command will open a browser, if not copy paste the link
    and allow you to log in.
-   After logging in, go inside your project folder in the CLI.
-   Then type `heroku create <appname>`. Replace `<appname>` with an unique
    app name.
-   Make sure to commit your changes to GitHub first before pushing your changes.
-   Make sure to have a `Procfile` that mentions the task that needs to be done
    on deploy. In our case, it will be
    `web: uvicorn app.main:app --host=0.0.0.0 --port=${PORT:-5000}`
-   The `Procfile` should also be commited to github.
-   Once that is done to deploy your app, just give
    `git push heroku main`
-   Even though deployed you might face some error for this API app.
-   That is because, we do not have a postgres database instance yet.
-   So, lets create that by running:

    ```
    heroku addons:create heroku-postgresql:hobby-dev
    ```

-   If you go the dashboard of the app in the browser, you can get a whole
    lot of configuration.
-   With that DB configuration, you can setup the `Config Vars`.
-   You can also connect to that postgres instance in your `pgAdmin`.
-   Before that, `heroku apps` lists out the apps that you have in heroku.
-   `heroku apps:info <appname>` where `<appname>` is one of your heroku apps,
    lists out the app information.
-   We should never run `alembic revision` in production.
-   `alembic revision` should be run only in development.
-   In our production we run `alembic upgrade head`.
-   But to run that command in our heroku instance, there is a way.
-   `heroku run <command name>` is the way.
-   In our case it will be `heroku run "alembic upgrade head"`.

---

### Cloud deploy

Since cloud deploy involves payment, I just watched the video but didn't note
down what happens. From what I have seen, it is just like setting up in a
normal Linux distro like mine. He is setting it up in a Ubuntu Cloud VM.

---

### NGINX

-   High performance webserver that can act as a proxy
-   Can handle SSL termination.
-   ![NGINX](https://i.imgur.com/UAwKB7M.png)

---

### Docker

-   Install docker in your system.
-   Make sure that `docker` service is running.
-   Create a `Dockerfile` in the project root.
-   Add the steps needed to run the app.
-   Docker compose is better than docker run.
-   Create `docker-compose.yml`.
-   Use `docker-compose up -d` to run it.
-   Use `docker-compose down` to stop its execution
-   Create a account in docker hub
-   `docker login` to log in into your account
-   `docker image tag <image name> <new image name>`

---

### Testing

-   Installed `pytest`: `pip install pytest`
-   The name of the functions and the testing files matters if you want
    the `pytest` to auto-discover it.
-   More info on the same can be found
    [here](https://docs.pytest.org/en/6.2.x/goodpractices.html).
-   `pytest -v -s` is one better way to run the tests.
-   `-v` increases verbosity whereas `-s` prints any print statement present
    inside the test functions.

---

### CI/CD

-   Currently when it comes to adding a new feature and making changes
    to our code, we have to go through a very manual and cumbersome
    process before we can get those changes pushed out to our
    production environment.
-   So, what I think would be good is to setup a CI/CD pipeline so that
    we can do all of this in an automated fashion.
-   Continuous Integration - automated process to build, package and test
    applications.
-   Continous Delivery - Picks up where continuos integration ends and
    automated the delivery of applications.

---

### Current Manual Process

-   Lets take a look at what our whole manual process looks like right now
    so that we can see where a lot of the extraneous time consumption and
    manual process takes place.

-   ![Manual Process](https://i.imgur.com/KOwQvAH.png)

-   So, our current manual process is that we are gonna make some changes to
    our code and then we are going to commit those changes to git.
-   After that we are gonna go ahead and run `pytest` so that we can verify
    that our changes didn't break any known functionality to our code.
-   If our tests pass, we have an optional step of building an image.
    (Building docker image in dev and prod env)
-   In other languages, we may need to build an application file, but in
    python we don't need that. That is why it is an optinal step here if
    you are not using docker.
-   After we do that, we then move on to deploying our application.
-   The deploy stuff could represent multiple steps because depending on how
    you deploy your application, making any changes or updating the code in
    your production environment could actually invole a very complex process.
-   So, with `heroku`, its obviously a simple process 'cause all we do is
    a `git push` to `heroku` and that is going to automatically cause the
    `heroku` to handle all of the updating of the processes. Thats a feature
    built into heroku but we only get that if we use `heroku`.
-   There is obviously a number of different ways that we can deploy our
    application.
-   If we decide to go the route of deploying our application on an ubuntu
    server, then the deployment process in this case would be us logging in
    to our server, us pulling in the new code with the changes and restarting
    the service so that our application can actually use the new code.
-   But if you are using some other production environment or you use some
    other method to deploy your application, this could be an even more complex
    process; something to keep in mind.
-   So, even though it is just one block in the above image, it could actually
    be a numerous steps.

---

### Automated CI/CD

-   Now lets see how our automated CI/CD pipeline is going to look like after
    we set it up.
-   Just like we did in our manual process, we are gonna make changes to our
    code (obviously that is a manual step because we have to implement the 
    changes to our code) and then we are going to commit those changes.
-   With a CI/CD pipeline or specifically with the one that we are building,
    that is all the manual steps that we have to do. We are done. We don't
    have to touch our keyboard or our mouse. It is basically hands-off at
    this point and we are gonna let automation take over.
-   Usually when you commit changes to your code, that is going to trigger
    our CI/CD pipeline to run.
-   So, what happens is our CI phase starts at this point as soon as we
    commit our changes.

![automatic-CI-CD](https://i.imgur.com/KO8zBGp.png)

-   In the CI phase, the first thing that we do is we pull our source code.
-   We pull our source code so that we can actually work with it.
-   We then install any dependencies. So, this is the equivalent of installing
    all of the dependencies listed in our `requirements.txt` file.
-   We then run our automated tests. So, that is running `pytest`.
-   Assuming the test passes, we then build any images. This is once again an
-   That wraps up our `Continous Integration` phase.
-   Now that is done, the `Continuous Delivery` phase is going to take over.
-   So, what the CD is going to do is it is either going to grab the latest
    code or the new build image depending on what our deployment model
    actually is.
-   With the new image or code it is going to then have all of the logic
    needed to push that new image or the new code into our production and
    make sure that the production is using the brand new code.
-   That is what all `CI/CD` is all about.
-   It is going to be done using the code essentially.

---

### CI/CD Tools

-   Some of the common CI/CD tools include Jenkins, Travis CI, Circle CI and
    github actions.

![CICDTools](https://i.imgur.com/eqqFE0H.png)

-   For our app, we are going to use GitHub Actions just because
    -   it is already integrated into GitHub,
    -   we don't need to install anything on our local machine
    -   there is no software that we have to setup
    -   it is all hosted on GitHub. So, it is like a hosted service
    -   is just gonna make things very clean, very simple
    -   it is free so everyone is gonna have access to it.

---

### What does a CI/CD tool do?

-   All CI/CD Tools are dead simple.
-   They provide a runner - Nothing more than a computer (VM) to run a bunch
    of commands we specify.
-   These commands are either usually configured in a YAML/JSON file or
    through GUI.
-   The different steps/commands we provide makeup all of the actions our
    pipeline will perform.
-   The pipeline will be triggered based off of some event. (`git push/merge`)
