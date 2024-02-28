import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    var result = 0
    
    guard absolutes.count >= 1, absolutes.count <= 1000 else { return 0 }
    /*
    for element in absolutes {
        guard element.count >= 1 && element.count <= 1000 else {
            return 0
        }
    }
     */
    guard signs.count == absolutes.count else { return 0 }
    
    for i in 0...absolutes.count-1 {
        if signs[i] == true {
            result = result + Int(absolutes[i])
        } else {
            result = result + (Int(absolutes[i]) * -1)
        }
        
    }
    
    
    return result
}

solution([4,7,12], [true,false,true])


func solution1(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return (0..<absolutes.count).map { signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
}


func solution2(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    zip(absolutes, signs)
        .map { $1 ? $0 : -$0 }
        .reduce(0, +)
}


func solution3(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0

    for i in 0..<signs.count {
        answer += signs[i] == true ? absolutes[i] : -absolutes[i]
    }

    return answer
}


func solution4(_ absolutes:[Int], _ signs:[Bool]) -> Int {

    let n :Int = absolutes.count
    var sum: Int = 0

    for i in 0..<n {
        if signs[i] == true {
            sum += absolutes[i]
        } else {
            sum -= absolutes[i]
        }
    }
    return sum
}


func solution5(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    let merge = zip(absolutes,signs)
    var answer = 0

    merge.forEach {
        if $1 {
            answer += $0
        }else{
            answer -= $0
        }
    }

    return answer
}


func solution6(_ absolutes: [Int], _ signs: [Bool]) -> Int {
    var index = -1
    return absolutes.reduce(0) {
        index += 1
        return signs[index] ? $0 + $1 : $0 - $1
    }
}


func solution7(_ absolutes:[Int], _ signs:[Bool]) -> Int {

    var collection : [Int] = []

    for i in 0..<signs.count {
        if signs[i] {
            collection.append(absolutes[i])
        } else {
            collection.append(-absolutes[i])
        }
    }

    return collection.reduce(0, +)
}


func solution8(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0

    for i in 0..<absolutes.count {
        if signs[i] {
            result += absolutes[i]
        } else {
            result += absolutes[i] * -1
        }
    }

    return result
}


func solution9(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    zip(absolutes, signs).reduce(0) {
        $0 + ($1.1 ? $1.0 : -$1.0)
    }
}


func solution10(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return absolutes.enumerated().map {
        if !signs[$0.0] {
            return -$0.1
        }
        return $0.1
    }.reduce(0, +)
}


func solution11(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return absolutes.enumerated().map {
        if !signs[$0.0] {
            return -$0.1
        }
        return $0.1
    }.reduce(0, +)
}


func solution12(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0

    for i in 0..<signs.count {
        signs[i] ? (answer += absolutes[i]) : (answer -= absolutes[i])
    }

    return answer
}
