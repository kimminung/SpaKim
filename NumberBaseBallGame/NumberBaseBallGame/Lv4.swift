////
////  Lv4.swift
////  NumberBaseBallGame
////
////  Created by 민웅킴 on 3/12/24.
////
//
//import Foundation
////
//class Lv4 {
//let n : Int
//init(n: Int) {
//    self.n = n
//}
//    func start(입력값: Lv4) {
//    while true { // while 뒤의 조건(XX) 작성해보기
////      // 1. 안내문구 출력
////      
////        // 2. 유저의 입력값을 받음
////           
////        // 3. 입력값에 따라 처리(switch - case 활용해보기)
//        switch `입력값` {
//        case .start:
//        fallthrough
//            return    // 1을 입력한 케이스 작성
//        case .log:
//            return    // 2을 입력한 케이스 작성
//        case .exit:
//            return    // 3을 입력한 케이스 작성
//        default: return
//        }
//    }
//    }
//}
//
//enum Lv4 {
//  case start
//  case log
//  case exit
//}
//
///*
// 프로그램을 시작할 때 안내문구를 보여주세요
// // 예시
// 환영합니다! 원하시는 번호를 입력해주세요
// 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
// ​
// 1번 게임 시작하기의 경우 “필수 구현 기능” 의 예시처럼 게임이 진행됩니다
// 정답을 맞혀 게임이 종료된 경우 위 안내문구를 다시 보여주세요
// // 예시
// 환영합니다! 원하시는 번호를 입력해주세요
// 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
// 1 // 1번 게임 시작하기 입력
//
// < 게임을 시작합니다 >
// 숫자를 입력하세요
// .
// .
// .
// */
//
class BaseballGame2 {
    func examLv4() {
        showGreetingMessage()
        while true {
            let option = readLine() ?? ""
            
            switch option {
            case "1":
                
                playGame()
                //            case "2":
                //            case "3":
            default:
                print("올바르지 않은 값입니다.")
            }
        }
    }
    
    func ExamLv4MakeAnswer() -> [Int] {
        
        let arr = (0...9).map { $0 }
        
        let shuffledArray = arr.shuffled()
        
        if shuffledArray[0] == 0 {
            return [Int](shuffledArray[1...3])
        } else {
            return [Int](shuffledArray[0...2]) //type conversion
        }
    }
    
    
    func validateInput3(_ input: [Int]) -> Bool {
        input.count == 3
    }
    
    func showGreetingMessage() {
        //lv4
        let greetingMessage = """
    환영합니다! 원하시는 번호를 입력해주세요
    1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
    """
        
        print(greetingMessage)
    }
    
    func playGame() {
        let answer = ExamLv4MakeAnswer()
        
        print("정답:", answer)
        print("< 게임을 시작합니다 >")
        while true {
            
            print("숫자를 입력하세요")
            let input = readLine() ?? ""
            
            let numberArray = input.map { String($0) }.compactMap{Int($0)} //체이닝
            
            
            //TODO: input 값 검증
            let isValidate = validateInput3(numberArray)
            
            guard isValidate else {
                print("올바르지 않은 값입니다.")
                print()
                
                continue
            }
            
            var strike = 0
            var ball = 0
            
            for (index, number) in numberArray.enumerated() { // enumerated() 튜플식으로 index가 딸려옴
                
                //스트라이크
                if number == answer[index] {
                    strike += 1
                    continue
                }
                
                //볼
                if answer.contains(number) {
                    ball += 1
                    continue
                }
            }
            
            if strike == 0, ball == 0 {
                print("Nothing")
            } else if strike == 3 {
                print("정답입니다")
                break
            }else{
                print("\(strike)스트라이크", terminator: " ")
                print("\(ball)볼")
            }
            print()
        }
        
        
    }
    
}
