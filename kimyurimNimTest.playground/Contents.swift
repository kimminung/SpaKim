import UIKit

func solution(_ n:Int64) -> Int64 {
    var arr: [Character] = []
    let str = String(n)
    var strNew: String = ""
    for i in str {
        arr.append(i)
    }
    arr.sort(by: >)
    
    for i in arr {
        strNew += String(i)
    }
    let intNew: Int64 = Int64 (strNew) ?? -1
    return intNew
}

solution(39542)
