class Person {
    var name: String
    weak var job: Job?


    // gets called before the object is created
    init(_ _name: String) {
        print("init method of Person is called")
        name = _name
    }
    
    func printName() {
        print("The name of the person is \(name).")
    }
    
    // performs cleanup before a object is deallocated.
    deinit {
        print("The deinit of Person is called")
    }
}


class Job {
    var jobDescription: String
    var person: Person?
    
     // gets called before the object is created
    init(_ _jobDescription: String) {
        print("init method of Job is called")
        jobDescription = _jobDescription
    }

    // performs cleanup before a object is deallocated.
    deinit {
        print("The deinit of Job is called")
    }
}

if(true)
{
    let kamal = Person("Kamal")
    let swiftProgrammer = Job("Swift Programmer")
    kamal.job = swiftProgrammer
    
    // denit gets called for person and job
}

print("------------------------------------------------")

if(true)
{
    let kamal = Person("Kamal")
    let swiftProgrammer = Job("Swift Programmer")
    
    // a person has a job 
    kamal.job = swiftProgrammer
    
    // a job is done by a person
    swiftProgrammer.person = kamal
    
    // deinit wont be called because of a strong reference cycle
    // this implies that our code dictates arc on which object to keep in memory
}

// - when weak keyword is added, then it will be called
// - weak keywword can be added either in one of the class or both of them
// - by default it is strong reference in swift
