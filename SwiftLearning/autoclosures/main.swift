struct Person: CustomStringConvertible {
     let name: String
     
     var description: String {
         print("Asking for Person description.")
         return "Person name is \(name)"
     }
 }
 
 
 let isDebuggingEnabled: Bool = true

 func debugLog(_ message: () -> String) {
     /// You could replace this in projects with #if DEBUG
     if isDebuggingEnabled {
         print("[DEBUG] \(message())")
     }
 }

 let person = Person(name: "Bernie")
 debugLog({ person.description })
 
 print("----------------------------------------------------------------")
 
  func debugLog2(_ message: @autoclosure () -> String) {
     /// You could replace this in projects with #if DEBUG
     if isDebuggingEnabled {
         print("[DEBUG] \(message())")
     }
 }

 let person2 = Person(name: "Bernie")
 debugLog2(person2.description)
