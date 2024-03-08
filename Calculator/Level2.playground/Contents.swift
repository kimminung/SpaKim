
class Calculator {
  
  func add(_ number1: Int, _ number2: Int) -> Int {
    number1 + number2
  }
  
  /// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/
  /**
    - parameters:
    - number1: 빼기 연산자의 왼쪽에 오는 수
    - number2: 빼기 연산자의 오른쪽에 오는 수
   */
  func minus(_ number1: Int, _ number2: Int) -> Int {
    number1 - number2
  }
  
  func multiply(_ number1: Int, _ number2: Int) -> Int {
    number1 * number2
  }
  
  func divide(_ number1: Int, _ number2: Int) -> Double {
    
    guard number2 != 0 else {
        return 0.0
    }
    
    return Double(number1) / Double(number2)
  }
  
  func mod(_ number1: Int, _ number2: Int) -> Int {
    number1 % number2
  }
}

let calculator = Calculator() // 인스턴스 생성하여 변수에 할당

//print(calculator.add(1, 2))       // 3
//
//print(calculator.minus(3, 1))     // 2
//
//print(calculator.multiply(3, 5))  // 15
//
print(calculator.divide(1, 0))    // 0.3333..
//
//calculator.mod(3, 5)              // 3
//
//calculator.mod(6, 3)              // 0
//
//calculator.mod(5, 3)              // 2
