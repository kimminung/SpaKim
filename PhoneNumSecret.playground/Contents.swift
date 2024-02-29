import UIKit

func solution15(_ phone_number:String) -> String {
    return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
}

func solution16(_ phone_number:String) -> String {
    return String(repeating:"*", count:phone_number.count-4)+phone_number.suffix(4)
}

func solution17(_ phone_number:String) -> String {
    guard phone_number.count > 4 else { return phone_number }
    return String(phone_number.enumerated().map{($0.offset<phone_number.count-4 ? Character("*") : $0.element)})
}

func solution18(_ phone_number:String) -> String {
    var ans: String = ""
    for _ in 0..<(phone_number.count-4) {
        ans += "*"
    }
    let startIdx = phone_number.index(phone_number.endIndex, offsetBy:-4)
    let endIdx = phone_number.index(before:phone_number.endIndex)
    let range = startIdx...endIdx
    return ans + phone_number[range]
}

func solution19(_ phone_number:String) -> String {
    let number = phone_number
    let start = number.startIndex
    let end = number.index(number.startIndex, offsetBy: number.count-4);

    return number.replacingOccurrences(of: number[start..<end], with: String(repeating: "*", count: number.count - 4))
}

func solution(_ phone_number:String) -> String {
  var result = Array(phone_number)
    
  for i in 0..<result.count {
    if i < result.count - 4 {
      result[i] = "*"
    }
  }

  return String(result)
}


func solution1(_ phone_number:String) -> String {
  var result = ""
    
  for _ in 0..<phone_number.count - 4 {
    result += "*"
  }
    
  result += phone_number[phone_number.index(phone_number.endIndex, offsetBy: -4)..<phone_number.endIndex]
    
  return result
}

func solution2(_ phone_number:String) -> String {
    return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
}


func solution3(_ phone_number:String) -> String {
    return String(repeating:"*", count:phone_number.count-4)+phone_number.suffix(4)
}
func solution4(_ phone_number:String) -> String {
    guard phone_number.count > 4 else { return phone_number }
    return String(phone_number.enumerated().map{($0.offset<phone_number.count-4 ? Character("*") : $0.element)})
}


func solution5(_ phone_number:String) -> String {

    var result = ""
    for (index, value) in phone_number.enumerated()
    {
        if(index > phone_number.count - 5)
        {
            result += String(value)
        }else{
            result += "*"
        }
    }

    return result
}


func solution6(_ phone_number:String) -> String {
    var arr = ""
    for i in 0..<phone_number.count {
        if i < phone_number.count - 4 {
            arr.append("*")
        } else {
            arr.append(String(phone_number[String.Index.init(encodedOffset: i)]))
        }
    }
    return arr
}


func solution7(_ phone_number:String) -> String {
     var arr = phone_number.map { String($0) }
    var result = ""
    for i in 0...arr.count-1 {
        if i >= arr.count-4 {
            result += arr[i]
        } else {
            result += "*"
        }
    }
    return result
}


func solution8(_ phone_number:String) -> String {
    let offset = phone_number.count - 4
    var result = ""

    for (index,value) in phone_number.enumerated() {

        if index < offset {
            result += "*"
        }else {
            result += String(value)
        }
    }

    return result
}


func solution9(_ phone_number:String) -> String {
    let size = phone_number.count - 4;
    var result = "";
    for (n,c) in phone_number.enumerated(){
        if n<size {
            result = result + "*";
        }else{
            result = result + String(c);
        }
    };
    return result;
}


func solution10(_ phone_number:String) -> String {
    return String(Array(repeating:"*", count:phone_number.count-4))
            + phone_number.suffix(4)
}

func solution11(_ phone_number:String) -> String {
    let input:String = phone_number
    var res:String = ""
    for i in 0..<input.count {
        if i < input.count-4 {
            res += "*"
        }
        else {
            res += String(input[input.index(input.startIndex, offsetBy: i)])
        }
    }
    return res
}


func solution12(_ phone_number:String) -> String {
    var ans: String = ""
    for _ in 0..<(phone_number.count-4) {
        ans += "*"
    }
    let startIdx = phone_number.index(phone_number.endIndex, offsetBy:-4)
    let endIdx = phone_number.index(before:phone_number.endIndex)
    let range = startIdx...endIdx
    return ans + phone_number[range]
}

func solution13(_ phone_number:String) -> String {
    let phoneNumberCount = phone_number.count
    let coveredPhoneNumberCount = phoneNumberCount - 4
    var coveredPhoneNumber: String = ""
    var loopCount = 1
    for ch in phone_number {
       if loopCount <= coveredPhoneNumberCount {
           coveredPhoneNumber += "*"
           loopCount += 1
       } else {
           coveredPhoneNumber += String(ch)
       }
    }

    return coveredPhoneNumber
}

func solution14(_ phone_number:String) -> String {
    var phoneNum = phone_number
    var phoneNumArr = phoneNum.map { $0 } //["0","2","7","7","8","8"]

    var i = 0
    while(i < phoneNumArr.count - 4) {
        phoneNumArr[i] = "*"
        i = i + 1
    }

    return String(phoneNumArr)
}
