// Exchanges the values of the two arguments.

// The two arguments must not alias each other. To swap two elements of a mutable
// collection, use the swapAt(_:_:) method of that collection instead of this function.

var a = 10
var b = 5
print("Before swapping: a = \(a), b = \(b)")
(a, b) = (b, a)
print("After  swapping: a = \(a), b = \(b)")

print("------------------")

print("Before swapping: a = \(a), b = \(b)")
swap(&a, &b)
print("After  swapping: a = \(a), b = \(b)")
