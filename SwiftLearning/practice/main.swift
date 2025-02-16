// Type Casting

class LivingBeing {
    var age :Int?
    
    init(age:Int?) {
        if let age = age {
            self.age = age
        }
    }
}

class Human: LivingBeing {
    var name:String?
    
    init(name:String?, age:Int?) {
        if let name = name {
        self.name = name
        }
        super.init(age: age ?? 0)
    }
}

class Animal: LivingBeing {
    var isMammals:Bool?
    
    init(isMammals:Bool?, age:Int?) {
        if let isMammals = isMammals {
            self.isMammals = isMammals
        }
        super.init(age: age ?? 0)
    }
}

let livingBeingArray = [
    Animal(isMammals:true, age:12),
    Human(name:"Kamal",age:22)
]

// Type Checking - is keyword is used
for item in livingBeingArray {
    if item is Animal {
        print("item is of type Animal")
    } else if item is Human {
        print("item is of type Human")
    }
}

// Downcasting
// use as? - when not sure if downcast will succeed
// use as! - use only when you are sure that downcast will succeed
// in as?, if downcast is not successful, it will return nil

//forced downcasting to Animal
let animalObj = livingBeingArray[0] as! Animal

//forced downcasting to Human
let humanObj = livingBeingArray[1] as! Human

// forced downcasting can fail if:
    // - we try to downcast the first object to a Human and
    // - second object to an Animal. 
// In this case the result will be nil
// which a normal type cannot handle and
// the program will crash.

// let animalObj1 = livingBeingArray[0] as! Human //error and crashes
// let humanObj1 = livingBeingArray[1] as! Animal //error and crashes

//nil..animalObj is of Human? (optional Human which is the type which we tried to downcast to)
let animalObj2 = livingBeingArray[0] as? Human

//nil..humanObj is of Animal? (optional Animal which is the type which we tried to downcast to)
let humanObj2 = livingBeingArray[1] as? Animal

// success, returns Animal?
let animalObj3 = livingBeingArray[0] as? Animal

// success, returns Human?
let humanObj3 = livingBeingArray[1] as? Human

// Upcasting
let animalObj4 = livingBeingArray[0] as! Animal
print("\(type(of: animalObj4))")
// print("\(animalObj4?.age)")
// Animal

let animalObjectAsLivingBeingObj = animalObj4 as LivingBeing
print("\(type(of: animalObjectAsLivingBeingObj))")
// Should print LivingBeing but I am getting Animal
// print("\(animalObjectAsLivingBeingObj?.age)")

