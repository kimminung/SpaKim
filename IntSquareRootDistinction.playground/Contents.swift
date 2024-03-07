import UIKit

//정수 제곱근 판별
func solution(_ n:Int64) -> Int64 {
    guard n >= Int64(1), n <= Int64(50000000000000) else {return 0}
    
    for i in 1...n {
        if i * i == n {
            return (i + 1) * (i + 1)
        }
        if n < i * i {
            return -1
        }
    }
    return 0
}

func solution1(_ n:Int64) -> Int64 {
    let t = Int64(sqrt(Double(n)))
    return t * t == n ? (t+1)*(t+1) : -1
}

//
extension Int64 {
    func bitCount() -> Int {
        let hexString = String(self, radix: 2, uppercase: false)
        return hexString.count
    }
}

func solution2(_ n:Int64) -> Int64 {
    let sqrtBitCount: Int = (n.bitCount() + 1) / 2
    let min, max: Int64
    min = 1 << Int(sqrtBitCount - 1)
    max = 1 << sqrtBitCount

    for i in min..<max {
        if i * i == n {
            return (i + 1) * (i + 1)
        } else if i * i > n {
            break
        }
    }

    return -1
}

//
func solution3(_ n:Int64) -> Int64 {

    if(n == 1)
    {
        return 4
    }

    for i in 1..<n
    {
        if(n == i * i)
        {
            return (i + 1) * (i + 1)
        }
    }
    return -1
}


//
func solution4(_ n:Int64) -> Int64 {
    let temp = String(sqrt(Double(n))).split(separator: ".").last
    if temp == "0" {
        let num = Int(sqrt(Double(n)))+1
        return Int64(num*num)
    } else { return -1 }
}

func solution5(_ n:Int64) -> Int64 {

    let value = String(sqrt(Double(n)))
    let temp  = value.split(separator: ".").last
    if temp == "0" {
        let num = Int(Double(value)!) + 1
        return Int64(pow(Double(num), 2.0))
    } else {
        return -1
    }
}

func solution6(_ n:Int64) -> Int64 {
    var result : Int64 = -1
    var temp : Int64 = 1

    while temp * temp <= n {
        if sqrt(Double(n)) == Double(temp) {
            result = (temp + 1) * (temp + 1)
        }
        temp += 1
    }//
    return result
}

func solution7(_ n:Int64) -> Int64 {
    let rootValue = sqrt(Double(n));
    if( rootValue - floor(rootValue) != 0){return -1;}
    return Int64((rootValue+1)*(rootValue+1));
}

func solution8(_ n: Int64) -> Int64 {
    var result: Int64 = -1
    let root = sqrt(Double(n))

    if floor(root) == root {
        result = Int64((root + 1) * (root + 1))
    }

    return result
}

func solution9(_ n:Int64) -> Int64 {
    var res:Int64 = -1
    let input = Double(n)
    if sqrt(input) == floor(sqrt(input)) {
        res = Int64((sqrt(input)+1)*(sqrt(input)+1))
    }

    return res
}

func solution10(_ n:Int64) -> Int64 {

    let sqaure = sqrt(Double(n))

    if sqaure.truncatingRemainder(dividingBy: 1) == 0 {
        return Int64(pow(sqaure+1,2))
    }

    return -1
}

//망작
/*
//정수 제곱근 판별
var n = 3 // 34 * 34
func solution(_ n:Int64) -> Int64 {
//    var result:Int = 0
    guard n >= Int64(1), n <= Int64(50000000000000) else {return 0}
    
    var x: String = String(Int64(n))
    var total: Int64 = 0
    
    if n % n == 1 {
        // 0,1,4,6,9,25
        if x[x.index(x.endIndex, offsetBy: -1)] == "0"
            || x[x.index(x.endIndex, offsetBy: -1)] == "1"
            || x[x.index(x.endIndex, offsetBy: -1)] == "4"
            || x[x.index(x.endIndex, offsetBy: -1)] == "6"
            || x[x.index(x.endIndex, offsetBy: -1)] == "9"
            || x[x.index(x.endIndex, offsetBy: -2)...x.index(x.endIndex, offsetBy: -1)] == "25" {
            
            var num = Int(String(x))!
            var result: Int64 = 0
            var count = 2
            var mul: Int64 = 0
            
            while num != 1 {
                if num % count == 0 {
                    num = num / count
                    Int64(result) + Int64(count)
                    
                } else {
                    count += 1
                }
                
            }
            mul = Int64(result) + Int64(count) + 1
            return mul * mul
            
        } else {
            return total + -1
        }
    } else {
        return total + -1
    }

}


solution(3)
*/
