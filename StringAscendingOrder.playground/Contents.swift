import UIKit
import Foundation

/*
func solution(_ s:String) -> String {
    var strArr = s.map{String($0)}
    var valueInt = [Int]()
//    var result = String("\(valueInt)")
//    var valueStr = [String("\(valueInt)")]
//    var result = String("\(valueStr.joined(separator: ""))")
    var valueStr = ""
    
    for i in 0..<strArr.count {
        var str = strArr[i]
        var asciiNum = Int(UnicodeScalar(str)!.value)

        valueInt.append(asciiNum)
        valueInt.reverse()
        
    }
    valueStr.UnicodeScalar(valueInt)!.value
//        valueStr.joined(separator: "")
//    valueStr = [String("\(valueInt)")]
    
    return result
}*/

func solution(_ s:String) -> String {
    guard s.count >= 1, s is String == true else {return " "}
    return String(s.sorted { $0 > $1 })
}


solution("Zbcdefg")
 
//송동익님 코드
func solution1(_ s:String) -> String {
    
    var string : String = ""
    
    string = s.map{String($0)}.sorted(by:>).joined()

    return string
}

//아스키 사용자
func solutionas(_ s:String) -> String {
   var asciiArr = [Int]()
   var result = ""
   s.forEach {
      if let num = $0.asciiValue {
         asciiArr.append(Int(num))
      }
   }

   asciiArr.sort { $0 > $1 }

   asciiArr.forEach {
      if let char = UnicodeScalar($0) {
         result.append(String(char))
      }
   }

   return result
}
//
func solutionn(_ s: String) -> String {
    let s_int: [UInt8] = s.map { $0.asciiValue! }
    return String(s_int.sorted(by: >).map { Character(UnicodeScalar($0)) })
}
//
func solutionnn(_ s:String) -> String {
var l:String =  s.filter{ UnicodeScalar(String($0))!.value <= UInt32(90) ? true : false }
var smalla:String =  s.filter{ UnicodeScalar(String($0))!.value >= UInt32(97) ? true : false }
return String(smalla.sorted(by: >)) + String(l.sorted(by: >))
}

solutionnn("Zbcdefg")

//
func solutionnnn(_ s:String) -> String {
    return s.map{ $0.ascii() }
        .compactMap{$0}
        .sorted{ $0 > $1 }
        .map{ $0.string() }
        .joined()
}

extension Character {
    func ascii() -> UInt8? {
        return self.asciiValue
    }
}

extension UInt8 {
    func string() -> String {
        return String(Character(UnicodeScalar(self)))
    }
}
//
func solutionnnnn(_ s:String) -> String {
    let arr = Array(s).map { UnicodeScalar(String($0))!.value }.sorted(by: >)
    return arr.map { UnicodeScalar($0)! }.reduce("", { "\($0)" + "\($1)" })
}
//
func solutionnnnnn(_ s:String) -> String {
    let stringList = s.map {$0}
    var asciiList: [Int] = []
    var totalList: [Int] = []

    for i in stringList {
        asciiList.append(Int(i.asciiValue!))
    }

    var lowerCaseList: [Int] = []
    var upperCaseList: [Int] = []

    // 대문자 : 65 ~ 90
    // 소문자 : 97 ~ 122
    for i in asciiList {
        if i >= 65 && i <= 90 {
            upperCaseList.append(i)
        } else {
            lowerCaseList.append(i)
        }
    }

    lowerCaseList.sort(by: >)
    upperCaseList.sort(by: >)

    totalList += lowerCaseList
    totalList += upperCaseList

    var result: [String] = []

    for i in totalList {
        result.append(String(UnicodeScalar(i)!))
    }

    return result.joined()
}
//
func solutions(_ s:String) -> String {
    var asciiArr = [UInt32]()
    var result = ""

    for char in s {
        let str = String(char)
        let ascii = UnicodeScalar(str)!.value
        asciiArr.append(ascii)
    }
    asciiArr = asciiArr.sorted(by:>)

    for num in asciiArr {
        if let str = UnicodeScalar(num) {
            result += String(str)
        }
    }
    return result
}
//
func solutionss(_ s:String) -> String {
    return s.map { ($0.asciiValue!, String($0)) }.sorted(by: { $0.0 > $1.0 }).map { $0.1 }.joined()
}

//
func solutionsss(_ s:String) -> String {
    // 빈 배열과 빈 결괏값 할당
    var array: [UInt8] = []
    var result = ""

    // 입력값의 각 문자를 아스키 값으로 변환하여 배열에 추가
    for c in s {
        array.append(c.asciiValue!)
    }

    // 배열을 내림차순으로 정렬
    array = array.sorted(by: >)

    // 배열의 아스키 값을 문자열로 변환하여 결괏값에 연결
    for ascii in array {
        result += String(UnicodeScalar(ascii))
    }

    // 결괏값 반환
    return result
}
//
func solutionssss(_ s:String) -> String {
    var ascArr = Array(s).map {$0.asciiValue!}.sorted (by:>)
    let resultArr = ascArr.compactMap {Unicode.Scalar($0)}
    return String(resultArr.map{Character($0)})
}


//dictionary
func solutionDic(_ s:String) -> String {
    let alphabet = [ "A", "B", "C", "D", "E", "F", "G", "H","I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let dict = Dictionary(uniqueKeysWithValues: zip(alphabet, 1...52))
    let dict2 = Dictionary(uniqueKeysWithValues: zip(1...52, alphabet))
    var stArr = s.map{dict[String($0)]!}
    stArr = stArr.sorted(by: >)
    return stArr.map{dict2[$0]!}.joined()
}

/*
//extension Character{
var isAscii: Bool{
    return unicodeScalars.allSatisfy{ $0.isASCII }
}

var ascii: UInt32?{
    return isAscii ? unicodeScalars.first?.value : nil
}
}

extension StringProtocol{
var ascii: [UInt32]{
    return compactMap{ $0.ascii }
}
}

func solutionnnnnn(_ s:String) -> String {
var arr = s.ascii
var str = ""
var descending = arr.sorted(by: >)

for item in descending{
    str.unicodeScalars.append(UnicodeScalar(item)!)
}
return str
}
 */
//
func solutionnnnnnn(_ s:String) -> String {
    var t:[UInt16] = []
        for i in s.utf16 {
            t.append(i)
        }
        t.sort(by: >) // 정렬 >: 큰것부터, <: 작은것부터

        return t.map { UnicodeScalar($0)!.description}.reduce("", +)
}


//utf16
func ssolution(_ s:String) -> String {
    return String(utf16CodeUnits: s.utf16.sorted(by: >), count: s.count)
}


//self
extension Character {
    func unicdoeScalarValue() -> UInt32 {
        let scalars = self.unicodeScalars
        return scalars[scalars.startIndex].value
    }
}

func sssolution(_ s:String) -> String {
    return s.sorted(by: { $0.unicdoeScalarValue() > $1.unicdoeScalarValue() })
            .reduce("") { $0 + String($1) }
}
//


//미친 클로져
func solution0(_ s:String) -> String {
    return String(s.sorted { $0 > $1 })
}

func solution00(_ s:String) -> String {
    String(s.sorted { $0 > $1 })
}

func solution000(_ s:String) -> String {
    let lowerResult = s.filter { $0.isLowercase }.sorted(by: >).reduce("") { "\($0)" + "\($1)" }
    let upperResult = s.filter { $0.isUppercase }.sorted(by: >).reduce("") { "\($0)" + "\($1)" }
    return lowerResult + upperResult
}

func solution0000(_ s:String) -> String {
    let res = s.sorted{
        if $0.isLowercase && $1.isLowercase {
            return $0 > $1
        } else if $0.isLowercase {
            return $0 > $1
        } else {
            return $0 > $1
        }
    }
    return String(res)
}

func solution2(_ s:String) -> String {

    var temp : [Character] = []

    for i in s{
        temp.append(i)
    }

    var result = String(temp.sorted(by:>))
    return result
}

func solution3(_ s:String) -> String {
    var result:[Character] = []
    var returnString = ""
    for i in s {
        result.append(i)
    }
    result.sort(by:>)
    for i in result {
        returnString += String(i)
    }
    return returnString
}

func solution4(_ s:String) -> String {
    var strResult:String = ""
        var arrStr:Array<Character> = Array()


        for i in 0..<s.count {
            arrStr.append(s[s.index(s.startIndex, offsetBy: i)])
        }

        print(arrStr)
        arrStr.sort()
        print(arrStr)
        arrStr.reverse()
        print(arrStr)

        for i in 0..<arrStr.count {
            strResult.append(arrStr[i])
        }

        print(strResult)
    return strResult
}

func solution5(_ s:String) -> String {
        var str = s

    var ans = ""
    for ch in str.sorted().reversed() {
        ans.append(ch)
    }

    return ans
}

func solution6(_ s:String) -> String {
    var arr = Array(s).sorted{ $0 > $1 }
    return String(arr)
}


func solution7(_ s:String) -> String {
    return String(s.sorted().reversed())
}

func solution8(_ s:String) -> String {
    let result = s.sorted { (a, b) -> Bool in
        return a > b
    }
    return String(result)
}


func solution9(_ s:String) -> String {
    var result = s.sorted(by : {$0 > $1})

    return String(result)
}

func solution10(_ s:String) -> String {
    var array = [Character]()
    var result = ""

    for i in s {
        array.append(i)
    }

    for i in array.sorted(by: { $0 > $1 }) {
        result += "\(i)"
    }

    return result
}


func solution11(_ s:String) -> String {
    return String(Array(s).sorted(by: { $0 > $1 }))
}

func solution12(_ s:String) -> String {
    return String(Array(s).sorted(by: >))
}

func solution13(_ s:String) -> String {

    var stringArray = Array(s)
    stringArray.sort(by: > )

    var resultStr = stringArray.map{String($0)}.joined(separator:"")

    return resultStr
}

func solution14(_ s:String) -> String {
    var lower = ""
    var upper = ""
    for char in s {
        let str = String(char)
        if str.lowercased() == str {
            lower += str
        } else {
            upper += str
        }
    }
    var result = ""
    result += lower.sorted { $0 > $1 }
    result += upper.sorted { $0 > $1 }
    return result
}


func solution15(_ s:String) -> String {
  var upper:[String] = []
  var lower:[String] = []

  s.forEach {
    if String($0) == String($0).uppercased() { //얜 대문자
      upper.append(String($0))
    } else {
      lower.append(String($0))
    }
  }
  return lower.sorted{$0 > $1}.reduce("") {$0 + $1} +  upper.sorted{$0 > $1}.reduce("") {$0 + $1}
}

func solution16(_ s:String) -> String {
    return Array(s).sorted().reversed().reduce("") { (sum, item) -> String in
        return sum + String(item)
    }
}

func solution17(_ s: String) -> String {
    let chars = s.map({$0})
    var lower: [Character] = []
    var upper: [Character] = []

    for char in chars {
        if char.isLowercase {
            if lower.count == 0 {
                lower.append(char)
                continue
            }

            for (index, value) in lower.enumerated() {
                if char >= value {
                    lower.insert(char, at: index)
                    break
                }

                if index == lower.count - 1 {
                    lower.append(char)
                    break
                }
            }
        }

        if char.isUppercase {
            if upper.count == 0 {
                upper.append(char)
                continue
            }

            for (index, value) in upper.enumerated() {
                if char >= value {
                    upper.insert(char, at: index)
                    break
                }

                if index == upper.count - 1 {
                    upper.append(char)
                    break
                }
            }
        }
    }

    var result = ""

    for o in lower {
        result += String(o)
    }

    for o in upper {
        result += String(o)
    }

    return result
}

func solution18(_ s:String) -> String {
    var arr = Array(s)

    arr = arr.sorted{ (first, second) -> Bool in
        if first.isUppercase && second.isUppercase {
            return first > second
        } else if first.isUppercase && !second.isUppercase {
            return false
        } else if !first.isUppercase && second.isUppercase {
            return true
        } else {
            return first > second
        }
    }

    return String(arr)
}


//일단 [Int]형으로 나오는거 해봄
func solutionX(_ s:String) -> [Int] {
    var strArr = s.map{String($0)}
    var result = [Int]()
    
    for i in 0..<strArr.count {
        var str = strArr[i]
        var asciiNum = Int(UnicodeScalar(str)!.value)
        
        result.append(asciiNum)
        
        
    }
    
    return result
}

solutionX("Zbcdefg")
