class Animal {

  // properties and method of the parent class
  var name: String = ""

  func eat() {
    print("I can eat")
  }
}

// inherit from Animal
class Dog: Animal {

  // new method in subclass
  func display() {

    // access name property of superclass
    print("My name is ", name);
  }
}

// create an object of the subclass
var labrador = Dog()

// access superclass property and method 
labrador.name = "Johnny"
labrador.eat()

// call subclass method 
labrador.display()



// Output
// I can eat
// My name is Johnny

