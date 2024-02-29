import UIKit


func solution2(_ arr:[Int], _ divisor:Int) -> [Int] {
    let array = arr.sorted().filter{ $0 % divisor == 0 }
    return  array == [] ? [-1] : array
}

func solution3(_ arr:[Int], _ divisor:Int) -> [Int] {
    let result = arr.filter{ $0 % divisor == 0}.sorted()
    return result.count == 0 ? [-1] : result
}

func solution4(_ arr:[Int], _ divisor:Int) -> [Int] {
    let result = arr.filter{ $0 % divisor == 0}.sorted()
    return result.isEmpty ? [-1] : result
}

func solution5(_ arr:[Int], _ divisor:Int) -> [Int] {
    var answer: [Int] = []
    for value in arr {
        if value%divisor == 0 {
            answer.append(value)
        }
    }
    return (answer.count == 0) ? [-1] : answer.sorted { $0 < $1 }
}

func solution6(_ arr:[Int], _ divisor:Int) -> [Int] {
    var result: [Int] = []
    result.append(contentsOf: arr.sorted().filter {
        $0 % divisor == 0
    })
    return result.count == 0 ? [-1] : result
}

func solution7(_ arr:[Int], _ divisor:Int) -> [Int] {
    let result = arr.filter { $0 % divisor == 0 }
    return result.count == 0 ? [-1] : result.sorted()
}

//잘 안됨
func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    
    var result : [Int] = []
    var count = 0
    
    for _ in 1...arr.count {
            if Int(arr[count]) % divisor == 0 {
                result.append(arr[count])
                result.sorted()
            } else {
                return result + [-1]
//                continue
            }
        count = count + 1
    }
    return result.sorted()
}

solution([5,9,7,10], 5)
//solution([2,36,1,3], 1)
//solution([3,2,6], 10)

/*
func sort(_ nonSorted:[Int]) -> [Int] {
    var nonSorted = nonSorted
    var sortCount = 0
    var total : [Int] = []
    
    while nonSorted.last == nonSorted.max(),
          nonSorted.first == nonSorted.min() {
        
        nonSorted[sortCount] > nonSorted[sortCount+1] ? total.append(nonSorted[sortCount] + (nonSorted[sortCount+1] - nonSorted[sortCount])) : sortCount + 1
        
    }
}*/

func solution0(_ arr:[Int], _ divisor:Int) -> [Int] {
    
    var arr = arr
    var result : [Int] = []
    var count = 0
    
    for _ in 1...arr.count {
            if Int(arr[count]) % divisor == 0 {
                result.append(arr[count])
                
            } else if Int(arr[count]) / divisor < 1 {
                    return result + [-1]
                }else if Int(arr[count]) / divisor == 0 {
                    return result + [-1]
                }
        //else if Int(arr[count]) / divisor == nil {
                 //   return result + [-1]
            //    }
        count = count + 1
    }
    return result.sorted()
}


func solution1(_ arr:[Int], _ divisor:Int) -> [Int] {
    var answer = [Int]()
    
    for i in 0 ..< arr.count {
        if arr[i] % divisor == 0 {
            answer.append(arr[i])
        }
    }
    
    if answer.count == 0 { answer.append(-1) }
    
    return answer.sorted()
}
