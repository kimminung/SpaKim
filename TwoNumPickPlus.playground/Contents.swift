import Cocoa
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    guard numbers.count >= 2, numbers.count <= 100 else {return [-1]}
    for i in numbers {
            guard i >= 0, i <= 100 else {return [-1]}
        }
    
    var result = Set<Int>()
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            result.insert(numbers[i]+numbers[j])
        }
    }
    
//        return Array(result).sorted()
    return Array(result).sorted { $0 < $1 }
//    return result.sorted()
}
solution([2,1,3,4,1])

//for-each
func solution2(_ numbers: Array<Int>) -> Array<Int> {
    var answer: Array<Int> = []

    numbers.forEach { a -> Void in
        var compareArray = numbers

        compareArray.remove(at: numbers.firstIndex(of: a)!)
        compareArray.forEach { b -> Void in
            answer.append(a + b)
        }
    }
    return answer.distinct().sorted()
}

extension Array where Element: Hashable {
    func distinct() -> Array<Element> {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}


//


//
func solution3(_ numbers:[Int]) -> [Int] {
    var duplicateRemover = Set<Int>()
    recursive(numbers, &duplicateRemover)
    return duplicateRemover.sorted().map { $0 }
}

func recursive(_ numbers: [Int], _ duplicateRemover: inout Set<Int>) {
    let firstNumber = numbers.first ?? 0

    if numbers.count == 1 {
        return
    }

    for (index, number) in numbers.enumerated() {
        if index == 0 {
            continue
        }

        duplicateRemover.insert(firstNumber + number)
    }

    recursive(numbers.dropFirst().map { $0 }, &duplicateRemover)
}
