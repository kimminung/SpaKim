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
