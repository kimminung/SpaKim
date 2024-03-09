import Cocoa
/*
let formatter = NumberFormatter()
formatter.numberStyle = .spellOut
let number = 87654
let spelledOutNumber = formatter.string(for: number)!
print("\(number) spelled out is \(spelledOutNumber).")
*/


/*
 //망
public extension String {
    func wordToInteger() -> Int? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        return  numberFormatter.number(from: self) as? Int
    }
}
*/

 //망
 //import Foundation
/*
extension String {
    func solution(_ s:String) -> Int {
        let letter = [s]
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        numberFormatter.number(from: self.lowercased()) as? Int ?? 0
        return letter.description.solution(s)
    }
}
*/

//func solution(_ s:String) -> Int {
//        let letter = [s]
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .spellOut
//    numberFormatter.number(from: self.lowercased()) as? Int ?? 0
//        return letter.description.solution(s)
//    }

func solution(_ s:String) -> Int {
    guard s.count >= 1, s.count <= 50 else {return 999}
    //    guard s.first != "z", s.first != "0" else {return 1000}
    
    guard let regex = try? NSRegularExpression(pattern: "^[a-y1-9]*$") else { return 1111 }
    let range = NSRange(location: 0, length: 1)
    guard regex.matches(in: s, range: range).count > 0 else { return 1111 }
    
    /*
     guard let regex = try? NSRegularExpression(pattern: "^[A-Za-z ]*$") else { return "Err1" }
     let range = NSRange(location: 0, length: s.utf16.count)
     guard regex.matches(in: s, range: range).count > 0 else { return "Err1" }
     */
    var numberToWords = [String]()
    
    var result = s
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    for i in 0 ... 9 {
        let number = formatter.string(from: NSNumber(value: i))!
        numberToWords.append(number)
    }
    
    for i in 0..<numberToWords.count {
        result = result.replacingOccurrences(of: numberToWords[i], with: String(i))
    }
    
    print(numberToWords)
    guard Int(result)! >= 1, Int(result)! <= 2000000000 else {return 0}
    return Int(result)!
}

solution("one4seveneight")
solution("23four5six7")
solution("2three45sixseven")
solution("123")


func solution2(_ s:String) -> Int {
    guard s.count >= 1, s.count <= 50 else {return 999}
    //    guard s.first != "z", s.first != "0" else {return 1000}
    
    guard let regex = try? NSRegularExpression(pattern: "^[a-y1-9]*$") else { return 1111 }
    let range = NSRange(location: 0, length: 1)
    guard regex.matches(in: s, range: range).count > 0 else { return 1111 }
    
    var numberToWords = [String]()
    
    var result = s
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    for i in 0 ... 9 {
        let number = formatter.string(from: NSNumber(value: i))!
        numberToWords.append(number)
    }
    
    for i in 0..<numberToWords.count {
        result = result.replacingOccurrences(of: numberToWords[i], with: String(i))
    }
    
    guard Int(result)! >= 1, Int(result)! <= 2000000000 else {return 1212}
    return Int(result)!
}

solution2("one4seveneight")
    
