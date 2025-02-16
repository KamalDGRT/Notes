func printInfo(_ value: Any) {
    let t = type(of: value)
    print("'\(value)' of type '\(t)'")
}
 
let count: Int = 5
printInfo(count)
// '5' of type 'Int'


