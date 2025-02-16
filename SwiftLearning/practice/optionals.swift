// 7 ways to unwrap Optionals

var name : String? = "Kamal"

// 1) Forced unwrapping — unsafe.
let person1:String = name!
print("Person 1 : \(person1)")


// 2) Implicitly unwrapped variable declaration — unsafe in many cases.
var person2 = name!
print("Person 2 : \(person2)")


// 3) Optional binding — safe.
if let person3 = name {
  print("Person 3 : \(person3)")
}


// 4) Optional chaining — safe.
let person4 = name?.utf8
print("Person 4 : \(person4)")


// 5) Nil coalescing operator — safe.
let person5 = name ?? ""
print("Person 5 : \(person5)")


// 6) Guard statement — safe.
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
greet(name)

// 7) Optional pattern — safe.
if case let person7? = name {
  print("Person 7 : \(person7)")
}
