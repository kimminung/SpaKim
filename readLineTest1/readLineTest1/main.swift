//
//  main.swift
//  readLineTest1
//
//  Created by 민웅킴 on 3/15/24.
//

import Foundation
/*
var inPut : String
var noLetters : Bool! = nil
var onlyNumbers : [Character] = ["1","2","3","4","5","6","7","8","9","0"]
repeat {
    print("Enter a number.")
    inPut = readLine()!
    for character in inPut {
        if onlyNumbers.contains(character) || character == "-"
        {
            noLetters = true
            continue
        }
        if onlyNumbers.contains(character) != true
        { print("Sorry, numbers only.")
         noLetters = false
            break
        }
    }
}while noLetters == false
print(Int(inPut)!)*/

/*
var inPut : String
inPut = readLine()!
var noLetters : Bool
var onlyNumbers : [Character] = ["1","2","3","4","5","6","7","8","9","0"]
repeat {
    noLetters = true
    for character in inPut {
        guard onlyNumbers.contains(character) == false else {
            print("Sorry, numbers only.")
            noLetters = false
            break;
        }
    }
} while !noLetters
*/
/*
var noCharacters: Bool = true
var numberOnly: Int
repeat {
    print("Enter the second number")
    numberOnly = Int(readLine() ?? "-1") ?? -1
    if numberOnly == -1 {
        print("Sorry you have dialed the wrong number.\nTry again.")
        noCharacters = false
    }
    else {
        noCharacters = true
    }
}
while !noCharacters
print("You have entered \(numberOnly)")
*/
/*
print("Enter an integer")
while true {
  if let line = readLine(), let integer = Int(line) {
    print("You have entered \(integer)")
    break
  } else {
    print("That's not an integer.\nTry again.")
  }
}
//
//if let line = readLine() {
//  print(line)
//}
//
//// equivalent to:
//let optionalLine = readLine()
//if optionalLine != nil {
//  let line = optionalLine!
//  print(line)
//}
*/

/*
var input: String?
var acceptedNumbers = "1234567890"
var noChar: Bool = false
repeat
{
    input = readLine()
    for character in input!
    {
        if acceptedNumbers.contains(character){
            noChar = true
            continue
        }
        else
        {
            print("You have dialed the wrong number.Try again!")
            noChar = false
            break
        }
    }
}
while noChar == false
*/

let digits = Set("0123456789")

while let input = readLine() {
  let isValid = input.allSatisfy { char in
    digits.contains(char)
  }
  
  if isValid && !input.isEmpty {
    print("You entered \(input)")
    break
  } else {
    print("Invalid input")
  }
}
