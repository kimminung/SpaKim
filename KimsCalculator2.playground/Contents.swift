

/*
//Lv.1 + Lv.2 & oprator추가
class Calculator {
    func calculator(_ oprator: Character, _ firstNumber: Int, _ SecondNumber: Int) -> Double {
        
        switch oprator {
        case "+" :
            return Double(firstNumber + SecondNumber)
        case "-" :
            return Double(firstNumber - SecondNumber)
        case "*" :
            return Double(firstNumber * SecondNumber)
        case "/" :
            return Double(firstNumber / SecondNumber)
            //lv.2
        case "%" :
            return Double(firstNumber % SecondNumber)
        default:
            return 0
        }
    }
}
//쌈@뽕하고만
let calculator = Calculator()
let addResult = calculator.calculator("+", 9, 3) // 덧셈 연산
let subtractResult = calculator.calculator("-", 9, 3) // 뺄셈 연산
let multiplyResult = calculator.calculator("*", 9, 3) // 곱셈 연산
let divideResult = calculator.calculator("/", 9, 3) //나눗셈 연산
//lv.2
let remainderResult = calculator.calculator("%", 5, 3) //나merge

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
*/

/*
 //Lv.1 망작
class Calculator {
    //operator: 제거함..
    func calculate(firstNumber:Int, secondNumber:Int ) -> Double {
        /*
                    구현부
                */
        let calculator = Calculator()
        let addResult = firstNumber + secondNumber// 덧셈 연산
        let subtractResult = firstNumber - secondNumber// 뺄셈 연산
        let multiplyResult = firstNumber * secondNumber// 곱셈 연산
        let divideResult = firstNumber / secondNumber// 나눗셈 연산

        print("addResult : \(addResult)")
        print("subtractResult : \(subtractResult)")
        print("multiplyResult : \(multiplyResult)")
        print("divideResult : \(divideResult)")
        // 정확한 operator가 전달되지 않을 시 0을 리턴(nil을 리턴해도 됨)
        return 0
    }
}

Calculator().calculate(firstNumber: 5, secondNumber: 3)
*/

/*
class Calculator {
    var num1: Int
    var num2: Int
    
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
    
    func add(){
        print("\(num1 + num2)")
    }
    func sub() -> Int {
        print("\(num1 - num2)")
        return num1 - num2
    }
    func mul() -> Int {
        print("\(num1 * num2)")
        return num1 * num2
    }
    func div() -> Int {
        print("\(num1 / num2)")
        return num1 / num2
    }
}

class AddOperation: Calculator {
    override func add() {
        super.add()
        print("\(num1 + num2)")
    }
}
*/
