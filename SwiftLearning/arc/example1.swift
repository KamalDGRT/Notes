class Person {
    var name: String
    
    // gets called before the object is created
    init(_ _name: String) {
        print("init method of Person called")
        name = _name
    }
    
    func printName() {
        print("The name of the person is \(name).")
    }
    
    // performs cleanup before a object is deallocated.
    deinit {
        print("The delloction happens")
    }
}


let objectPerson = Person ("Kamal")
objectPerson.printName()

print("---------------------------")

if(true)
{
    let objectPerson = Person ("Kamal")
    objectPerson.printName()
    // ARC will dellocate
}

print("---------------------------")

var objectPerson1: Person?
var objectPerson2: Person?


if(true)
{
    let objectPerson = Person ("Kamal")
    objectPerson1 = objectPerson
    objectPerson2 = objectPerson
    objectPerson.printName()
    
    // ARC wont deallocate
    // because objectPerson1 and objectPerson2 that are declared before
    // are using the objectPerson
}



objectPerson1 = nil
objectPerson2 = nil
// now it will deinit the objectPerson
