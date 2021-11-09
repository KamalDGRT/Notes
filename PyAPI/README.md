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
    appliction. But those are specific cases. In this course, we will be just
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
