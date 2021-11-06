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
-   Setup a virtual environment in any folder
-   Install and Configure VS Code
    -   install Python Extension from Microsoft
    -   open the folder created in step 2.
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

