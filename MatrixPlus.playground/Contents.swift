import UIKit

//송동익님 코드
func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    guard arr1.count <= 500 && arr2.count <= 500 else {return []}
    var arr : [[Int]] = []
    
    arr = zip(arr1,arr2).map{zip($0,$1).map{$0+$1}}

    
    return arr
}

//신승현님 코드   //런타임에러 통과 못함
func solutionX(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    guard arr1.count <= 500 && arr2.count <= 500 else {
        return [];
    }
    
    var result: [[Int]] = arr1;
    
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            result[i][j] += arr2[i][j];
        }
    }
    return result;
}


//연습
/*
func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
//    guard arr1.endIndex < 500, arr2.endIndex < 500 else {return []}
    var result = [[Int]]()
//    result = Int(arr1[0]) + arr2[0] && arr1.last! + arr2.last!
//    result = [arr1[0]  arr2[0]]
    
    for i in arr1 {
        var row = [Int]()
        for j in arr1 {
            row.append(0)
        }
        result.append(row)
    }
    print(arr1[0][0]+arr2[0][0])
    print(arr1[1][1]+arr2[1][1])
    print(arr1[1][0]+arr2[1][0])
    print(arr1 + arr2)
    print(arr1[0]+arr2[0])
    print(arr1[0].first!+arr2[0].first!)
    print(arr1[0],arr1[1])
    print([arr1[0]])
    print(arr1[0][1])
    print([arr1[0][1]])
    print([[arr1.count]])
    print([[arr1].count])
    print([[arr1]].count)
    print(arr1.count)
    print([arr1].count)
    print(arr1.first!)
    print([[arr1]].endIndex)
    print([[arr1]].first!)
    print([[arr1]].last!)
    print(arr1.first!)
    print(arr1.last!)
    print([arr1].first!)
    print([[[arr1]]].first!)
    return result
}

solution([[1,2],[2,3]], [[3,4],[4,6]])
//solution([[1],[2]], [[3],[4]])
*/


func solution1(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arr: [[Int]] = []

    for n in 0..<arr1.count {
        var temp:[Int] = []
        for m in 0..<arr1[n].count {
            temp.append(arr1[n][m] + arr2[n][m])
        }
        arr.append(temp)
    }

    return arr
}
solution1([[1,2],[2,3]], [[3,4],[4,6]])


func solution2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arr3:[[Int]] = Array(repeating:Array(repeating:0, count:arr1[0].count), count:arr1.count)
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            arr3[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return arr3
}


func solution3(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer: [[Int]] = arr1
    for i in 0...arr1.count-1 {
        for j in 0...arr1[i].count-1 {
            answer[i][j] += arr2[i][j]
        }
    }
    return answer
}


func solution4(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var i = 0, j = 0

    return arr1.map { (numbers) -> [Int] in
        defer {
            i += 1
            j = 0
        }
        return numbers.map { (number) -> Int in
            defer {
                j += 1
            }
            return number + arr2[i][j]
        }
    }
}

func solution5(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
 let capacity = arr1[0].count
    var count = 1
    var outCount = 0
    var newArr = arr1.flatMap { $0 }
    var newArr2 = arr2.flatMap { $0 }
    var result = arr1

    for index in 0...newArr.count-1 {
        newArr[index] = newArr[index] + newArr2[index]
    }
    if newArr.count == 2 {
        return [[newArr[0]], [newArr[1]]]
    }

    for num in newArr {
        if count == capacity+1 {
            outCount += 1
            count = 1
        }

        result[outCount][count-1] = num
        count += 1
    }
    return result
}


func solution6(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result : [[Int]] = [[Int]]()
    var resultIn : [Int] = [Int]()

    for (index,value) in arr1.enumerated() {

        for (index2, value2) in value.enumerated() {
            resultIn.append(Int(value2) + Int((arr2[index])[index2]))
        }

        result.append(resultIn)
        resultIn.removeAll()
    }

    return result
}


func solution7(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var size1 : Int, size2 : Int
    size1 = arr1.count
    size2 = arr1[arr1.startIndex].count

    for i in 0..<size1 {
        var t = [Int]()
        for j in 0..<size2 {
            var temp : Int = arr1[arr1.index(0, offsetBy: i)][arr1[i].index(0, offsetBy: j)] + arr2[arr2.index(0, offsetBy: i)][arr2[i].index(0, offsetBy: j)]
            t.append(temp)
        }
        result.append(t)
    }

    return result
}


func solution8(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var r : [[Int]] = arr1;
    for i in 0..<arr1.count {
        for j in 0..<arr1[0].count {
            r[i][j]=r[i][j]+arr2[i][j];
        }
    }
    return r;
}


func solution9(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var res = [[Int]]()
    for i in 0..<arr1.count {
        var temp1 = arr1[i]
        var temp2 = arr2[i]
        var mid = [Int]()
        for j in 0..<temp1.count {
            mid.append(temp1[j]+temp2[j])
        }
        res.append(mid)
    }

    return res
}


func solution10(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var ans = arr1
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            ans[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return ans
}
