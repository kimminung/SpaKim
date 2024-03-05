import Foundation

func solution(_ t:String, _ p:String) -> Int {
    guard p.count >= 1, p.count <= 18 else {return -1}
    guard p.count <= t.count, t.count <= 10000 else {return -1}
    
    //var t : Int = 0
    //var p : Int = 0
    var t = t
    var p = p
    
    if t.first == "0", p.first == "0" {
//        t = t.dropFirst()
//        p.dropFirst()
        t = t.trimmingCharacters(in: ["0"])
        p = p.trimmingCharacters(in: ["0"])
    }
//    guard t.first != "0", p.first != "0" else {
//        t = t.trimmingCharacters(in: ["0"])
//        p = p.trimmingCharacters(in: ["0"])
//    }
    print(t)
    var result = 0
        
        for i in 0...(t.count - p.count) {
            let startIndex = t.index(t.startIndex, offsetBy: i)
            let endIndex = t.index(startIndex, offsetBy: p.count)
            let temp = String(t[startIndex..<endIndex])
            
            if temp <= p{
                    result += 1
            }
        }
        return result
    }

//solution("3141592", "271")
solution("003141592", "00271")

func solution9(_ t: String, _ p: String) -> Int {
    return (0..<t.count - p.count + 1).map { Int(t[String.Index(utf16Offset: $0, in: t)..<String.Index(utf16Offset: $0 + p.count, in: t)]) ?? 0 }
        .filter { Int(p)! >= $0 }
        .count
}


//
func solution1(_ t:String, _ p:String) -> Int {
    var answer = 0

    for i in 0 ... t.count - p.count {
        let subStr = t.dropFirst(i).prefix(p.count)
        if let comp = Int(subStr), let val = Int(p) {
            answer += comp - val <= 0 ? 1 : 0
        }
    }

    return answer
}


//
func solution2(_ t:String, _ p:String) -> Int {
    var all = Array(t)
    var numbers = [Int]()

    func makeNum(index: Int) {
        guard index < t.count - p.count + 1 else { return }
        var num = ""
        for i in index...index + p.count - 1 {
            num.append(all[i])
        }
        numbers.append(Int(num)!)
    }

    for idx in all.indices {
        makeNum(index: idx)
    }

    return numbers.filter { Int(p)! >= $0 }.count
}


//
func solution3(_ t:String, _ p:String) -> Int {
    let tCount = t.count
    let pCount = p.count
    let tIntList = t.map { String($0) }
    let pInt = Int(p) ?? 0

    var count = 0

    for i in 0..<tCount {
        let max = i + pCount
        if max <= tCount {
            let reduce = Int(tIntList[i..<max].reduce("", +)) ?? 0
            if reduce <= pInt {
                count += 1
            }
        }
    }
    return count
}


func solution4(_ t:String, _ p:String) -> Int {
    var result = 0
    var arrT = Array(t)
    let countP = p.count

    while arrT.count >= countP {
        if Int(String(arrT[0..<countP]))! <= Int(p)! {
            result += 1
        }
        arrT.removeFirst()
    }
    return result
}


func solution5(_ t:String, _ p:String) -> Int {
    let length = p.count
    var t = t.map { String($0) } , p = Int(p.map { String($0) }.joined())!
    var idx = 0
    var answer = 0
    while idx + length <= t.count {
        if Int(t[idx..<idx+length].joined())! <= p { answer += 1 }
        idx += 1
    }

    return answer
}


func solution6(_ t:String, _ p:String) -> Int {
    var res = [Int]()
    let arr = t.map { String($0) }

    for i in 0...arr.count - p.count {
        var str = ""
        for j in 0..<p.count {
            str += arr[j + i]
        }
        res.append(Int(str) ?? 0)
    }
    return res.filter { $0 <= Int(p) ?? 0 }.count
}


func solution7(_ t:String, _ p:String) -> Int {
    var (t, answer, P) = (Array(t).map{String($0)}, 0, Int(p)!)
    for i in 0..<t.count-p.count+1 {
        answer += Int(t[i...i+p.count-1].joined())! <= P ? 1 : 0
     }
    return answer
}


func solution8(_ t: String, _ p: String) -> Int {
    let pNum = Int(p)!
    let t = Array(t).map { String($0) }
    let p = Array(p).map { String($0) }
    let tCount = t.count
    let pCount = p.count
    var result = 0

    for i in 0...(tCount - pCount) {
        let tNum = Int(t[i..<(i+pCount)].joined())!
        if tNum <= pNum { result += 1}
    }

    return result
}

