// MARK: 에러 정의
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


// MARK: throw와 do-catch 문과 try문
/*
표현
func canThrowErrors() throws -> String
func cannotThrowErrors() -> String
*/

enum CustomError: Error {
    case outOfBounds
    case invalidInput(String)
}

func processValue(_ value: Int) throws -> Int {
    if value < 0 {
        throw CustomError.invalidInput("Value cannot be negative")
    } else if value > 100 {
        throw CustomError.outOfBounds
    }
    
    return value * 2
}

// do-catch 블록을 이용하여 throwing 함수 호출 및 에러 처리하기
do {
    let result = try processValue(50)
    print("Result is \(result)")
} catch CustomError.outOfBounds {
    print("Value is out of bounds!")
} catch CustomError.invalidInput(let errorMessage) {
    print("Invalid Input: \(errorMessage)")
} catch {
    print("An error occurred: \(error)")
}
// 출력 : Result is 100


do {
    let result = try processValue(-10)
    print("Result is \(result)")
} catch CustomError.outOfBounds {
    print("Value is out of bounds!")
} catch CustomError.invalidInput(let errorMessage) {
    print("Invalid Input: \(errorMessage)")
} catch {
    print("An error occurred: \(error)")
}
// 출력 : Invalid Input: Value cannot be negative



// MARK: try , try? , try!
enum MyError: Error {
    case invalidInput
}

func someThrowingFunction(value: Int) throws -> String {
    guard value >= 0 else {
        throw MyError.invalidInput // value가 음수인 경우 에러를 던짐
    }

    return "The value is \(value)"
}

// throwing 함수 호출과 에러 처리하기
do {
    let result = try someThrowingFunction(value: 5)
    print(result)
} catch {
    print("Error occurred: \(error)")
}

do {
    let result = try someThrowingFunction(value: -2) // 에러 발생
    print(result)
} catch {
    print("Error occurred: \(error)") // 음수 값을 처리하는 에러
}

// try?를 사용하여 에러 처리하기
let result1 = try? someThrowingFunction(value: 5) // 유효한 값 호출
print(result1) // Optional("The value is 5")

let result2 = try? someThrowingFunction(value: -2) // 에러 발생
print(result2) // nil

// try!를 사용하여 에러 처리하기
let result3 = try! someThrowingFunction(value: 5) // 유효한 값 호출
print(result3) // The value is 5

//let result4 = try! someThrowingFunction(value: -2) // 에러 발생
//print(result4)
