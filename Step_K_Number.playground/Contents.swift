import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    guard array.count >= 1, array.count <= 100 else {return [0]}
    for i in array {
        //        guard array[i] >= 1, array[i] <= 100 else {return [0]}
        guard i >= 1, i <= 100 else {return [0]}
    }
    guard commands.count >= 1, commands.count <= 50 else {return [0]}
    for i in commands {
        //        guard commands[commands[i]].count == 3 else {return [0]}
        //        guard commands[i].count == 3 else {return [0]}
        //        guard commands[i.count].count == 3 else {return [0]}
        guard i.count == 3 else {return [0]}
    }
    
//    var tmp = [[Int]]()
//    
//    for x in commands {
//        print(x)
//        for y in commands {
//            print(y)
//            tmp.append([1])
//        }
//    }
//    tmp
//    
//    return []
//}
    
//빠르게 찾아본 코드
    var result = [Int]()
    
    for i in 0..<commands.count {
        var arr = [Int]()
        for j in (commands[i][0]-1)...(commands[i][1]-1){
            arr.append(array[j])
        }
        arr.sort(by: <)
        result.append(arr[commands[i][2] - 1])
    }
    return result
}

//
func solution14(_ array:[Int], _ commands:[[Int]]) -> [Int] { return commands.map{ let i = $0[0]-1; let j = $0[1]-1; let k = $0[2]-1
    return array[i...j].sorted()[k]}
}
//
func solution13(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map { array[$0[0] - 1 ..< $0[1]].sorted()[$0[2] - 1] }
}

//고차
func solution1(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map({(key) in
        return array[(key[0]-1)...(key[1]-1)].sorted()[key[2]-1]
    })
    //(key)부터 return까지 제거하고, key를 $0으로 바꿔도 잘 돌아갑니다. :)
    }

//
func solution8(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var resultArr: [Int] = []

    for arr in commands {
        resultArr.append(array[(arr[0]-1)...(arr[1]-1)].sorted()[arr[2]-1])
    }

    return resultArr
}

//
func solution9(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    commands.forEach {
        var arr = Array(array[($0[0]-1)..<$0[1]])
        let arr2: [Int] = arr.sorted()
      //  let idx = $0[2]
        //print(arr2[1])
        result.append(arr2[$0[2]-1])
    }
    return result
}

//
func solution92(_ array:[Int], _ commands:[[Int]]) -> [Int] {
var result: [Int] = []
commands.forEach {
    var tmpArray = array[($0[0]-1)..<$0[1]]
    result.append(tmpArray.sorted()[$0[2]-1])
}
return result
}

//
func solution10(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.reduce(into: []) {
        $0.append(array[($1[0]-1)...($1[1]-1)].sorted(by: <)[$1[2]-1])
    }
}

//
func solution11(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map { command -> Int in
        let startIndex = command[0] - 1
        let lastIndex = command[1]
        let targetIndex = command[2] - 1

        let sliced = Array(array[startIndex..<lastIndex])
        let sorted = sliced.sorted(by: <)
        let target = sorted[targetIndex]
        return target
    }
}

//클로저
func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    for temp in commands {
        let i = temp[0] - 1
        let j = temp[1] - 1
        let k = temp[2] - 1
        
        var tempArr = array[i...j]
        tempArr.sort{$0 < $1}
        
        let tempArr2 = Array(tempArr)
        result.append(tempArr2[k])
    }
    return result
}

//
func numberSort3(_ array: [Int],_ one: Int , _ two: Int) -> Array<Int> {
    var arr = Array<Int>()
    if one < two {
        for one in one...two {
            arr.append(array[one])
        }
    }else {
        for two in two...one {
            arr.append(array[two])
        }
    }
    return arr
}

func solution3(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = Array<Int>()
    var sort = Array<Int>()
    for index in 0..<commands.count {
        var arrayIndex = commands[index]
        sort = numberSort3(array,arrayIndex[0]-1 , arrayIndex[1]-1)
        sort.sort()
        let num = sort[arrayIndex[2]-1]
        result.append(num)
        
    }
    return result
}


//
func solution4(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    for temp in commands {
        let i = temp[0] - 1
        let j = temp[1] - 1
        let k = temp[2] - 1
        
        var tempArr = array[i...j]
        tempArr.sort{$0 < $1}
        
        let tempArr2 = Array(tempArr)
        result.append(tempArr2[k])
    }
    return result
}


//
func solution5(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map({ (command) -> Int in
        let newArray = array[(command[0] - 1)..<command[1]]
        return newArray.sorted(by: { $0 < $1 })[command[2] - 1]
    })
}

//popFirst()
func solution6(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var returnArray : [Int] = []
    for command in commands {
        var tempArray = array[command[0]-1..<command[1]]
        tempArray.sort()
        
        for count in 0..<tempArray.count{
            if((command[2] - 1) <= count){
                returnArray.append(tempArray.popFirst()!)
                break
            }else{
                tempArray.popFirst()
            }
        }
    }
    return returnArray
}
    
//
func calculateKthNumber7(array: [Int], command: [Int]) -> Int {
    let commandIndexes = command.map{ $0 - 1 }
    let firstIndex = commandIndexes[0]
    let lastIndex = commandIndexes[1]
    let kthIndex = commandIndexes[2]
    let sortedFragment = array[firstIndex...lastIndex]

    return sortedFragment.sorted()[kthIndex]
}

func solution7(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    let kthNumbers = commands.map {
        return calculateKthNumber7(array: array, command: $0)
    }
    return kthNumbers
}

func solution12(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    
    for command in commands {
        let (i, j, k) = (command[0], command[1], command[2])
        result.append(array[i - 1 ... j - 1].sorted(by: <)[k - 1])
    }
    return result
}

    //망작
/*
    var tmp = [Int]()
    
    for i in 0..<array.count {
        var cnt1 = 0
        if i != (commands[cnt1][0])-1 {
            cnt1 += 1
            continue
        } else {
            var cnt2 = 0
            for j in 0...array[(commands[cnt2][1])-1] {
                tmp.append(array[i+j])
                cnt2 += 1
            }
            cnt1 += 1
//            break
        }
    }
    tmp.sorted()
    tmp
    return []
}*/

solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])
