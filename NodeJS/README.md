# NodeJS Notes

Started on 11th December 2021.

---

### What is NodeJS?

-   NodeJS or Node is an open source and cross platform **runtime environment**
    for executing JavaScript code outside of a browser.
-   We often use Node to build backend services like APIs.
-   Node is ideal for building higly-scalable, data-intensive and real time
    apps.
-   Node is not a programming language.
-   NodeJS is asyncrhonous by default.
-   Node is ideal for **I/O-intensive** apps.
-   Do not use Node for **CPU-intesive** apps.
-   Examples of CPU-intesisve: Video-Encoding, Image Manipulation Service.

---

### Why NodeJS?

-   NodeJS allows us to create backend using JavaScript.
-   If you already know JS then for backend you need not learn yet another
    language and all of it intricacies.
-   Node is also superfast and will allow us to create really scalable and
    fast running websites.
-   Companies that use NodeJS: Twitter, Netflix, Trello, Uber
-   Node is great for prototyping and agile development.
-   Since we use JS in frontend and backend, source code will be cleaner and
    more consistent.
-   Largest ecosystem of open-sourced libraries.

---

While importing we use `const` because we do not want to accidentaly change it
to something else like `importVar = 1;`

#### Module Wrapper Function

Lets say `logger.js` had the following content:

```js
var url = "http://mylogger.io/log";

function log(message) {
    // Send an HTTP Request
    console.log(message);
}

module.exports.log = log;
```

and `app.js` has this:

```js
const logger = require("./logger");

logger.log("Message from app!");
```

-   Usually when we import a module, node adds a wrapper function and that
    will look like this:

```js
(function (exports, require, module, __filename, __dirname) {
    var url = "http://mylogger.io/log";

    function log(message) {
        // Send an HTTP Request
        console.log(message);
    }

    module.exports.log = log;
});
```

---

### Video: Oe421EPjeBE - Node.js and Express.js full course

#### Date started: 17th December 2021

#### Topics covered:

-   Fundamentals of Node.js
-   Express.js
-   MongoDB, Mongoose
-   Applications
-   Deployment

-   The main goal of this course is to build modern, fast and scalable
    server-side web applications with node.

### What is NodeJS?

-   Environment to run JS outside of the Browser
-   Created in 2009 and is build on top of Chrome's v8 JS engine
-   Big community
-   Full-Stack

### Pre-requisites

-   Basics of HTML, CSS, JS [ES6]
-   Callbacks, promises, Async-await
-   Youtube - Code Addict
-   Playlist - JS Nuggets

### Course Structure

-   Introduction
-   Installation
-   Node Fundamentals
-   Express Tutorial
-   Building Apps

### Difference between Browser JS & Node JS

| Browser JS       | Node.js          |
| ---------------- | ---------------- |
| DOM              | No DOM           |
| Window           | No Window        |
| Interactive Apps | Server Side Apps |
| No Filesystem    | Filesystem       |
| Fragmentation    | Versions         |
| ES6 modules      | Common JS        |
