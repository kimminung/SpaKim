import Cocoa

var greeting = "Hello, playground"

// for 문으로 구현
let num = ["1", "2", "3", "4", "5"]
var numberArray: [Int] = []
for index in num {
    if let changeToInt = Int(index) {
        numberArray.append(changeToInt)
    }
}

print(numberArray)
// [1, 2, 3, 4, 5]

// map으로 구현
let stringArray = ["1", "2", "3", "4", "5"]
numberArray = stringArray.map {
        if let changeToInt = Int($0) {
                return changeToInt
        }
        return 0
}

// for 문으로 구현
// numbers에서 짝수만 추출하기

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var evenNumbers: [Int] = []

for number in numbers {
    if number % 2 == 0 {
        evenNumbers.append(number)
    }
}

print(evenNumbers)
// [2, 4, 6, 8]

// filter로 구현
// numbers에서 짝수만 추출하기

let numbers1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let evenNumbers2 = numbers1.filter { $0 % 2 == 0 }

// for 문으로 구현
// 각 요소의 합 구하기

let numbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var sum = 0

for number in numbers2 {
    sum += number
}

print(sum)
// 55


// reduce로 구현
// 표현식1
// 각 요소의 합 구하기

let numbers3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let sum1 = numbers3.reduce(0, +)

print(sum1)
// 55


//표현식2
// 각 요소의 합 구하기

let numbers4 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let sum2 = numbers4.reduce(0) { $0 + $1 }



