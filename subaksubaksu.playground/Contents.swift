import UIKit


//승현님 코드 참조
func solution(_ n:Int) -> String {
    
    guard n >= 1 && n <= 10000 else {
        return "제한 조건 벗어남";
    }
    
    var result: String = "";
    
    for i in 0..<n {
        result += i % 2 == 0 ? "수" : "박";
    }
    
    return result;
}

/*
struct SB: Sequence, IteratorProtocol {
    var c = 0
    mutating func next() -> String? {
        c = (c + 1) % 2
        return c == 1 ? "수" : "박"
    }
}

func solution0(_ n:Int) -> String {
    return SB().lazy.prefix(n).joined(separator:"")
}
*/


func solution1(_ n:Int) -> String {
    return "\(String(repeating: "수박", count: n / 2))\(n % 2 == 0 ? "" : "수")"
}

func solution2(_ n:Int) -> String {
    return (0..<n).map{($0%2==0 ? "수":"박")}.reduce("", +)
}


//
struct SB: Sequence, IteratorProtocol {
    var c = 0
    mutating func next() -> String? {
        c = (c + 1) % 2
        return c == 1 ? "수" : "박"
    }
}

func solution3(_ n:Int) -> String {
    return SB().lazy.prefix(n).joined(separator:"")
}
//


func solution4(_ n:Int) -> String {
    var str = ""

    for i in 1...n {
        if i % 2 == 1 {
            str += "수"
        } else {
            str += "박"
        }
    }

    return str
}


func solution5(_ n:Int) -> String {
    var result = (n == 1) ? "수" : "수박"


    while result.count < n {
        let leftNum = n - result.count
        if leftNum == 0 {
            break
        }
        else if leftNum == 1 {
            result += "수"
        } else if leftNum == 2 {
            result += "수박"
        } else if result.count * 2 <= n {
            result += result
        } else {
            let log = Int(_log2(Double(leftNum))) - 1
            let index = result.index(result.startIndex, offsetBy: 2 << log)
            result += String(result[..<index])
        }
    }
    return result
}



func solution6(_ n:Int) -> String {
    return String(Array(repeating: "-", count: n).enumerated().map{$0.offset%2 == 0 ? "수" : "박"})
}
