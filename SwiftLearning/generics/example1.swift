func Increase_Int_By_One(num: Int) -> Int {
    return num + 1
}

func Increase_Double_By_One(num: Double) -> Double {
    return num + 1.0
}

// Generic Method
// Strideable is a protocol for numbers
func genericAdd<R:Strideable>(number: R) -> R {
    return number.advanced(by: 1)
}

print(Increase_Int_By_One(num: 5))
print(Increase_Double_By_One(num: 6.0))

print("---------------------------------------")
print(genericAdd(number: 5))
print(genericAdd(number: 6.0))

// Advantages:
// one method is enough for multiple typealias
// Results in cleaner code

