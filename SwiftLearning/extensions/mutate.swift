// Mutating Instance Methods

extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
print("\(someInt)")

someInt.square()
print("\(someInt)")

// someInt is now 9
