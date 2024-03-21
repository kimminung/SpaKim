import Foundation

func solution(_ numbers:[Int]) -> Double {
    
    for i in numbers {
        guard i >= 0, i <= 1000 else {return 0.0}
    }
    
    guard numbers.count >= 1, numbers.count <= 100 else {return 0.0}
    
    
    
    var total: Double = 0.0
    var result = 0.0
    for r in numbers {
        total += Double(r)
        // return Double(total)
    }
     
    result = ( Double (total) / Double(numbers.count))
    
    let doubleString = String(result)
    let regexPattern = #"^\d*\.[05]"#
    guard let regex = try? NSRegularExpression(pattern: regexPattern) else { return 0.0 }
    let range = NSRange(location: 0, length: doubleString.utf16.count)
    guard regex.firstMatch(in: doubleString, options: [], range: range) != nil else { return 0.0 }
     
    return result
}



func reg (_ origin:Double) -> String {
//    let origin: Double = 0.25384927493
    let double = String(origin)
    print(double)
    
    guard let regex = try? NSRegularExpression(pattern: "^[\\d*\\.\\d[05]]*$") else {return ""}
//    let regex = #"^\d{0,1000}\.[0-9]*[05]$"#
    let range = NSRange(location: 0, length: double.utf16.count)
    guard regex.matches(in: double, range: range).count > 0 else {return ""}
    
    return double
}

func reg2(_ origin: Double) -> String {
    let doubleString = String(origin)
    
    // 소수점 뒷자리에 0 또는 5만 허용하는 정규표현식
//    let regexPattern = "^[\\d*\\.\\d[05]]*$"
//    let regexPattern = #"^\d*\.[05]$"#
    let regexPattern = #"^\d*\.[05]"#
    // 정규표현식을 사용하여 문자열 검증
    guard let regex = try? NSRegularExpression(pattern: regexPattern) else { return "" }
    let range = NSRange(location: 0, length: doubleString.utf16.count)
    
    // 정규표현식과 문자열 비교
    guard regex.firstMatch(in: doubleString, options: [], range: range) != nil else { return "" }
    
    return doubleString
}

//reg(0.25384927493)
//reg(0.5213)
reg2(0.25384927493)
//reg2(0.5213)
