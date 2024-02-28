import UIKit

func solution(_ n:Int64) -> Int64 {
    guard n >= 1, n <= 8000000000 else {return -1}
    
    var sprtd = n
    var str : [String]=[]
    var result = str.sorted()
    
    while sprtd > 0 {
            str.append(String(sprtd % 10))
            sprtd /= 10
        }
    
    return
}

solution(118372)




func solution2(_ n:Int64) -> Int64 {
    return Int64(String(Array(String(n)).sorted { $0 > $1 }))!
}



func solution3(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted{ $0 > $1 }))!
}



func solution4(_ n:Int64) -> Int64 {
    return Int64(String(n).sorted(by: >).reduce("") {String($0) + String($1)})!
}



func solution5(_ n:Int64) -> Int64 {
    var arr:[Character] = []
    var result:String = ""
    for char in String(n) {
        arr.append(char)
    }
    arr.sort(by: >)
    for char in arr {
        result += String(char)
    }
    if let value = Int64(result) {
        return value
    }
    return 0
}




func solution6(_ n:Int64) -> Int64 {
    var list: [Int] = []
    var val = n

    while val > 0 {
        list.append(Int(val % 10))
        val /= 10
    }

    list.sort { $0 < $1 }
    val = 1

    var answer: Int64 = 0


    while list.count > 0 {
        answer += Int64(list.removeFirst()) * val
        val *= 10
    }

    return answer
}




func solution7(_ n:Int64) -> Int64 {
    var result : [String] = []
    var number = n
    while(number>0){
        result.append(String(number%10))
        number = number / 10
    }
    result.sort(by:>)

    var temp : String = ""
    for i in result
    {
        temp += i
    }
    return Int64(temp)!
}




func solution8(_ n:Int64) -> Int64 {
    var strQuestion: String = String(n)
        var arrQuestion: [String] = []
        var arrResult: [String] = []
        var strResult: String = ""

        for i in strQuestion {
            arrQuestion.append(String(i))
        }
        arrResult = arrQuestion.sorted(by: >)
        print(arrResult)

        for i in arrResult {
            print(i)
            strResult.append(String(i))
        }
        print("strResult-[\(strResult)]-[\(Int64(strResult)!)]")
    return Int64(strResult)!
}




func solution9(_ n:Int64) -> Int64 {
    let number = String(n)
    var str = ""
    for char in number.sorted() {
        str.append(char)
    }
    return Int64(String(str.reversed()))!
}



func solution10(_ n:Int64) -> Int64 {
    var result = [Int]()

    for value in String(n) {
        result.append(Int(String(value))!)
    }

    var total = 0
    return result.sorted { $0 > $1 }.reduce(0, { (index, value ) in
        if index == 0 {
            total += value
            return Int64(total)
        }else {
            total = total * 10 + value
            return Int64(total)
        }
    })
}




func solution11(_ n:Int64) -> Int64 {
    var result : Int64 = 0
    var tmparray = [Int64]()
    var temp : Int64 = n

    while temp != 0 {
        tmparray.append(temp % 10)
        temp /= 10
    }

    tmparray = tmparray.sorted(by: {(a : Int64, b : Int64) -> Bool in
        return a > b
        })

    print(tmparray)

    for n in tmparray {
        result = result * 10 + n
    }


    return result
}
