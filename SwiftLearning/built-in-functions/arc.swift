class Person
{
    var name: String
    weak var job: Job?

    init(_name: String) {
        debugPrint("init method of Person called")
        name = _name
    }

    func printName() {
        debugPrint("name is \(name)")
    }

    deinit {
        debugPrint("deinit called for person class")
    }
}


class Job
{
    var jobDescription: String
    weak var person: Person?

    init(_jobDescription: String) {
        debugPrint("init method of Job called")
        jobDescription = _jobDescription
    }

    deinit {
        debugPrint("deinit called for job class")
    }
}

var objPerson1: Person?
var objPerson2: Person?


// if (1 == 1)
// {
//     let objPerson = Person(_name: "kamal")
//     objPerson1 = objPerson
//     objPerson2 = objPerson
//     objPerson.printName()
// }




if (1 == 1)
{
    let objPerson = Person(_name: "kamal")
    let objJob = Job(_jobDescription: "graduate intern")
    objPerson.job = objJob
    objJob.person = objPerson
}
