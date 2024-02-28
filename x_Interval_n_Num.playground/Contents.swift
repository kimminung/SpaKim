import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    guard x >= -10000000, x <= 10000000, n <= 1000 else {return []}
//    var result = [Int64]() //초기화
    var result : [Int64] = []
        for r in 1...n {
            result.append(Int64(r*x))
    }
    return result
}


func solution2(_ x:Int, _ n:Int) -> [Int64] {
    var arr: [Int] = []

    for num in 1...n {
        arr.append(x * num)
    }

    return arr.map {
        Int64($0)
    }
}


func solution3(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map { Int64($0 * x) }
}


func solution4(_ x:Int, _ n:Int) -> [Int64] {
    return (1...n).map{Int64(x) * Int64(($0))}
}

func solution5(_ x:Int64, _ n:Int64) -> [Int64] {
    var numbers: [Int64] = []
    
    // guard문으로 제한 조건 확인하기
    guard (x >= -10000000 && x <= 10000000) && (n <= 1000) else {
        return []
    }
    
    for i in 1...n {
        numbers.append(Int64(i * x)) // x, i가 Int이므로 Int64로 변환
    }
    return numbers
}

solution5(4, 3)
