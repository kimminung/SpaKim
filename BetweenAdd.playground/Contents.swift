import UIKit

func solution(_ a:Int, _ b:Int) -> Int64 {
    guard a >= -10000000, b >= -10000000, a <= 10000000, b <= 10000000 else {return 10000001}
    
    var result = Int64(a+b) * Int64(max(a,b) - min(a,b) + 1)/2
    return result
}

/*
func solution(_ a:Int, _ b:Int) -> Int64 {
    
    guard a >= -10000000, b >= -10000000, a <= 10000000, b <= 10000000 else {return 10000001}

    var result : Int64 = 0

    if a < b {
        for add in a...b {

            result += Int64(add)

        }
        return result

    } else if a == b {

        return result + Int64(Int.random(in: (a...b)))
    } else {
        for add in b...a {

            result += Int64(add)

        }
        return result
    }
}
*/
solution(3, 5)
//solution(3, 3)
//solution(5, 3)

func solution0(_ a:Int, _ b:Int) -> Int64 {
    return Int64(Int((abs(a-b))+1)*(a+b)/2)
}

func solution1(_ a:Int, _ b:Int) -> Int64 {
    var result = Int64(Array(a > b ? b...a : a...b).reduce(0, +))
    return result
  }


func solution2(_ a:Int, _ b:Int) -> Int64 {
    return Int64(Array(a > b ? b...a : a...b).reduce(0, +))
  }


func solution3(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / Int64(2)
}


func solution4(_ a:Int, _ b:Int) -> Int64 {

    let minValue = a < b ? a : b
    let maxValue = a > b ? a : b

    var value: Int64 = 0
    for i in minValue...maxValue {
        value += Int64(i)
    }

    return value
}

func solution5(_ a:Int, _ b:Int) -> Int64 {
    var big = 0
    var small = 0
    if(a>b){
        big = a
        small = b
    }else if(a<b){
        big = b
        small = a
    }else{
        return Int64(a)
    }

    var result : Int64 = 0
    for i in small...big{
        result += Int64(i)
    }
    return result
}


//func solution(_ a:Int, _ b:Int) -> Int64 {
//    return Array((a < b) ? a...b : b...a).reduce(0, +)
//}
func solution6(_ a:Int, _ b:Int) -> Int64 {
    return Int64(Array((a < b) ? a...b : b...a).reduce(0, +))
}


func solution7(_ a:Int, _ b:Int) -> Int64 {
      var result = 0
    for t in a<b ? a...b : b...a {
        result += t
    }
    return Int64(result)
}


func solution8(_ a:Int, _ b:Int) -> Int64 {

        var nSum:Int = 0

        var nFirstNumber:Int = 0
        var nSecondNumber:Int = 0

        if a <= b {
            nFirstNumber = a
            nSecondNumber = b
        }
        else{
            nFirstNumber = b
            nSecondNumber = a
        }
        if nFirstNumber == nSecondNumber{
            return Int64(nSecondNumber)
        }

        for i in nFirstNumber...nSecondNumber {
            nSum += i
        }
        print(nSum)

    return Int64(nSum)
}


func solution9(_ a:Int, _ b:Int) -> Int64 {
    var sum: Int64 = 0
    let bigNumber: Int64 = a > b ? Int64(a) : Int64(b)
    let smallNumber: Int64 = a > b ? Int64(b) : Int64(a)


    for n in smallNumber...bigNumber {
        sum += n
    }

    return sum
}
