/**

The @autoclosure attribute can be applied to a closure parameter for a function,
and automatically creates a closure from an expression you pass in.
When you call a function that uses this attribute,
the code you write isn't a closure, but it becomes a closure
*/
func printTest1(_ result: () -> Void) {
    print("Before")
    result()
    print("After")
}

printTest1({ print("Hello") })


//----------------------------
print("------------------------------------------")



// Turning an argument into a closure allows us to delay the actual request of the argument.

func printTest2(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}

printTest2(print("Hello"))



/*
These two pieces of code produce identical results thanks to @autoclosure.
In the second code example, the print("Hello") won't be executed immediately
because it gets wrapped inside a closure for execution later.
*/


/*
The @autoclosure attribute is used inside Swift wherever code needs
to be passed in and executed only if conditions are right.
*/

