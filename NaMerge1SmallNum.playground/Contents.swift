import Foundation

//망작
/*
func solutionX(_ n:Int) -> Int {
    var cmpt:[Int] = n.filter{$0 % $1 == 1}.min
    var result = Int(cmpt)
    return result
}*/

func solution(_ n:Int) -> Int {
    var total = 0
    for r in 1...1000000 {
        if (n) % r == 1 {
            return total + r
//            break
        } else {
             r + 1
            continue
        }
    }
    return total
}


func solution2(_ n:Int) -> Int {
    var count = 1
    while true {
        if (n % count) == 1 {
            break
        }
        count += 1
    }

    return count
}


func solution3(_ n: Int) -> Int {
    var answer = 1

    while n % answer != 1 {
        answer += 1
    }
    return answer
}


func solution4(_ n:Int) -> Int {
    var answer = [Int]()
    for i in 1..<n {
        if n % i == 1 {
            answer.append(i)
        }
    }
    answer.sort(by: <)
    return answer.first!
}



func solution5(_ n:Int) -> Int {
    var result: [Int] = []

    for i in 1...n {
        if n % i == 1 && n >= 3 {
            result.append(i)
        }
    }
    return result.min()!
}



func solution6(_ n:Int) -> Int {
    return (1...n).filter{n % $0 == 1}.min()!
}

func solution8(_ n:Int) -> Int {
    return (1..<n).filter { n % $0 == 1 }[0]
}

func solution9(_ n:Int) -> Int {
    return Range(1...n-1).filter{n % $0 == 1}.first!
}

func solution10(_ n:Int) -> Int {
    return (1...n).filter { n % $0 == 1 }.sorted(by: <).first!
}

/*
 func solution(_ n:Int) -> Int {
     guard n % 2 == 0 else { return 2 }
     let divisors = divisorsArray(of : n - 1).dropFirst()
     return divisors.first!
 }

 func divisorsArray(of n : Int) -> [Int] {
     var array = [Int]()
     let sqrtValue = Int(sqrt(Double(n)))
     for i in 1...sqrtValue {
         if n % i == 0 { array.append(i); array.append(n/i) }
     }
     if sqrtValue * sqrtValue == n { array.removeLast() }

     return array.sorted()
 }
 */

/*
 import Foundation

 func findOne(_ num:Int) -> Int {
     for i in 2 ..< num {
         if num % i == 1 {
             return i
         }
     }
     return 0
 }

 func solution(_ n:Int) -> Int {
     var answer = 0
     answer = findOne(n)
     return answer
 }
 */



func solution7(_ n:Int) -> Int {
    var answer = 0
    for i in stride(from: n-1, to: 1, by: -1) {
        if(n%i == 1){
            answer = i
        }
    }
    return answer
}

/*
 func sosuF(_ n:Int)->Int{


     var sosu = 0
     for num in (2...n){
         if (n) % num == 0 {
             sosu += 1
         }
     }
     return sosu == 1 ? 1 : 0
 }
 func moks(int:Int)->Int{
     for i in (2...1000000){
         if int % i == 0 {
             return i
         }
     }
     return 0
 }
 func solution(_ n:Int) -> Int {
     if n % 2 != 0 {
         return 2
     }
     else {
         if sosuF(n-1) == 1{
             return n - 1
         }
         else {return moks(int:n-1)}
     }

     return 0
 }
 */
