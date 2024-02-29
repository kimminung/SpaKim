import UIKit


func solution(_ x:Int) -> Bool {
    let sumOfDigits = String(x).compactMap { Int(String($0)) }.reduce(0, +)
    return x % sumOfDigits == 0
}


func solution9(_ x:Int) -> Bool {
    return x % String(x).reduce(0, {$0+Int(String($1))!}) == 0
}


func solution10(_ x:Int) -> Bool {
    return x % String(x).map{ Int(String($0))! }.reduce(0) { $0 + $1 } == 0 ? true : false
}

func solution11(_ x: Int) -> Bool {
    let sum = Array(String(x)).reduce(0) { (Result, Character) -> Int in
        return Result + Int(String(Character))!
    }
    return (x % sum == 0)
}

func solution12(_ x:Int) -> Bool {
    return x % String(x).map({ (char) -> Int in
        return char.wholeNumberValue!
    }).reduce(0, {$0+$1}) == 0
}

func solution13(_ x:Int) -> Bool {
    let number = String(x).reduce(0, { Int(String($0))! + Int(String($1))! })
    return x % number == 0
}

func solution14(_ x:Int) -> Bool {
    let a = String(x).map {Int(String($0))!}.reduce(0) {$0 + $1}

    return x % a == 0 ? true : false
}

func solution1(_ x:Int) -> Bool {
    var sum: Int = 0
    var val = x

    while val > 0 {
        sum += val % 10
        val /= 10
    }

    return x % sum == 0
}





func solution2(_ x:Int) -> Bool {
    var result = 0

    for num in String(x) {
        result += Int(String(num))!
    }

    return x%result == 0 ? true:false
}





func solution3(_ x:Int) -> Bool {
    var sum = String(x)
        .map{Int(String($0))!}
        .reduce(0, +)

    return x % sum == 0
}





func solution4(_ x:Int) -> Bool {

    var sum = 0
    var xTemp = x
    while xTemp >= 1 {
        sum += xTemp % 10
        xTemp /= 10
    }
    print("sum", sum)

    if x % sum == 0 {
        return true
    }
    else {
        return false
    }


}





func solution5(_ x:Int) -> Bool {
    var sum = String(x).compactMap { Int(String($0)) }.reduce(0, +)
    return x % sum == 0 ? true : false
}





func solution6(_ x:Int) -> Bool {
     var temp = String(x).map { Int(String($0))! }.reduce(0, +)
    if x % temp == 0 {
        return true
    }
    return false
}





func solution7(_ x:Int) -> Bool {
    var temp = 0
    var main = x
    while(main > 0)
    {
        temp += main % 10
        main = main / 10
    }

    if(x%temp == 0)
    {
        return true
    }else{
        return false
    }
}




func solution8(_ x:Int) -> Bool {
    var str = String(x)
    var first:Int = 0
    for i in 0..<str.count {
        first += Int(String(str[str.index(str.startIndex, offsetBy: i)]))!
    }
    if x % first == 0 { return true}

    return false
}
