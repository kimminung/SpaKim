////
////  Lv3.swift
////  NumberBaseBallGame
////
////  Created by 민웅킴 on 3/12/24.
////
//
import Foundation
//
class Lv3 {
    let n : Int
    init(n: Int) {
        self.n = n
    }
    func makeAnswer() -> Int {
//        // Lv1에서 구현한 로직을 변경하기
        return Int.random(in: 1..<10)
    }
}
//
///*
// 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요
// 맨 앞자리에 0이 오는 것은 불가능합니다
// 092 → 불가능
// 870 → 가능
// 300 → 불가능
// 코드 뼈대 보기(어떻게 시작할지 막막한 경우에만 참고)
// // BaseballGame.swift 파일
//
//
// */
