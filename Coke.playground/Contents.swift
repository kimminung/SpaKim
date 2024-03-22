import Foundation
//func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
//
//    // 마트에서 받는 콜라의 총 개수
//    var answer: Int = 0
//    
//    // 현재 소유하고 있는 콜라의 개수
//    var coke = n
//    
//    while true {
//        // 빈 병을 가져갈 때마다 마트에서 받는 콜라의 개수
//        var k = ( coke / a ) * b
//        answer += k
//        // 빈 병을 가져가고 받은 콜라와 남은 콜라의 수
//        coke = k + (coke % a)
//        if coke < a {
//            break
//        }
//    }
//    
//    return answer
//}

//func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
//    
//    var nowbottle = n
//    var count = 0
//    
//    
//    while nowbottle >= a{
//        
//        count += (nowbottle / a) * b
//        
//        nowbottle = nowbottle - (nowbottle / a * a) + ((nowbottle / a) * b)
//    }
//    return count
//}

//func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
//    var emptyBottle = n
//    var cokeCount = 0
//    while emptyBottle >= a {
//        if emptyBottle % a == 0 {
//            cokeCount += (emptyBottle / a) * b
//            emptyBottle = (emptyBottle / a) * b
//        } else {
//            cokeCount += (emptyBottle / a) * b
//            emptyBottle = (emptyBottle / a) * b + (emptyBottle % a)
//        }
//    }
//    return cokeCount
//}


//func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
//    return (n > b ? n - b : 0) / (a - b) * b
//}



func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    guard b >= 1, a > b, a <= n, n <= 1000000 else {return 0}
    
    var result = 0, n = n
    
    while n >= a {
        let new = (n / a) * b
        result += new
        n = (n % a) + new
    }
    
    if result is Int == true {
        return result
    } else {
        return 0
    }
}

solution(2, 1, 20)
