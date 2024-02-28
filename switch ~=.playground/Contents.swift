import UIKit

struct Person {
    let name : String
}

func ~=(pattern: String, value: Person) -> Bool {
    return value.name == pattern
}

let person = Person(name: "woongs")

switch person {
case "woongs":
    print("Hello woongs!")
default:
    print("Sorry")
}
// Output: "Hello woongs!"

if case "woongs" = person {
    print("Hello woongs!")
}
// Output: "Hello woongs!"
