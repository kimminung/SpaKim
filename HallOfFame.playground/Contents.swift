import UIKit
import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    
    guard k >= 3, k <= 100, score.count >= 7, score.count <= 1000 else { return [] }
    for i in score {
        guard i >= 0, i <= 2000 else { return [] }
    }
    
    var arr = [Int]()
    var result = [Int]()
    
    for i in score {
        arr.append(i)
        arr.sort(){ $0 > $1 }
        
        if arr.count > k {
            arr.removeLast()
        }
        result.append(arr.last!)
    }
    return result
}


//
func solution1(_ k:Int, _ score:[Int]) -> [Int] {
    return (0...score.count-1).map{
        let end = $0 < k-1 ? $0 : k-1
        return Array(score[0...$0].sorted(by: >)[0...end]).last!
    }
}


