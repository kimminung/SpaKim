import UIKit

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    guard k >= 3, k <= 9 else {
        fatalError("k의 값은 3 이상 9 이하여야 합니다.")
    }
    
    guard m >= 3, m <= 10 else {
        fatalError("m의 값은 3 이상 10 이하여야 합니다.")
    }
    
    guard score.count >= 7, score.count <= 1_000_000 else {
        fatalError("score의 길이는 7 이상 1,000,000 이하여야 합니다.")
    }
    
    guard score.allSatisfy({ $0 >= 1 && $0 <= k }) else {
        fatalError("score의 각 요소는 1 이상 \(k) 이하여야 합니다.")
    }
    
    
    let s = score.sorted(by: >)
    var result = stride(from: m-1, to: score.count, by: m)
        .reduce(0) { $0 + s[$1] * m }
    return result == 0 ? 0 : result
}

solution(3, 4, [1, 2, 3, 1, 2, 3, 1])
