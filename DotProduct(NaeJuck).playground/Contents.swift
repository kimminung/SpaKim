import UIKit

import Foundation

func solution00(_ a:[Int], _ b:[Int]) -> Int {
    var ac = a.count
    var bc = b.count
    guard ac >= 1, ac <= 1000, bc >= 1, bc <= 1000 else {return -1111}
    
    guard a.min()! >= -1000 && a.max()! <= 1000, b.min()! >= -1000 && b.max()! <= 1000 else {return -1111}
    return zip(a, b).map(*).reduce(0, +)
}

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var ac = a.count
    var bc = b.count
    
    guard ac >= 1, ac <= 1000, bc >= 1, bc <= 1000 else {return -1111}
    
    guard a.min()! >= -1000 && a.max()! <= 1000, b.min()! >= -1000 && b.max()! <= 1000 else {return -1111}
    
    var result = 0
    
    for i in 0..<ac {
        result += (a[i] * b[i])
    }
    return result
}

//zip
func solution1(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map(*).reduce(0, +)
}


func solution2(_ a: [Int], _ b: [Int]) -> Int {
    var answer = 0

    a.indices.forEach { answer += { 클로저, 좋아하지마쇼 -> Int in 클로저 * 좋아하지마쇼 }(a[$0], b[$0]) }
    return answer
}


func solution3(_ a:[Int], _ b:[Int]) -> Int {
    var b = b
    return a.map{ $0 * b.removeFirst()}.reduce(0,+)
}

func solution4(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).reduce(0, {$0 + ($1.0 * $1.1) })
}


func solution5(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    for i in 0..<a.count {
        result += a[i] * b[i]
    }
    return result
}

func solution6(_ a:[Int], _ b:[Int]) -> Int {

    var result = 0

    for (i,v) in a.enumerated(){
        result += v*b[i]
    }

    return result

}
