import Foundation

func solution(_ s:String) -> [Int] {
    guard s.count >= 1, s.count <= 10000 else {return [0]}
    guard let regex = try? NSRegularExpression(pattern: "^[a-z]*$") else { return [0] }
    let range = NSRange(location: 0, length: s.utf16.count)
    guard regex.matches(in: s, range: range).count > 0 else { return [0] }
    
    var dic: [String:Int] = [:]
//    var count = -1
    var result = [Int]()
    
//    let str = Dictionary("\(s)".lowercased().map {
//        ($0, 1)}, uniquingKeysWith: +)
//    print(str)
    
    s.enumerated().map {
        (st, i) in
        if dic[String(i)] != nil {
            result.append(st - dic[String(i)]!)
            dic[String(i)] = st
        } else {
            result.append(-1)
            dic[String(i)] = st
        }
    }
    
    
    return result
}

solution("dcdaedqtbyyca")

//다른 사람들 코드


func solution1(_ s: String) -> [Int] {
    var word: [String: Int] = [:]
    var result: [Int] = []

    for (index, val) in Array(s).map { String($0) }.enumerated() {
        if let beforeIndex = word[val] {
            result.append(index - beforeIndex)
        } else {
            result.append(-1)
        }

        word[val] = index
    }

    return result
}

solution1("dcdaedqtbyyca")


func solution2(_ s:String) -> [Int] {
    var characterDictionary: Dictionary<Character, Int> = [:]
    var result: [Int] = []

    s.enumerated().forEach { (index, char) in
        if let previousCharacterIndex = characterDictionary[char] {
            result += [index - previousCharacterIndex]
            characterDictionary[char] = index
        } else {
            result += [-1]
            characterDictionary.updateValue(index, forKey: char)
        }
    }

    return result
}

func solution3(_ s: String) -> [Int] {
    return s.enumerated().map { (i, c) in i - (Array(s)[0..<i].lastIndex(of: c) ?? i + 1) }
}

func solution4(_ s:String) -> [Int] {
    var map = [String: Int]()
    let s = s.map { String($0) }
    var answer = [Int]()
    for i in 0..<s.count {
        if map[s[i]] == nil {
            answer.append(-1)
        } else {
            answer.append(i - map[s[i]]!)
        }
        map[s[i]] = i
    }
    return answer
}


func solution5(_ s:String) -> [Int] {
   var solArray = [Int]()
    let stringArray = Array(s)

    for i in 0...stringArray.count-1 {
        if i == 0 {
            solArray.append(-1)
        }else{
            let subArray = stringArray[0...i-1]
            if let lastindex = subArray.lastIndex(of: stringArray[i]) {
                solArray.append(i-lastindex)
            }else{
                solArray.append(-1)
            }
        }
    }

    return solArray
}


func solution6(_ s:String) -> [Int] {
    var dict = [String: Int]()
    var answer = [Int]()

    for (i, c) in s.enumerated() {
        let word = String(c)
        if let idx = dict[word] {
            answer.append(i-idx)
            dict[word] = i
        } else {
            dict[word] = i
            answer.append(-1)
        }
    }
    return answer
}


//
func solutio7(_ s: String) -> [Int] {
    var location: [Int] = Array(repeating: -1, count: 26)
    var result: [Int] = Array(repeating: -1, count: s.count)

    s.map { $0.toInt() }
    .enumerated()
    .forEach {
        if location[$0.element] == -1 {
            location[$0.element] = $0.offset
        } else {
            result[$0.offset] = $0.offset - location[$0.element]
            location[$0.element] = $0.offset
        }
    }
    return result
}

extension Character {

    func toInt() -> Int {
        return Int(self.asciiValue!) - 97
    }

}


//
