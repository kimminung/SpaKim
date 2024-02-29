//신승현님 코드
func solution0(_ arr:[Int]) -> [Int] {
    
    var min: Int = arr[0]
    var num: Int = 0
    var result: [Int] = arr
    
    guard result.count >= 1 else {
        return [-2]
    }
    
    for i in 0..<result.count {
        if result.count == 1 {
            return [-1]
        } else if min > result[i] {
            min = result[i]
            num = i
        }
    }
    result.remove(at: num)
    
    return result
}

func solution1(_ arr:[Int]) -> [Int] {
    let min = arr.sorted(by: <)[0]
     return arr.count == 1 ? [-1] : arr.compactMap({ return $0 != min ? $0 : nil })
}


func solution2(_ arr:[Int]) -> [Int] {
    var index = 0
    var min: Int = Int.max
    var newArr: [Int] = []
    for i in 0..<arr.count {
        newArr.append(arr[i])

        if min > arr[i] {
            index = i
            min = arr[i]
        }
    }

    newArr.remove(at: index)
    if 0 == newArr.count {
        newArr.append(-1)
    }

    return newArr
}

func solution3(_ arr:[Int]) -> [Int] {
    var min:Int = Int.max
    var result: [Int] = arr
    for i in result {
        if i < min {
            min = i
        }
    }
    if let position = result.index(of:min) {
        result.remove(at:position)
    }
    if result.count == 0 {
        return [-1]
    }
    return result
}

func solution4(_ arr:[Int]) -> [Int] {
    var ans: [Int] = []
    var Oarr = arr

    guard arr.count != 1 else {
        ans.append(-1)
        return ans
    }

    Oarr.remove(at: arr.index(of: arr.min()!)!)

    ans = Oarr

    return ans
}

func solution5(_ arr:[Int]) -> [Int] {
    var answer = arr
    answer.remove(at:answer.index(of:answer.sorted { $0 < $1 }[0])!)
    return answer.isEmpty ? [-1] : answer
}

func solution6(_ arr:[Int]) -> [Int] {
    var answer = arr
    answer.remove(at:answer.index(of:arr.min()!)!)
    return answer.isEmpty ? [-1] : answer
}

func solution7(_ arr:[Int]) -> [Int] {
     var arr = arr
    if arr.count == 1 { return [-1] }
    if let min = arr.min() {
        arr.remove(at: arr.index(of: min)!)
    }
    return arr
}

func solution8(_ arr:[Int]) -> [Int] {
    var result = arr

    if result.count <= 1 {
        return [-1]
    } else {
        if let index = arr.index(of: arr.min()!) {
            result.remove(at: index)
            return result
        }else {
            return [-1]
        }
    }
}

func solution9(_ arr:[Int]) -> [Int] {
    var result = [Int]()
    guard arr.count != 1 else {
        result.append(-1)
        return result
    }

    var min : Int = arr[arr.startIndex]
    for n in arr {
        if min > n {
            min = n
        }
    }

    result = arr.filter({$0 != min})


    return result
}

func solution10(_ arr:[Int]) -> [Int] {
    var minIndex = 0;
    var min = arr[0];
    var r = [Int]();
    for i in 0..<arr.count {
        if arr[i]<min {
            minIndex = i
            min = arr[i]
        }
        r.append(arr[i])
    }
    r.remove(at: minIndex);
    return r.count == 0 ? [-1] : r;
}

func solution11(_ arr:[Int]) -> [Int] {
    var arr = arr

    if let index = arr.index(of: arr.min()!) {
        arr.remove(at: index)
    }

    return arr.count == 0 ? [-1] : arr
}

func solution12(_ arr:[Int]) -> [Int] {
    let small = arr.sorted(by: <)[0]
    var res = [Int]()
    if arr.count == 1 {
        res.append(-1)
    }
    else {
        for i in 0..<arr.count {
            if arr[i] != small { res.append(arr[i]) }
        }
    }
    return res
}


func solution13(_ arr:[Int]) -> [Int] {
    var arr = arr
    if arr.count < 2 {
        return [-1]
    }
    var i = 0

    for t in 0..<arr.count {
        i = arr[t] < arr[i] ? t : i
    }
    arr.remove(at: i)
    return arr
}

func solution14(_ arr:[Int]) -> [Int] {
    var ans = arr
    if (arr.count == 1) {
        ans[0] = -1
    } else {
        var minNum: Int = ans[0]
        var removeIndex: Int = 0
        for i in 0..<arr.count {
            for j in 0..<arr.count {
                if (arr[i] < minNum) {
                    minNum = arr[i]
                    removeIndex = i
                }
            }
        }
        ans.remove(at: removeIndex)
    }
    return ans
}

func solution15(_ arr:[Int]) -> [Int] {
    var arr = arr
    arr.remove(at: arr.index(of: arr.min()!)!)
    return arr.count > 0 ? arr : [-1]
}

func solution16(_ arr:[Int]) -> [Int] {

    var array = arr

    if let min = array.sorted().first,
        let index = array.index(of: min) {
        array.remove(at: index)
    }

    return (array.count > 0 ? array : [-1])
}

func solution17(_ arr:[Int]) -> [Int] {
    if arr.count == 1 {
        return [-1]
    }
    var ans: [Int] = arr
    var arrangeArr: [Int] = ans.sorted(by: >)
    var minimumValue: Int = arrangeArr[arrangeArr.count-1]
    var indexPosition: Int = 0
    for index in 0..<ans.count {
        if ans[index] == minimumValue {
            indexPosition = index
        }
    }
    ans.remove(at: indexPosition)
    return ans
}

func solution18(_ arr:[Int]) -> [Int] {

    if arr.count <= 1 {
        return [-1]
    }

    var arrTemp = [Int]()
    var minValue = arr[0]
    var minIndex = 0

    for i in 1..<arr.count {

        if arr[i] < minValue {
            minValue = arr[i]
            minIndex = i
        }

    }



    for i in 0..<arr.count {

        if i != minIndex {
            arrTemp.append(arr[i])
        }

    }


    return arrTemp
}




//망작
//최소값 소팅 알고리즘 적용된 코드
func solutionXX(_ arr: [Int]) -> [Int] {
    var arr: [Int] = arr
    guard arr.count >= 1 else {return [2]}
    //최저값 선택정렬 후 first를 날리고 arr에서 제외된 나머지를 결과로 하고싶었음.

    var removedArray = [Int]()

        for i in arr {
//            if !(removedArray.contains(i)) {
            if removedArray.contains(i) == false {
                removedArray.append(i)
            }
        }
    
//    let removedDuplicate: Set = Set(arr)
    
    // for swap
    var temp: Int?
    
    var drFirst:[Int] = []
    var index: Int
//    var array: [Int] = Array(removedDuplicate)
    var array: [Int] = removedArray //10, 0
    var result: [Int] = []
//    var array2: [Int] = Array(removedDuplicate)
    var array2: [Int] = removedArray
    var count = array.count //2
//    var drSecond: [Int] = []
    
    
    if count != 1 {
        for i in 0 ..< count {  //2
            var min: Int = array[i] //10
            index = i   //0
            
            for j in i + 1 ..< count {  //j = 0 + 1 ..< 2
                if (min > array[j]) {   //0
                    min =  array[j] //min = 0
                    index = j   //1
                }
                // for swap
                temp = array[j] //temp = 0
                array[j] = array[index] // 0 = 0
                array[index] = temp! // 0 = 0
                
//                array = [temp!] // [10, 0] = [0]
                //            array.swapAt(i, index)
                drFirst = Array(array.dropFirst()) //nil이어야됨..
//                    drFirst = Array(arrayLiteral: array.removeFirst())
            }
            
        }
        if array.isEmpty == false {
            // print(drFirst)
            for i in 0..<array2.count {
               var dr = array2[i]
                for j in 0..<drFirst.count {
                    var ar = drFirst[j]
                    if dr == ar {
                        result = result + Array(arrayLiteral: dr)
                        // break
                        // continue
                    } else {
                        continue
                    }
                }
            }
        } else {
            result = [-1]
            return result
        }
        
        
    //여기엔 arr에서 drFirst된걸 뺀 나머지를 result에 축적하고, 값이 nil이면 -1처리
    } else if array.first == nil {
        print(array)
        result = [-1]
        return result
    } else {
//        drFirst = Array(array.dropFirst())
//        if drFirst.first == nil {
            result = [-1]
            return result
//        }
    }
    

    
    
    return result
}

//solutionXX([5,9,2,1,1,1,6])
//solutionXX([0, 10, 10, 0])
solutionXX([10, 0, 0])
//solutionXX([10])
/*
 //최소값 소팅 알고리즘 적용된 망작 //순서 바뀌면 오답인듯ㅋ
 func solution(_ arr: [Int]) -> [Int] {
     
     //최저값 선택정렬 후 first를 날리고 arr에서 제외된 나머지를 결과로 하고싶었음.
     guard arr.count >= 1 else {return [2]}
     
     // for swap
          var temp: Int
          
     var drFirst:[Int] = []
     var index: Int
     var array: [Int] = arr
     var result: [Int] = []
 //    var drSecond: [Int] = []
         
         for i in 0 ..< arr.count {
             var min: Int = array[i]
             index = i
             
             for j in i + 1 ..< array.count {
                 if (min > array[j]) {
                     min =  array[j]
                     index = j
                 }
             }
             // for swap
                      temp = array[i]
                      array[i] = array[index]
                      array[index] = temp
                      
 //            array.swapAt(i, index)
         }
    drFirst = Array(array.dropFirst(1)) //원소 1개일때 한정 ㅋ
     // drFirst = Array(arrayLiteral: array.removeFirst())
     
     //여기엔 arr에서 drFirst된걸 뺀 나머지를 result에 축적하고, 값이 nil이면 -1처리
     if drFirst.first == nil {
         return result + [-1]
     } else {
         for i in 0..<array.count {
             for j in 0..<drFirst.count {
                 if i == j {
                     result += Array(arrayLiteral: arr[i])
                 } else {
                     continue
                 }
             }
         }
     }
     
     return result
 }
 */
