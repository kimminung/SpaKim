import Cocoa

//소인수분해(factorization)

 func solution(_ n:Int) -> [Int] {
         var num = n
         var count = 2
         var result = [Int]()

         while num > 1 {
             if num % count == 0 {
                 num /= count
                 result.append(count)
             } else {
                 count += 1
             }
         }
     return Array(Set(result)).sorted()
 }
solution(2022)

func solution1(_ n:Int) -> [Int] {
    var n = n
    var answer: [Int] = []
    for div in (2...n) {
        while n % div == 0 {
            n /= div
            if !answer.contains(div) {
                answer.append(div)
            }
        }
    }

    return answer
}
func solution2(_ n:Int) -> [Int] {
    var answer = Set<Int>()
    var i = 2
    var n = n
    while i <= n {
        if n % i == 0 {
            answer.insert(i)
            n /= i
            i = 2
            continue
        }
        i += 1
    }
    return Array(answer).sorted(by: <)
}
func solution3(_ n:Int) -> [Int] {
    var value : [Int] = []
    var value_set : Set<Int> = []
    var n_c = n
    var n_c_befor = 0
    var I = 2

    while true {
        while true {
            if n_c % I == 0{
                n_c = n_c / I
                value_set.insert(I)
            }
            if n_c_befor == n_c { break }

            n_c_befor = n_c
        }
        if I >= n_c { break }
        I += 1
    }

    for J in value_set {
        value.append(J)
    }
    value = value.sorted()
    return value
}
func solution4(_ n:Int) -> [Int] {
    var result: [Int] = []

    for i in (2...n) {
        if n % i == 0 && !result.contains(where: { i % $0 == 0}) {
            result.append(i)
        }
    }

    return result
}
func solution5(_ n:Int) -> [Int] {
    var numSet = Set<Int>()
    var num = n

    for i in 2...n {
        while num % i == 0 {
            num /= i
            numSet.insert(i)
        }
    }

    return Array(numSet).sorted()
}
/*
func solution(_ n:Int) -> [Int] {
    // 결과 담을 Container
    var result = [Int]()
    // 소인수분해 할 수
    var num = n
    // 나눌 값
    var x = 2

    while num != 1 {
        if num % x == 0 {
            num /= x
            result.append(x)
        } else {
            x += 1
        }
    }

    return Array(Set(result)).sorted(by: <)
}
*/
