////
////  File.swift
////  NumberBaseBallGame
////
////  Created by 민웅킴 on 3/12/24.
////
//
//import Foundation
////
//class Lv5 {
//let n : Int
//init(n: Int) {
//    self.n = n
//}
////    var recordManager = RecordManager() // 기록을 관리하는 인스턴스 생성
////    
//    func start(입력값:Lv5) {
//    while true {
//        switch `입력값` {
//        case .start:
//         return       // 1을 입력한 케이스
////                ...
////                // trialCount는 1회 게임에서의 시도 횟수
////                recordManager.add(trialCount: trialCount) // add 함수 구현하기
//        case .log:
//        return        // 2을 입력한 케이스
////                ...
////                recordManager.showRecords() // showRecords 함수 구현하기
//        case .exit:
//          return      // 3을 입력한 케이스
//        default: return
//        }
//    }
//    }
//}
//
//enum Lv5 {
//  case start
//  case log
//  case exit
//}
//
///*
// 2번 게임 기록 보기의 경우 완료한 게임들에 대해 시도 횟수를 보여줍니다
// // 예시
// 환영합니다! 원하시는 번호를 입력해주세요
// 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
// 2 // 2번 게임 기록 보기 입력
//
// < 게임 기록 보기 >
// 1번째 게임 : 시도 횟수 - 14
// 2번째 게임 : 시도 횟수 - 9
// 3번째 게임 : 시도 횟수 - 12
// .
// .
// .
// */
//
class BaseballGame3 {
    
    func examLv5() {
        showGreetingMessage()               //계속 반복중인 상태
        var tryCountPerGame: [Int] = [] //지역변수는 start가 종료되야만 메모리에서 사라짐.
        
        while true {
        let option = readLine() ?? ""
        
            switch option {
            case "1":
                
                let tryCount = playGame2()
                tryCountPerGame.append(tryCount)
            case "2":
                showGameLog(tryCountPerGame)           //Lv5
                break
            case "3":
                break
            default:
                print("올바르지 않은 값입니다.")
            }
        }
    }
    
    func ExamLv5MakeAnswer() -> [Int] {
        
        let arr = (0...9).map { $0 }
        
        let shuffledArray = arr.shuffled()
        
        if shuffledArray[0] == 0 {
            return [Int](shuffledArray[1...3])
        } else {
            return [Int](shuffledArray[0...2]) //type conversion
        }
    }
    
    
    func validateInput4(_ input: [Int]) -> Bool {
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
    func playGame2() -> Int {
        
        var tryCount = 0
        
        let answer = ExamLv5MakeAnswer()
        
        print("정답:", answer)
        print("< 게임을 시작합니다 >")
        while true {
            
            print("숫자를 입력하세요")
            let input = readLine() ?? ""
            tryCount += 1
            let numberArray = input.map { String($0) }.compactMap{Int($0)} //체이닝
            
            
            //TODO: input 값 검증
            let isValidate = validateInput4(numberArray)
            
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
