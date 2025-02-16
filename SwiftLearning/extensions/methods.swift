// Methods
// Extensions can add new instance methods and type methods to existing types

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

4.repetitions {
    print("4 timesss !!!")
}
