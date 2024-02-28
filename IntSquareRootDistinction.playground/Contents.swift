import UIKit

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
