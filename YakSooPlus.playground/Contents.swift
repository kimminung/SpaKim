import UIKit

func solution(_ n:Int) -> Int {
    guard n >= 0, n <= 3000 else { return -1}

    return (1...n).filter{n%$0==0}.reduce(0,+)
}

func solution0(_ n:Int) -> Int {
    guard n >= 0, n <= 3000 else { return -1 }
    var total = 0
    for r in 1..<n+1 {
        if n % r == 0 {
            total += r
        }
    }
    return total
}

solution(13)


func solution2(_ n:Int) -> Int {
    guard n != 0 else {
        return 0
    }
    return Array(1...n).filter{n % $0 == 0}.reduce(0, +)
}


func solution3(_ n:Int) -> Int {
    return n != 0 ? (1...n).filter{n % $0 == 0}.reduce(0){$0 + $1} : 0
}
