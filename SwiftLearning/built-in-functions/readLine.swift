print("Enter Something")
// let str = readLine()
// print(str)

// Unwrapping the optional
// if let str = readLine(){
//     print(str)
// }


// Determining the type of the number entered
// if let input = readLine()
// {
//     if let int = Int(input)
//     {
//         print("Entered input is \(int) of the type:\(type(of: int))")
//     }
//     else{
//         print("Entered input is \(input) of the type:\(type(of: input))")
//     }
// }



let array = readLine()?
    .split {$0 == " "}
    .map (String.init)

if let stringArray = array {
    print(stringArray)
}
