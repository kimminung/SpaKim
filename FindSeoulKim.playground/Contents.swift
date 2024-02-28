import UIKit
//답만 맞고, 코테 실패
func solution(_ seoul:[String]) -> String {
    guard seoul.count <= 1000, seoul.count >= 1,
//          seoul.ㅁㅁ <= 20, seoul.capacity >= 1,
          seoul.contains("Kim") == true else {return "Error"}
    for element in seoul {
        guard element.count >= 1 && element.count <= 20 else {
            return ""
        }
    }
    var seoul = seoul
    
    var count = 0
    for _ in seoul.startIndex...seoul.endIndex{
        
        if seoul.first == "Kim" {
            return String("김서방은 \(count)에 있다")
        } else {
            seoul.removeFirst()
            count += 1
//            return String("false")
            continue
        }
    }
    return String(count)
//    return String("김서방은 \(count)에 있다")
}
    
solution(["Jane","a" ,"Kim"])
    /*
     for element in seoul {
         guard element.count >= 1 && element.count <= 20 else {
             return ""
         }
     */
    
    /*
     extension Collection {
     subscript (safe index: Index) -> Element? {
     return indices.contains(index) ? self[index] : nil
     }
     }
     */
    
    /*
    let arr = ["a", "aa", "aaa", "aaaa", "aaaaa", "aaaaaa"]

    func getElementCount(_ index: Int) -> Int {
        guard let value = arr[safe: index] else { return 0 }
        return value.count
    }

    (-5..<10).forEach {
        print("\($0) : \(getElementCount($0))")
    }

    /*
    [RESULT]
    -2 : 0
    -1 : 0
    0 : 1
    1 : 2
    2 : 3
    3 : 4
    4 : 5
    5 : 6
    6 : 0
    7 : 0
    */
    */

/*
 if seoul.count < 1 || seoul.count > 1000 {
         return "Error"
     }
 */

func solution00(_ seoul:[String]) -> String {
    guard seoul.count >= 1 && seoul.count <= 1000 else {
        return ""
    } // seoul은 길이 1 이상, 1000 이하인 배열입니다.
    for element in seoul {
        guard element.count >= 1 && element.count <= 20 else {
            return ""
        }
    } // seoul의 원소는 길이 1 이상, 20 이하인 문자열입니다.
   guard seoul.contains("Kim") else {
       return ""
   } // Kim은 반드시 seoul 안에 포함되어 있습니다.
    let index = seoul.firstIndex(of: "Kim")
    if let index = index {
        return "김서방은 \(index)에 있다"
    }
    return ""
}
solution00(["Janealdnjckejdjnfkfjehdjcjdjkdgf","a" ,"Kim"])

func solution0(_ seoul:[String]) -> String {
    for element in seoul {
        guard element.count >= 1 && element.count <= 20 else {
            return ""
        }
    }
    var result: String?

    if seoul.count >= 1 && seoul.count < 1000 {
        for name in seoul {
            if name.count > 1 && name.count < 20 {
                for i in 0...seoul.count - 1 {
                    if seoul[i] == "Kim" {
                        result = "김서방은 \(i)에 있다"
                    }
                }
            }
        }
    }

    guard let realResult = result else {
        return ""
    }
    return realResult
}

func solution2(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.index(of: "Kim")!)에 있다"
}


func solution3(_ seoul:[String]) -> String {
    for i in 0..<seoul.count {
        if seoul[i] == "Kim" {
            return "김서방은 \(i)에 있다"
        }
    }
    return ""
}


func solution4(_ seoul:[String]) -> String {
    var position = -1
    for (idx,value) in seoul.enumerated() {
        if value == "Kim" {
            position = idx
        }
    }

    return "김서방은 \(position)에 있다"
}


func solution5(_ seoul:[String]) -> String {
    var ans = ""
    for (index, names) in seoul.enumerated() {
        if (names == "Kim") {
            ans = "김서방은 \(index)에 있다"
        }
    }
    return ans
}


func solution6(_ seoul:[String]) -> String {
    for element in seoul {
        guard element.count >= 1 && element.count <= 20 else {
            return ""
        }
    }
    for search in 0..<seoul.count
    {
        let index = seoul.index(seoul.startIndex, offsetBy:search)
        if(seoul[index] == "Kim")
        {
            return "김서방은 " + String(search) + "에 있다"
        }
    }
    return ""
}


func solution7(_ seoul:[String]) -> String {
    var strTmp: String =  ""


    if let index = seoul.index(of: "Kim") {
        strTmp =  "김서방은 \(index)에 있다"
        }
            return strTmp
}

