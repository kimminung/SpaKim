import Foundation


func solutionXXX(_ numbers:[Int]) -> Int {
    
    guard numbers.count >= 1, numbers.count <= 9 else {return -1}
    
    guard numbers.min()! >= 0 && numbers.max()! <= 9 else {return -1}
    
    // guard
    
    var count = 0
    //    [0, 0, 0, 0, 0, 0, 0]
//    let origin = Array(repeating: 0, count: numbers.count-1)
    //    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let origin = Array(0...9)
//    let origin = AnySequence(0...numbers.count)
    print(origin)
    var orgTotal = 0
    
    for x in 0...origin.count-1 {
        orgTotal += origin[x]
    }
        
        //co: 0     //num.co: 7
    while count < numbers.count {
//        print(count)
                    //
        for x in 0...origin.count-1 {
//            print(x)
            if numbers[count] != origin[x] {
                print("num:\(numbers[count])")
                print("org\(origin[x])")
                continue
            } else if numbers[count] == origin[x] {
                print("num:\(numbers[count])")
                print("org\(origin[x])")
                orgTotal = orgTotal - origin[x]
            }
        }
            count = count + 1
    }
//    print(count)
    return orgTotal
}

solutionXXX([5,8,4,0,6,7,9])


func solution1(_ numbers: [Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}


//import Foundation

func solution2(_ numbers:[Int]) -> Int {
    return 45-numbers.reduce(0, +)
}


func solution3(_ numbers:[Int]) -> Int {
    var numbers_temp : [Int] = []
    var answer = 0
    numbers_temp = numbers.sorted()
    numbers_temp.append(10)
    numbers_temp.append(10)
    numbers_temp.append(10)
    numbers_temp.append(10)
    numbers_temp.append(10)
    for i in 0...9 {
        if numbers_temp[i] != i {
            answer += i
            numbers_temp.insert(i, at: i)
        }
    }

    return answer
}


func solution4(_ numbers:[Int]) -> Int {

    var answer = 0
    for n in 0...9 {
        if !numbers.contains(n) {
            answer += n
        }
    }
    return answer
}


func solution5(_ numbers:[Int]) -> Int {
    var resut = 0
        for i in 1..<10
        {
            if !numbers.contains(i)
            {
                resut += i
            }
        }
        return resut
}


func solution6(_ numbers:[Int]) -> Int {
     return Array(0...9).map{numbers.contains($0) ? 0 : $0}.reduce(0,+)
}


func solution7(_ numbers:[Int]) -> Int {
    var result = 0

    for number in 1...9 {
        if !(numbers.contains(number)) {
            result += number
        }
    }

    return result
}


func solution8(_ numbers:[Int]) -> Int {
    return [Int](1...9).reduce(0) { $0 + $1 } - numbers.reduce(0) { $0 + $1 }
}


/*
let array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var answer = 0
var sum1 = 0
var sum2 = 0

func solution9(_ numbers:[Int]) -> Int {
    sum1 = array.reduce(0) { $0 + $1 }
    sum2 = numbers.reduce(0) { $0 + $1 }
    answer = sum1 - sum2

    return answer
}
*/


func solution10(_ numbers:[Int]) -> Int {
    var nums = Array(0...9)

    return nums.filter{!numbers.contains($0)}.reduce(0, +)
}


/* foundation 2개?
//import Foundation

//import Foundation

func solution11(_ numbers:[Int]) -> Int {
    var set: Set<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let tmp = Set(numbers)
    set = set.subtracting(tmp)
    let arr = Array(set).sorted()
    var idx = 0
    var ret = 0
    while (idx < arr.count){
        ret += arr[idx]
        idx += 1
    }
    return ret
}
*/


func solution12(_ numbers:[Int]) -> Int {

    var check:[Bool] = Array(repeating: false, count: 10)
    var ret = 0
    numbers.forEach{
        if check[$0] == false{
            check[$0] = true
        }
    }
    for i in 0..<check.count{
        if check[i] == false{
            ret += i
        }
    }
    return ret
}


func solution13(_ numbers:[Int]) -> Int {
    var numberCheck: [Int?] = []
    for i in 0...9 {
        numberCheck.append(i)
    }

    numbers.forEach { number in
        numberCheck[number] = nil
    }

    return numberCheck.compactMap({ $0 }).reduce(0, +)
}
