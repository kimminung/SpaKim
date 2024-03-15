////
////  Lv6.swift
////  NumberBaseBallGame
////
////  Created by 민웅킴 on 3/12/24.
////
//
//import Foundation
////
//class Lv6 {
//let n : Int
//init(n: Int) {
//    self.n = n
//}
//    func start(입력값: Lv6) {
//    while true { // while 뒤의 조건(XX) 작성
////        // 안내문구 출력
////        // 유저의 입력값을 받음
////           
////        // 유저의 잘못된 입력값에 대한 처리 로직 구현
////          
//        switch `입력값` {
//        case .start:
//          return      // 1을 입력한 케이스
//        case .log:
//          return      // 2을 입력한 케이스
//        case .exit:
//           return     // 3을 입력한 경우 프로그램 종료시키기. while 뒤 조건 XX를 조작하기
//        default: return
//        }
//    }
//    }
//}
//
//enum Lv6 {
//  case start
//  case log
//  case exit
//}
//
///*
// 3번 종료하기의 경우 프로그램이 종료됩니다
// 이전의 게임 기록들도 초기화됩니다
// // 예시
// 환영합니다! 원하시는 번호를 입력해주세요
// 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
// 3 // 3번 종료하기 입력
//
// < 숫자 야구 게임을 종료합니다 >
// ​
// 1, 2, 3 이외의 입력값에 대해서는 오류 메시지를 보여주세요
// // 예시
// 환영합니다! 원하시는 번호를 입력해주세요
// 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
// 4
//
// 올바른 숫자를 입력해주세요!
// ​
// 코드 뼈대 보기(어떻게 시작할지 막막한 경우에만 참고)
// class 혹은 struct {
//     func start() {
//     while XX { // while 뒤의 조건(XX) 작성
//         // 안내문구 출력
//         // 유저의 입력값을 받음
//            
//         // 유저의 잘못된 입력값에 대한 처리 로직 구현
//           
//         switch 입력값 {
//             case
//                 // 1을 입력한 케이스
//             case
//                 // 2을 입력한 케이스
//             case
//                 // 3을 입력한 경우 프로그램 종료시키기. while 뒤 조건 XX를 조작하기
//             default
//         }
//     }
//     }
// }
// */
//
class BaseballGame4 {
    
    func examLv6() {
        showGreetingMessage()               //계속 반복중인 상태
        var tryCountPerGame: [Int] = [] //지역변수는 start가 종료되야만 메모리에서 사라짐.
        
        while true {
        let option = readLine() ?? ""
        
            switch option {
            case "1":
                
                let tryCount = playGame3()
                tryCountPerGame.append(tryCount)
            case "2":
                showGameLog(tryCountPerGame)
                break
            case "3":
                print("숫자 야구 게임을 종료합니다")            //lv6
                exit(0)                   //C언어에서는 종료로 씀. 0은 종료 1은 강제종료...
                break
            default:
                print("올바르지 않은 값입니다.")
                print()
            }
        }
    }
    
    func ExamLv6MakeAnswer() -> [Int] {
        
        let arr = (0...9).map { $0 }
        
        let shuffledArray = arr.shuffled()
        
        if shuffledArray[0] == 0 {
            return [Int](shuffledArray[1...3])
        } else {
            return [Int](shuffledArray[0...2]) //type conversion
        }
    }
    
    
    func validateInput5(_ input: [Int]) -> Bool {
        input.count == 3
    }
    
    func showGreetingMessage() {
        
        let greetingMessage = """
    환영합니다! 원하시는 번호를 입력해주세요
    1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
    """
        
        print(greetingMessage)
    }
    // 반환값 : 이번 게임의 시도횟수
    func playGame3() -> Int {
        
        var tryCount = 0
        
        let answer = ExamLv6MakeAnswer()
        
        print("정답:", answer)
        print("< 게임을 시작합니다 >")
        while true {
            
            print("숫자를 입력하세요")
            let input = readLine() ?? ""
            tryCount += 1
            let numberArray = input.map { String($0) }.compactMap{Int($0)} //체이닝
            
            
            //TODO: input 값 검증
            let isValidate = validateInput5(numberArray)
            
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
                print()
                return tryCount
            }else{
                print("\(strike)스트라이크", terminator: " ")
                print("\(ball)볼")
            }
            print()
        }
        
        
    }
    
    func showGameLog(_ tryCountPerGame: [Int]) {
        print("<게임 기록 보기>")
        for (index, tryCount) in tryCountPerGame.enumerated() {
            print("\(index+1)번째게임: 시도 횟수 - \(tryCount)")
        }
        print()
    }
    
}
