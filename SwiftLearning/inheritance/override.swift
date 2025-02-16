class Animal {

 // method in the superclass
 func eat() {
   print("I can eat")
 }
}

// Dog inherits Animal
class Dog: Animal {

  // overriding the eat() method
  override func eat() {
    print("I eat dog food")
  }
}

// create an object of the subclass
var labrador =  Dog()

// call the eat() method
labrador.eat()


// Output:
// I eat dog food
