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
 
func solution(_ s:String) -> Int {
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
 
print(solution(String(s)))
