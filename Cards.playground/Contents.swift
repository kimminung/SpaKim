import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    guard cards1.count >= 1, cards2.count >= 1, cards1.count <= 10, cards2.count <= 10 else {return "각 cards 길이 제한 확인"}
    for i in cards1 {
        guard i.count >= 1, i.count <= 10 else {return "값이 너무 길거나 짧다."}
    }
    for i in cards2 {
        guard i.count >= 1, i.count <= 10 else {return "값이 너무 길거나 짧다."}
    }
    guard Set(cards1) != Set(cards2) else {return "각 cards는 겹치지 않아야 한다."}
    guard goal.count >= 2, goal.count <= cards1.count+cards2.count else {return "goal은 cards의 합이며, 2장 이상이다."}
    for i in goal {
        guard i.count >= 1, i.count <= 10 else {return "값이 너무 길거나 짧다."}
    }
    guard Set(goal).isSubset(of: Set(cards1).union(cards2)) else {
        return "goal의 원소는 cards1과 cards2의 원소들로만 이루어져 있어야 합니다."
    }
    guard let regex = try? NSRegularExpression(pattern: "^[a-z]+$") else {
        return "알파벳 소문자로만 설정해주세요"
    }
    let goalString = goal.joined()
    let range = NSRange(location: 0, length: goalString.utf16.count)
    guard regex.firstMatch(in: goalString, options: [], range: range) != nil else {
        return "알파벳 소문자로만 설정해주세요"
    }
    var index1 = 0
    var index2 = 0
    
    for character in goal {
        if index1 < cards1.count && character == cards1[index1] {
            index1 += 1
        } else if index2 < cards2.count && character == cards2[index2] {
            index2 += 1
        } else {
            return "No"
        }
    }
    return "Yes"
}
//    solution(["i", "drink", "water"],["want", "to"],["i", "want", "to", "drink", "water"])
    //solution(["i", "drink", "water"],[ "water","i", "drink"],["i", "want", "to", "drink", "water"])
    solution(["i", "water", "drink"],["want", "to"],["i", "want", "to", "drink", "water"])
    
    
    //
func solution1(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var index1:Int = 0
    var index2:Int = 0

    let result = goal.map { character -> Bool in
        if index1 < cards1.count && character == cards1[index1] {
            index1 += 1
            return true
        } else if index2 < cards2.count && character == cards2[index2] {
            index2 += 1
            return true
        } else {
            return false
        }
    }.reduce(true) { $0 && $1 }

    return result ? "Yes" : "No"
}


//
func solution2(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
var index1 = 0
    var index2 = 0

    for character in goal {
        if index1 < cards1.count && character == cards1[index1] {
            index1 += 1
        } else if index2 < cards2.count && character == cards2[index2] {
            index2 += 1
        } else {
            return "No"
        }
    }

    return "Yes"
}


func solution3(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var (ret, c1, c2) = ("Yes", cards1, cards2)
    goal.forEach {
        if c1.first == $0 { c1.removeFirst() }
        else if c2.first == $0 { c2.removeFirst() }
        else { ret = "No"}
    }
    return ret
}
