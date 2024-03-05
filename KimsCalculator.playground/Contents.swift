class Calculator {
    var num1: Int
    var num2: Int
    
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
    /*
    //Lv.1
    func add() -> Int {
        print("\(num1 + num2)")
        return num1 + num2
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
    
    //Lv.2
    func remainder() -> Int {
        print("\(num1 % num2)")
        return num1 % num2
    }*/
    
}
//Lv.3 - 각자의 연산함수 사용
class AddOperation: Calculator {
    var addType : String
    
    init(num1:Int, num2:Int, addType:String) {
        self.addType = addType
        super.init(num1: num1, num2: num2)
    }
    
    func plus() -> Int {
        if addType == "+" {
            print("\(num1 + num2)")
        }
        return num1 + num2
    }
}

class SubstractOperation: Calculator {
    var minusType : String
    
    init(num1:Int, num2:Int, minusType:String) {
        self.minusType = minusType
        super.init(num1: num1, num2: num2)
    }
    
    func minus() -> Int {
        if minusType == "-" {
            print("\(num1 - num2)")
        }
        return num1 - num2
    }
}

class MultiplyOperation: Calculator {
    var mulType : String
    
    init(num1:Int, num2:Int, mulType:String) {
        self.mulType = mulType
        super.init(num1: num1, num2: num2)
    }
    
    func mul() -> Int {
        if mulType == "*" {
            print("\(num1 * num2)")
        }
        return num1 * num2
    }
}

class DivideOperation: Calculator {
    var divType : String
    
    init(num1:Int, num2:Int, divType:String) {
        self.divType = divType
        super.init(num1: num1, num2: num2)
    }
    
    func div() -> Int {
        if divType == "/" {
            print("\(num1 / num2)")
        }
        return num1 / num2
    }
}
//Lv.1 Test
//let calculator = Calculator(num1: 3, num2: 4)
//let calculator = Calculator(num1: 6, num2: 3)
//let calculator = Calculator(num1: 5, num2: 3)

/*
calculator.add()
calculator.sub()
calculator.mul()
calculator.div()
 */
//Lv.2 Test
/*
calculator.remainder()
 */

//Lv.3 Test
//let calculator = AddOperation(num1: 3, num2: 5, addType: "+")
//calculator.plus()

//let calculator = SubstractOperation(num1: 3, num2: 5, minusType: "-")
//calculator.minus()

//let calculator = MultiplyOperation(num1: 3, num2: 5, mulType: "*")
//calculator.mul()

//let calculator = DivideOperation(num1: 3, num2: 5, divType: "/")
//calculator.div()
