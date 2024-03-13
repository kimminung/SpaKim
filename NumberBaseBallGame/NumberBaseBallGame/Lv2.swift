////
////  Lv2.swift
////  NumberBaseBallGame
////
////  Created by 민웅킴 on 3/12/24.
////
///
//   하고싶었던것:
//
//  1. readLine puppeteer swift 안되넹
//
//  2. DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
//      print("숫자3개 입력: \(n)")
//    }
//    break

//  3.            guard n.isWholNumber == true else {return start()}
//  4.            guard n.wholeNumberValue > 0 else {return start()}
//
import Foundation
//
class Lv2 {
    let n : Int
    init(n: Int) {
        self.n = n
    }
    
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        
        print(answer)
        while true {
            //            // 1. 유저에게 입력값을 받음
            //              // 우측 하단에 숫자 3개 입력하시고 ENTER!!
            //            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            guard let regex = try? NSRegularExpression(pattern: "^[1-9]*$") else { return }
            let range = NSRange(location: 0, length: String(n).utf16.count)
                guard regex.matches(in: String(n), range: range).count > 0 else { return }
            
            //            // 3. 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            //
            //            // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
            //            // 만약 정답이라면 break 호출하여 반복문 탈출
        }
        
    }
    func makeAnswer() -> Int {
        var result = ""
        // 함수 내부를 구현하기
        for _ in 1...3 {
            
            result += "\(Int.random(in: 1...9))"
        }
        return Int(result)!
    }
}
//
///*
// 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
// 힌트는 야구용어인 볼과 스트라이크입니다.
// 같은 자리에 같은 숫자가 있는 경우 스트라이크, 다른 자리에 숫자가 있는 경우 볼입니다
// ex) 정답 : 456 인 경우
// 435를 입력한 경우 → 1스트라이크 1볼
// 357를 입력한 경우 → 1스트라이크
// 678를 입력한 경우 → 1볼
// 123를 입력한 경우 → Nothing
// ex) 정답 : 456 인 경우
// 435를 입력한 경우 → 1스트라이크 1볼
// 357를 입력한 경우 → 1스트라이크
// 678를 입력한 경우 → 1볼
// 123를 입력한 경우 → Nothing
// 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
// 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
// 실행 예시(정답 : 456)
// < 게임을 시작합니다 >
// 숫자를 입력하세요
// 435
// 1스트라이크 1볼
//
// 숫자를 입력하세요
// 357
// 1스트라이크
//
// 숫자를 입력하세요
// 123
// Nothing
//
// 숫자를 입력하세요
// dfg // 세 자리 숫자가 아니어서 올바르지 않은 입력값
// 올바르지 않은 입력값입니다
//
// 숫자를 입력하세요
// 199 // 9가 두번 사용되어 올바르지 않은 입력값
// 올바르지 않은 입력값입니다
//
// 숫자를 입력하세요
// 103 // 0이 사용되어 올바르지 않은 입력값
// 올바르지 않은 입력값입니다
//
// 숫자를 입력하세요
// 456
// 정답입니다!
// */
