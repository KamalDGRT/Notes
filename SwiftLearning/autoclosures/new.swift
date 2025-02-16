func goodMorning(morning: Bool, whom: String) {
    if morning {
        print("Good morning, \(whom)")
    }
}

func giveAname() -> String {
    print("giveAname() is called")
    return "Kamal"
}

goodMorning(morning: true, whom: giveAname())
goodMorning(morning:true, whom: "Leo")
// if true, the output is:
// giveAname() is called
//  Good morning, Kamal


goodMorning(morning: false, whom: giveAname())
// if false, the output is:
// giveAname() is called

// Expected: call giveAname() to get a string and pass this string to goodMorning.
// The first parameter is false and so the second parameter is unused for this case.
// But function giveAname is called.


// => giveAname() is called both the times

// If  giveAname should not be called, then use autoclosure


print("-----------------------------------------------------------------")

func goodMorning2(morning: Bool, whom: @autoclosure () -> String) {
    if morning {
        print("Good morning, \(whom())")
    }
}

func giveAname2() -> String {
    print("giveAname2() is called")
    return "Sharma"
}

goodMorning2(morning: true, whom: giveAname2())
goodMorning2(morning: true, whom: "Bharath")
goodMorning2(morning: false, whom: "Kaushik")
goodMorning2(morning: false, whom: giveAname2())
