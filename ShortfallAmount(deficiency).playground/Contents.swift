import UIKit

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    guard price > 0, price <= 2500 else {return -1}
    guard money > 0, money <= 1000000000 else {return -1}
    guard count > 0, count <= 2500 else {return -1}
    
    var total = 0
    var answer:Int64 = 0
    
    for x in 1...count {
        total += x * price
    }
    if total < money {
        return answer
    } else {
        answer = Int64(total-money)
    }
    
    return answer
}

//solution(3, 20, 4)
//solution(17, 20, 3)
//solution(4, 40, 4)
//solution(1, 20, 4)


//
func solution1(_ price:Int, _ money:Int, _ count:Int) -> Int{
    return max((count + 1) * count / 2 * price - money , 0)
}

func solution2(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let totalPrice = price * (count * (count+1)/2)

    if money >= totalPrice {
        return 0
    }

    return Int64(totalPrice - money)
}

func solution3(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var total = 0
    for i in 1...count { total += (i * price) }

    var answer:Int64 = -1
    answer = (total > money) ? Int64(total - money):0

    return answer
}

func solution4(_ price:Int, _ money:Int, _ count:Int) -> Int{
    var totalPrice: Int = 0
    for i in 0...count{
        totalPrice += price * (count - i)
    }
    let answer = totalPrice - money

    return answer > 0 ? answer : 0
}

func solution5(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var counting: Int64 = Int64(count) * Int64(count + 1) / 2

    answer = counting * Int64(price)
    if answer > money {
        return answer - Int64(money)
    } else {
        return 0
    }

}

func solution6(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let sum = (count + 1) * count / 2
    let totalPrice = Int64(price) * Int64(sum)
    return max(totalPrice - Int64(money), 0)
}

func solution7(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    return money - price * (count * (count + 1)) / 2 > 0 ? Int64(0) : Int64(abs(money - price * (count * (count + 1)) / 2))
}

func solution8(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let stepSum = Double(count) * Double((count + 1)) / Double(2)

    var answer: Int64 = Int64(stepSum) * Int64(price) - Int64(money)
    if answer < 0 { answer = 0}

    return answer
}

//망작
/*
func solutionxxx(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    guard price > 0, price <= 2500 else {return -1}
    guard money > 0, money <= 1000000000 else {return -1}
    guard count > 0, count <= 2500 else {return -1}
    
    var total = 0
    var answer:Int64 = 0
    
    for x in 1...count {
        var surcharge = x * price
//        var total = 0

        if surcharge < money {
            total += surcharge
        } else if surcharge == money {
            total += surcharge
        } else {
            total += surcharge
        }
        
        if surcharge == money {
            total = money
        }
        
//        if surcharge < money {
//            total = money - surcharge
//        } else if surcharge > money {
//            total = money - surcharge
//        } else {
//            total = money - surcharge
//        }
//        answer = abs(Int64(total - money))
    }
    answer = abs(Int64(total - money))
    
    
    return answer
}
*/



//solutionxxx(5, 20, 4)
//solutionxxx(3, 20, 4)
//solutionxxx(17, 20, 4)
//solutionxxx(10, 20, 4)
