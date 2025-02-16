struct Movie {
    let name: String
}


let numbers = [1, 3, 5, 7, 9, 11, 13]
let names = ["Anish", "Aakash", "Arun", "Bharath", "Kaushik"]
let movies = [
    Movie(name: "Batman"),
    Movie(name: "Harry Potter"),
    Movie(name: "Superman"),
    Movie(name: "Spiderman")
]

func firstAndLast(_ numbers: [Int]) -> (Int, Int) {
    return (numbers[0], numbers[numbers.count  - 1])
}

func firstAndLastString(_ names: [String]) -> (String, String) {
    return (names[0], names[names.count - 1])
}

let (first, last) = firstAndLast(numbers)

print(first)
print(last)

print("-----------------------------------------------------")


func genericFirstLast<T>(_ values: [T]) -> (T, T) {
    return (values[0], values[values.count - 1])
}
// When the functionality is almost identical but the data type is different,
// one can opt in to use generics
let (firstStr, lastStr) = genericFirstLast(names)

print(firstStr)
print(lastStr)


print("------------------------------------------")

let (firstMov, lastMov) = genericFirstLast(movies)
print(firstMov)
print(lastMov)
