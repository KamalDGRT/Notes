
var x : Int = -10
var y = abs(x)
print("Abs of \(x) is \(y).")

debugPrint("One two three four five")
// Prints "One two three four five"
 
debugPrint(1...5)
// Prints "ClosedRange(1...5)"
 
debugPrint(1.0, 2.0, 3.0, 4.0, 5.0)
// Prints "1.0 2.0 3.0 4.0 5.0"

debugPrint(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ")
// Prints "1.0 ... 2.0 ... 3.0 ... 4.0 ... 5.0"

for n in 1...5 {
    debugPrint(n, terminator: "")
}
// Prints "12345"

var range = "My range: "
debugPrint(1...5, to: &range)

