/// 더하기 `연산을 한다`
/// 빼기 `연산을 한다`
/// 곱하기 `연산을 한다`
/// 나누기 `연산을 한다`
///
protocol OperationType {
  func operate(_ number1: Int, _ number2: Int) -> Double
}

class AbstractOperation {
  func operate(_ number1: Int, _ number2: Int) -> Double {
    return -1
  }
}

class AddOperation2: OperationType {    //프로토콜 사용시
  func operate(_ number1: Int, _ number2: Int) -> Double {
    Double(number1 + number2)
  }
}

class AddOperation: AbstractOperation {
  
  override func operate(_ number1: Int, _ number2: Int) -> Double {
    Double(number1 + number2)
  }
}

class SubstractOperation: AbstractOperation {
  /// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/
  /**
    - parameters:
    - number1: 빼기 연산자의 왼쪽에 오는 수
    - number2: 빼기 연산자의 오른쪽에 오는 수
   */
  override func operate(_ number1: Int, _ number2: Int) -> Double {
    Double(number1 - number2)
  }
}

class MultiplyOperation: AbstractOperation {
  
  override func operate(_ number1: Int, _ number2: Int) -> Double {
    Double(number1 * number2)
  }
}

class DivideOperation: AbstractOperation {
  
  override func operate(_ number1: Int, _ number2: Int) -> Double {

    guard number2 != 0 else {
      return 0.0
    }
    
    return Double(number1) / Double(number2)
  }
}

// Caculator -> AddOperation
// Caculator -> AbstractOperation <- AddOperation

class Calculator {
  var operation: AbstractOperation?
//    var operation: OperationType? //프로토콜 사용시
  
  func operate(_ number1: Int, _ number2: Int) -> Double {
      (operation?.operate(number1, number2))!
  }
}

enum OperatorType {
  case add
  case substract
  case multiply
  case divide
}

let addOperation = AddOperation()
let substractOperation = SubstractOperation()
let multiplyOperation = MultiplyOperation()
let divideOperation = DivideOperation()

let calculator = Calculator() // 인스턴스 생성하여 변수에 할당

/// 더하기
calculator.operation = addOperation
calculator.operate(1, 2)                   //3

/// 빼기
calculator.operation = substractOperation
calculator.operate(3, 1)                   //2

/// 곱하기
calculator.operation = multiplyOperation  // 15
calculator.operate(3, 5)

/// 나누기
calculator.operation = divideOperation     // 0.3333
calculator.operate(1, 3)


