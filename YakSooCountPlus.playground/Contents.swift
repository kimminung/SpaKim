import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    
    var result = 0
    
    for r in left..<right+1 {
        var count = 0
        for n in 1..<r+1{
            
            if r % n == 0 {
                count += 1
            }
            
        }
        if count % 2 == 0 {
            result += r
        } else {
            result -= r
        }
    }
    
    return result
}

solution(13, 17)

func solution00(_ left: Int, _ right: Int) -> Int {
    return (left...right).map { i in (1...i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i }.reduce(0, +)
}

func solution8(_ left:Int, _ right:Int) -> Int {
    var answer = 0
    for i in left...right {
        answer += Int(sqrt(Double(i))) * Int(sqrt(Double(i))) == i ? -i : i
    }

    return answer
}


//정유진님 코드
func solution2(_ left:Int, _ right:Int) -> Int {
    var result = 0
    for i in left...right{
        if Array(1...i).filter({i % $0 == 0 }).count % 2 == 0 {
            result += i
        } else {
            result -= i
        }
    }
    return result
}


func solution3(_ left: Int, _ right: Int) -> Int {
    return (left...right).map { i in (1...i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i }.reduce(0, +)
}


func solution4(_ left:Int, _ right:Int) -> Int {
    var answer = 0

    for number in left...right{
        if floor(sqrt(Double(number))) == sqrt(Double(number)) {
            answer -= number
        } else {
            answer += number
        }
    }
    return answer
}


func solution5(_ left:Int, _ right:Int) -> Int {
    return (left...right).map({ num -> Int in
        var count = 0

        for i in 1...num {
            if num % i == 0 {
                count += 1
            }
        }

        return count%2 == 0 ? num : -num
    }).reduce(0, +)
}


func solution6(_ left:Int, _ right:Int) -> Int {
    var sum = 0
    for n in (left...right) {
        var count = 0
        let submultiple = Int(sqrt(Double(n)))
        if submultiple * submultiple == n {
            count += 1
        }
        for i in (1..<submultiple) {
            if n.isMultiple(of: i) {
                count += 2
            }
        }

        if count % 2 == 0 {
            sum += n
        } else {
            sum -= n
        }
    }

    return sum
}


func solution7(_ left:Int, _ right:Int) -> Int {
    let arr = Array(left...right)
    var result:[Int] = []

    for number in arr {
        var count = 0
        for i in 1...number {

            if number % i == 0 {
                count += 1
            }
        }
        count % 2 == 0 ? result.append(number) : result.append(-number)
    }

    return result.reduce(0, +)
}

