// Subscripts
// Extensions can add new subscripts to an existing type.

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print("\(746381295[0])
// returns 5

print("\(746381295[1])
// returns 9

print("\(746381295[2])
// returns 2

print("\(746381295[8])
// returns 7

print("\(746381295[9])
// returns 0, as if you had requested:
print("\(0746381295[9])
