# React JS Notes

Started learning on 19th December 2021 from
[this](https://www.youtube.com/watch?v=4UZrsTqkcW4).

### Introduction

-   React is a JavaScript library for building user interfaces.
-   Developed by Facebook in 2011
-   Some of React's competitors: Angular, Vue, Svelte
-   React is all about components.
-   Components are independent chunks of user interface.
-   Components can be as small as one HTML element.
-   The benefit of the components is that you can bunch of independent,
    isolated and most importantly reusable user-interfaces.
-   In the app, you can have as many components as you want.
-   All apps will have at least one component - `Root` component.

### Goals

-   Comfortable with React
-   Applying theory
-   Build your projects

### Course Structure

-   Dev Environment
-   Tutorial
-   Projects
-   Redux

### Requirements

-   HTML
-   CSS
-   JavaScript `[ES6]`
-   Coding Addict - Javascript Nuggets

### Dev Environment

-   NodeJS
-   `node --version`, minimum 5.2.0 npx
-   Browser = Chrome
-   Text Editor = Visual Studio Code
-   React Developer Tools

### Basic Terminal Commands

-   `pwd` - Present Working Directory
-   `ls` - List of files present in a directory
-   `mkdir` - Creates a directory
-   `cd` - Change directory
-   `cd ..` - Navigate one level up
-   `clear` - Clears out the console
-   `Arrow UP/Down` - Previous commands

### NPM

-   `npm init` - creates `package.json` (manifest) file which has a list of
    dependencies
-   `npm install <pacakgename> --save` - Install pacakge locally and add to
    `package.json`
-   `npm install <pacakgename> -g` - Install package globally and access it
    anywhere.
-   `npm install <pacakgename> --save-dev` - Use it only in development
    environment

### Create React App

-   Technically, you don't need to use `create-react-app` to work with React.
-   You can build the whole setup yourself.
-   In the long run, `create-react-app` will save a bunch of time.
-   Under the hood, `create-react-app` uses `babel` and `webpack`.
-   A `babel` is a JS transpiler that converts the newest JS into the good old
    JS.
-   It will kind of ensure that our app runs on older browsers as well.
-   Webpack does a lot of other things as well.
-   Essentially, webpack works as a module bundler.
-   The main features of webpack would be bundling resources, watching for
    changes and running babel transpiler.
-   To create a new React app, use `npx create-react-app <appname>`

### Folder Structure

-   `node_modules` - contains all the dependencies needed for the project
-   `public` - contains the files that will be rendered on the browser
-   `src` - contains the `App.js` and other components?

### Setting up the 1st component

-   Removed the default boiler plate stuff from `src`
-   Creating an empty `index.js`.
-   Component names should be capitalized.
-   In the `index.js`, I will add the following content.

```js
import React from "react";
import ReactDom from "react-dom";

function Greeting() {
    return <h4>This is Kamal and this is my first component</h4>;
}

ReactDom.render(<Greeting />, document.getElementById("root"));
```

-   All components must be closed. For example, Either like`<Greeting/>` or
    like this `<Greeting></Greeting>`.
-   Stateless functional components will always JSX

### JSX Rules

-   Return single element
-   div / section / article / fragment
-   fragment looks like this: `<> ... </>`, `...` represent content.
-   use camelCase for html attribute
-   `className` instead of `class`
-   close every element
-   formatting

### Note:

-   You can have only one default export per file.

---

### Advanced React

-   useState
-   useEffect
-   Conditional Rendering
-   Forms
-   useRef
-   useReducer
-   Prop Drilling
-   Context API / useContex

---

### useState

-   hooks will start with `use`
-   components that will be used in these hooks must start with a
    capital letter and should be in capital case.
-   Hooks can be called only inside of the body of a function component.
-   You cannot call the hook conditionally. (i.e. based on some condition)
