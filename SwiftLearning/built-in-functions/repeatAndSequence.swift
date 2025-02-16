let ones = repeatElement(1, count: 5)
for x in ones {
    print(x)
}

// Iterate over all powers of two (ignoring overflow)
// next is a closure that accepts the previous sequence element and returns the next element.
// first: The first element to be returned from the sequence.
for value in sequence(first: 1, next: { $0 * 2 }) {
  // value is 1, then 2, then 4, then 8, etc.
  print("Value = \(value)")
  if value > 100 {
      break
  }
}
