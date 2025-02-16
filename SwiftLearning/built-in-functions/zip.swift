let words = ["one", "two", "three", "four"]
let numbers = 1...4
 
for (word, number) in zip(words, numbers) {
    print("\(word): \(number)")
}
// Prints "one: 1"
// Prints "two: 2
// Prints "three: 3"
// Prints "four: 4"


// if there are uneven lengths, then the resulting zip will be of the shorter length
let naturalNumbers = 1...Int.max
let zipped = Array(zip(words, naturalNumbers))
// zipped == [("one", 1), ("two", 2), ("three", 3), ("four", 4)]
print(zipped)
