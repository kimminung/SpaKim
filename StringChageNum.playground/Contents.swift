import UIKit
var s: String = "-0234"
/*
var s = -0234567
func solution(_ s:String) -> Int {

    guard s.count >= 1 && s.count <= 5 else {return 999999}
    
    return Int(s)!
}

print(Int(s))
print(Int(String(s).count))
*/

/*
func solution(_ s:String) -> Int {
    var newS = ""
    var mark = ""
    if s[s.startIndex] == "+" || s[s.startIndex] == "-" {
        mark = String(s[s.startIndex])
        newS = s
        newS.remove(at:newS.startIndex)
    } else {
        newS = s
    }
    if let result = Int(newS) {
        if mark == "+" || mark == "" {
            return result
        } else if mark == "-" {
            return result * -1
        }
        print(result)
        return result
    } else {
        return 0
    }
}
 */
 
func solution0(_ s:String) -> Int {
    var result: Int = 0
    if s.count > 1 && s.count <= 5 {
        if let r = Int(s) {
            result = r
        } else {
            print("nil!!")
        }
    } else {
        print("s의 길이는 1이상 5이하입니다.")
    }
    return result
}
 
print(solution0(String(s)))
solution0("-0234")


func solution1(_ s:String) -> Int {
    return (s.hasPrefix("+") ? Int(s.replacingOccurrences(of: "+", with: "")) : Int(s))!
}


func solution2(_ s:String) -> Int {
    var answer = s.components(separatedBy: "").map({Int($0)!})
    return answer[0]
}

func solution3(_ s:String) -> Int {
    if s[s.startIndex] == "-" {
        return -1*(Int(String(s[s.index(after: s.startIndex)..<s.endIndex])) ?? 0)
    }

    return Int(String(s[s.startIndex..<s.endIndex])) ?? 0
}


func solution(_ s:String) -> Int? {
    guard s.count >= 1 && s.count <= 5 else {return 999999}
    
    
    let sString = s
    let regexPattern = #"^[+-]?(?!0)\d+$"#
    guard let regex = try? NSRegularExpression(pattern: regexPattern)
    else { return 0 }
    let range = NSRange(location: 0, length: sString.utf16.count)
    guard regex.firstMatch(in: sString, options: [], range: range) != nil
    else { return 0 }
    
    
    return Int(s)
}

solution("1234")
