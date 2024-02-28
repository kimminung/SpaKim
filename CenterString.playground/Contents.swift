import UIKit


//베스트
func solution2(_ s:String) -> String {

    return String(s[String.Index(encodedOffset: (s.count-1)/2)...String.Index(encodedOffset: s.count/2)])
}

//제출한거
func solutiona(_ s:String) -> String {

    var answer : String = ""
    var S : String = ""
    var n : Int = 0
    S = s
    n = S.count

    answer = n % 2 == 0 ? String(S[String.Index(encodedOffset:(n/2)-1)]) + String(S[String.Index(encodedOffset:n/2)]) : String(S[String.Index(encodedOffset:n/2)])


    return answer
}


//신승현님 자료
func solution(_ s:String) -> String {
    
    guard s.count >= 1 && s.count <= 100 else {
        return "제한 조건 벗어남";
    }
    var result: String = s;
    var num: Int = s.count / 2;
    
    if s.count % 2 == 1 {
        num = s.count / 2;
        return String(Array(result)[num]);
    } else {
        num = s.count / 2 - 1;
        return String(Array(result)[num...num + 1]);
    }
}

func solution1(_ s:String) -> String {
    return findCenter(string: s)
}

func findCenter(string: String) -> String {
    let isEven = string.count % 2 == 0
    let halfValue = Int(string.count / 2) - (isEven ? 1 : 0)
    let halfIndex = String.Index(encodedOffset: halfValue)
    let lastIndex = String.Index(encodedOffset: halfValue + (isEven ? 1 : 0))
    let centerString = string[halfIndex...lastIndex]
    return String(centerString)
}



func solution3(_ s:String) -> String {
    if Array(s).count % 2 == 0 {
        return String(Array(s)[(s.count/2)-1...(s.count/2)])
    }else{
        return String(Array(s)[s.count/2])
    }
}

func solution4(_ s:String) -> String {
    let array = Array(s)

    if s.count % 2 != 0 {
        return String(array[(s.count / 2)])
    } else {
        return String(array[(s.count / 2) - 1...(s.count / 2)])
    }
}

func solution5(_ s:String) -> String {
   let characters: [Character] = Array(s)

        if characters.count % 2 == 0 {
            return String(describing: characters[characters.count / 2 - 1]) +
                    String(describing: characters[characters.count / 2])
        } else {
            return String(describing: characters[characters.count / 2])
        }
}


func solution6(_ s:String) -> String {
  let length = s.count
  let halfPoint = Int(length / 2)
  if length % 2 == 0 {
    return String(s[String.Index(encodedOffset: halfPoint - 1)...String.Index(encodedOffset: halfPoint)])
  } else {
    return String(s[String.Index(encodedOffset: halfPoint)])
  }
}


func solution7(_ s:String) -> String {
    let length = s.count + 1
    let lowerBound = Int((length - (length % 2)) / 2)
    let upperBound = Int((length + (length % 2)) / 2)
    let lowerIndex = s.index(s.startIndex, offsetBy:lowerBound - 1)
    let upperIndex = s.index(s.startIndex, offsetBy:upperBound - 1)
    let result = s[lowerIndex...upperIndex]
    return String(result)
}

func solution8(_ s:String) -> String {
    let length: Int = s.count % 2 == 0 ? 2 : 1
    let index: Int = s.count / 2 - (length - 1)

    var answer: String = String(s[s.index(s.startIndex, offsetBy: index)...s.index(s.startIndex, offsetBy: index + (length - 1))])

    return answer
}


func solution9(_ s:String) -> String {
    if(s.count < 1 || s.count > 100)
    {
        return ""
    }

    if(s.count > 3)
    {
        let count = s.count
        let oneIndex = s.index(s.startIndex, offsetBy: (count/2 - 1))
        let twoIndex = s.index(s.startIndex, offsetBy: (count/2))

        if((count % 2) == 0)
        {
            return String(s[oneIndex]) + String(s[twoIndex])
        }else{
            return String(s[twoIndex])
        }
    }else{
        return s
    }

    return ""
}
