import UIKit

func solution(_ s:String) -> Bool {
    guard s.count >= 1, s.count <= 8 else {return false}
    guard s.count == 4 || s.count == 6 else {return false}
    
    let strings: [String] = [s]
    let pattern: String = "^[0-9]*$"
    let result: Bool = true
    
    for string in strings {
        guard let _ = string.range(of: pattern, options: .regularExpression) else {
            return false
            
        }
    }
    return result
}

func solution10(_ s:String) -> Bool {

    guard s.count == 4 || s.count == 6 else { return false }

    for c in s {
        if  let unicode = c.unicodeScalars.first?.value {
            if unicode < 48 || unicode > 57 {
                return false
            }
        } else {
            return false
        }
    }

    return true
}

func solution12(_ s:String) -> Bool {
    for char in s {
        if char.asciiValue! > UInt8(57) {
            return false
        }
    }
    if s.count == 4 || s.count == 6 {
        return true
    } else {
        return false
    }
}

func solution13(_ s:String) -> Bool {
    let digit  = CharacterSet.decimalDigits

    if s.count == 4 || s.count == 6 {
    for i in s.unicodeScalars{
        if digit.contains(i) == false{
            return false
        }
    }
    }
    else{
        return false
    }
    return true
}

func solution14(_ s:String) -> Bool {
    if s.lengthOfBytes(using: .utf8) == 4 || s.lengthOfBytes(using: .utf8) == 6 {
        if s.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

func solution15(_ s:String) -> Bool {

    guard s.count == 4 || s.count == 6 else {return false}
    var result: Bool = false

    for index in s.utf16 {
        print(index)
        if index >= 48 && index <= 57{
            result = true
        }else{
            result = false
            break
        }
    }

    return result
}

func solution16(_ s:String) -> Bool {
    return (s.compactMap{Int(String($0))}.count == s.count) && (s.count == 4 || s.count == 6)
}

func solution17(_ s:String) -> Bool {
    guard s.count == 4 || s.count == 6 else { return false }
    return s.reduce(true) {
        guard $0 else { return $0 }
        return ("0" ... "9").contains($1)
    }
}

func solution18(_ s: String) -> Bool {
    if s.count != 4 && s.count != 6 {
        return false
    }
    guard let num = NumberFormatter().number(from: s) else {
        return false
    }
    guard let i = Int(s) else {
        return false
    }
    return true
}

func solution19(_ s:String) -> Bool {

    let temp = s.filter { $0.isNumber == true }

    if (temp.count == 4 || temp.count == 6) && temp.count == s.count {
        return true
    }

    return false
}

func solution20(_ s:String) -> Bool {
    var answer: Bool = true
    let string = Array(s)

    if s.count == 4 || s.count == 6 {
        for i in 0..<s.count {
            if 65 < Int(string[i].asciiValue!) && Int(string[i].asciiValue!) <= 90 {
                answer = false
                break
            } else if 97 <= Int(string[i].asciiValue!) && Int(string[i].asciiValue!) <= 122 {
                answer = false
                break
            } else {
                answer = true
            }
        }
    } else {
        answer = false
    }

    return answer
}

func solution1(_ s:String) -> Bool {
    return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
}


func solution2(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        if Int(s) != nil {
            return true
        }
    }
    return false
}


func solution3(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        guard let num = Int(s) else { return false}
        return true
    }
    return false
}


func solution4(_ s:String) -> Bool {
    let length = s.count
    if length != 4 && length != 6 {
        return false
    }
    for char in s {
        if char < "0" || char > "9" {
            return false
        }
    }
    return true
}


func solution5(_ s:String) -> Bool {

    switch s.count {
    case 4, 6:
        break
    default:
        return false
    }

    for ch in s {
        switch ch {
        case "0"..."9":
            continue
        default:
            return false
        }
    }

    return true
}


func solution6(_ s:String) -> Bool {

    if(s.count == 4 || s.count == 6){
        let a : Int? = Int(s)
        if let b = a {
            return true
        }else{
            return false
        }
    }else{
        return false
    }
    return true
}


func solution7(_ s:String) -> Bool {

    var result: Bool
    if((s.characters.count == 4 || s.characters.count == 6) && Int(s) != nil){
        result = true
    } else
    {
        result = false
    }

  return result
}


func solution8(_ s:String) -> Bool {
        let arr = Array(s).flatMap { str in Int(s) }
        if (arr.count == 4 || arr.count == 6) && arr.count == s.count {
            return true
        }
    return false
}

func solution9(_ s:String) -> Bool {
    if Int(s) != nil {
        if s.count == 4 || s.count == 6 {
            return true
        }
    }

    return false
}




func solution11(_ s:String) -> Bool {
    var res = true
    if s.count != 4 && s.count != 6 { res = false }
    let number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var check = [Int]()
    for i in 0..<s.count{
        var index = s.index(s.startIndex, offsetBy: i)
        for j in 0..<number.count{
            if String(s[index]) == String(number[j]) { check.append(1)}
        }
    }

    if check.count != s.count { res = false }

    return res
}


func solution12(_ s:String) -> Bool {
    guard s.count == 4 || s.count == 6 else { return false }
    let numberList:[Character] = ["0","1","2","3","4","5","6","7","8","9"]
    return s.map{numberList.contains($0)}.reduce(true, {$0&&$1})
}


func solution13(_ s: String) -> Bool {
    s.lowercased()
    let length = s.count
    if length == 4 || length == 6 {
        let set = CharacterSet.decimalDigits
        for us in s.unicodeScalars where !set.contains(us) { return false }
        return true
    }
    else {return false}
}
