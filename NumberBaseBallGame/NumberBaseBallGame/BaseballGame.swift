//
//  BaseballGame.swift
//  NumberBaseBallGame
//
//  Created by 민웅킴 on 3/12/24.
//

import Foundation
//
// BaseballGame.swift 파일 생성
class BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        
        print("정답은 \(answer) 입니다.")
    }
    
    func makeAnswer() -> Int {
        // 함수 내부를 구현하기
        var result = ""
        for _ in 0..<1 {
           result += "\(Int.random(in: 1..<10))"
            for _ in 0..<1 {
                result += "\(Int.random(in: 1..<10))"
                for _ in 0..<1 {
                    result += "\(Int.random(in: 1..<10))"
                }
            }
        }
        return Int(result)!
    }
}
