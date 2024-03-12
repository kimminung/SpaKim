import Foundation
func solution(_ strings:[String], _ n:Int) -> [String] {
    
    guard strings.count >= 1, strings.count <= 50 else {return ["내용물이 너무 많거나 없다."]}
    
    guard let regex = try? NSRegularExpression(pattern: "^[a-z]*$") else { return ["영문 소문자만 가능하다."] }
    
    for i in strings{
        let range = NSRange(location: 0, length: i.utf16.count)
        guard regex.matches(in: i, range: range).count > 0 else { return ["영문 소문자로 입력해라."] }
        guard i.count >= 1, i.count <= 100 else {return ["글자 길이는 1 이상, 100 이하다."]}
        guard i.count > n else {return ["입력을 n보다 크게 설정해라."]}
    }
    var temp = [String]()
    var result = [String]()
    
    //guard n의 값이 겹치면 사전순 빠른것 먼저 정렬.. n의 값이 같은것 x번을 비교.. 후 정렬.
    //하나만 틀리다는 보장이 없으니 스칼라의 합도 의미가 없겠고..
    //원소의 앞글자부터 맵이나 포문 돌려 알파벳순 걸러야겠군.
    //꼭 연이어서 비슷하게 입력될 가능성은 적으니 따로 떨어진 애들이 비슷한 경우를 생각해두면.. 스왑 방법을 알면 좋지만, 그것들만 0 / 1로 구분해줘서 바꿔야겠군.
    for x in strings {
//        print(x.index(x.startIndex, offsetBy: n))
        temp.append("\(x[x.index(x.startIndex, offsetBy: n)])\(x)")
    }
    temp.sort()
    
    for r in temp {
            
//        temp.remove(at: x[x.index(x.startIndex, offsetBy: 0)])
//        result.append("\(r[r.index(after: )])")
//        result.append(r.dropFirst())
//        let a = r.dropFirst()
        result.append(String(r.dropFirst()))
    }
    
    return result
}

//solution(["asdsad","abc","dssda"], 2)
solution(["bue","cab","auea"], 1)


//
/*
func solution(_ strings:[String], _ n:Int) -> [String] {
  let sortedArr = strings.sorted { (front, behind) -> Bool in
    let frontIndex = front.index(front.startIndex, offsetBy: n)
    let behindIndex = behind.index(behind.startIndex, offsetBy: n)
    
    if front[frontIndex] == behind[behindIndex] {
      return front < behind
    }
    return front[frontIndex] < behind[behindIndex]
  }
  return sortedArr
}
*/


//
func solution1(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted{  Array($0)[n] == Array($1)[n] ? $0 < $1 :  Array($0)[n] < Array($1)[n] }
}


//
func solution2(_ strings:[String], _ n:Int) -> [String] {
    let answer: [String] = strings.sorted {
        let left: Character = $0[$0.index($0.startIndex, offsetBy: n)]
        let right: Character = $1[$1.index($1.startIndex, offsetBy: n)]

        if left == right {
            return $0 < $1
        } else {
            return left < right
        }
    }

    return answer
}


//
func solution3(_ strings:[String], _ n:Int) -> [String] {
    var result = strings.sorted { (a, b) -> Bool in
    for index in n...a.count-1 {
        if Array(a)[index] == Array(b)[index] {
            return a < b
        } else {
            return Array(a)[index] < Array(b)[index]
        }
    }
    return a < b
}
    return result
}


//
func solution4(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted { (a, b) -> Bool in
        if a[String.Index(encodedOffset: n)]  == b[String.Index(encodedOffset: n)] {
            return a < b
        } else {
            return a[String.Index(encodedOffset: n)]  < b[String.Index(encodedOffset: n)]
        }
    }
}


//
func solution5(_ strings:[String], _ n:Int) -> [String] {
    var result:[String] = strings
    for i in 0..<result.count {
        var min:String = result[i]
        var location:Int = i
        for j in i+1..<result.count {
            if min[min.index(min.startIndex, offsetBy: n)] > result[j][result[j].index(result[j].startIndex, offsetBy: n)] || (min[min.index(min.startIndex, offsetBy: n)] == result[j][result[j].index(result[j].startIndex, offsetBy: n)] && min > result[j]) {
                min = result[j]
                location = j
            }
        }
        if i != location {
//            swap(&result[i], &result[location]) 예전버전
            result.swapAt(i, location)
        }
    }
    return result
}
solution5(["bue","cab","auea"], 1)


//
func solution6(_ strings:[String], _ n:Int) -> [String] {
        var strArr = strings
    var chArr: [Character] = []
    var ansArr: [String] = []
    let index = String.Index(encodedOffset: n)

    for str in strings {
        chArr.append(str[index])
    }

    for n in 0..<strings.count-1 {
        var min = n
        for m in (n+1)..<strings.count {
            if chArr[min] > chArr[m] {
                min = m
            }
            if chArr[min] == chArr[m] && strArr[min] > strArr[m] {
                    min = m
            }
        }

        var temp: String
        temp = strArr[min]
        strArr[min] = strArr[n]
        strArr[n] = temp

        var chTemp: Character
        chTemp = chArr[min]
        chArr[min] = chArr[n]
        chArr[n] = chTemp
    }

    return strArr
}


//
func solution7(_ strings:[String], _ n:Int) -> [String] {
    var result = strings.sorted { (a, b) -> Bool in
    if Array(a)[n] == Array(b)[n] {
        return a < b
    } else {
        return Array(a)[n] < Array(b)[n]
    }
    return a < b
    }
    return result
}


//
func solution8(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted (by: { (head: String, next: String) -> Bool in

        if head[String.Index(encodedOffset:n)] == next[String.Index(encodedOffset:n)] {
            return head < next
        }

        return head[String.Index(encodedOffset:n)] < next[String.Index(encodedOffset:n)]
    })
}
