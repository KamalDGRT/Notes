// You can use this function to stride over values of any type that
// conforms to the Strideable protocol, such as integers or floating-point types.
// Starting with start, each successive value of the sequence adds stride until the
// next value would be beyond end.


for countdown in stride(from: 3, to: 0, by: -1) {
    print("\(countdown)...")
}
// 3...
// 2...
// 1...

for radians in stride(from: 0.0, to: .pi * 2, by: .pi / 2) {
    let degrees = Int(radians * 180 / .pi)
    print("Degrees: \(degrees), radians: \(radians)")
}
// Degrees: 0, radians: 0.0
// Degrees: 90, radians: 1.5707963267949
// Degrees: 180, radians: 3.14159265358979
// Degrees: 270, radians: 4.71238898038469
