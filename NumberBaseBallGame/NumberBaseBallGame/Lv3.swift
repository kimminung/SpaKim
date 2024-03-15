//
//  Lv3.swift
//  NumberBaseBallGame
//
//  Created by 민웅킴 on 3/12/24.
//
//
import Foundation

enum CustomError: Error {
    case outOfBounds
    case invalidInput(String)
    case otherError(String)
}
//
class Lv3 {
    
    //    func inputLine() throws -> Int {
    //        if let input = readLine() {
    //            if let input = Int(input) {
    //                if input < 0 {
    //                    // guard input.isWholNumber == true else {return 0}
    //                    // guard n.wholeNumberValue > 0 else {return 0}
    //                    throw CustomError.invalidInput("Value cannot be negative")
    //                } else if String(input).count != 3, String(input).first == "0"   {
    //                    throw CustomError.invalidInput("Value cannot be negative")
    //                } else {
    //
    //                }
    //            }
    //        }
    //        return 0
    //    }
    
    func intToArray (_ number: Int) -> [Int] {
        var num = number
        var result = [Int]()
        while num >= 1 {
            result.append(num % 10)
            num /= 10
        }
        return result
    }
    
    func makeAnswer() -> Int {
        var result = ""
        // Lv1에서 구현한 로직을 변경하기
        for _ in 1...3 {
            result += "\(Int.random(in: 1...9))"
        }
        return Int(result)!
    }
    
    func start() throws {
        let answer = makeAnswer()
        print("정답은 \(answer)입니다.")
        
        var exit: Bool = false
        
        repeat {
            if let input = readLine() {
                if let input = Int(input) {
                    if input < 0, String(input).count != 3, String(input).first == "0"   {
                        throw CustomError.invalidInput("Value cannot be negative")
                    } else if input > 0, String(input).count == 3, String(input).first != "0"{
                        let inputVal = input
                        let answerList = intToArray(answer)
                        let inputList = intToArray(inputVal)
                        var ball: Int = 0
                        var strike: Int = 0
                        var answerIndex: Int = 0
                        var inputIndex: Int = 0
                        for i in answerList{
                            
                            inputIndex = 0
                            for input in inputList{
                                if i == input {
                                    if answerIndex == inputIndex {
                                        strike += 1
                                        break
                                    } else {
                                        ball += 1
                                        break
                                    }
                                }
                                inputIndex += 1
                            }
                            answerIndex += 1
                        }
                        
                        if strike == 3 {
                            exit = true
                            print("정답입니다!")
                            // 만약 정답이라면 break 호출하여 반복문 탈출
                            break
                        } else {
                            print("strike \(strike), ball \(ball)")
                            continue
                        }
                    }
                }
            }
            
        } while exit == false
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
//
func examLv3() {
    let answer = ExamLv3MakeAnswer()
    
    print("정답:", answer)
    
    print("< 게임을 시작합니다 >")
    
    let input = readLine() ?? "" // ?? : 오류날 경우 빈 문자열로 처리를 한다.
    
    print("User Input: ", input)
    
    
    while true {
        
        print("숫자를 입력하세요")
        let numberArray = input.map { String($0) }.compactMap{Int($0)} //체이닝
        
        //    print(numberArray)
        //TODO: input 값 검증
        let isValidate = validateInput2(numberArray)
        
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
func ExamLv3MakeAnswer() -> [Int] {
    
    let arr = (0...9).map { $0 }    //lv3
    
    let shuffledArray = arr.shuffled()
    
    if shuffledArray[0] == 0 {
        return [Int](shuffledArray[1...3])
    } else {
        return [Int](shuffledArray[0...2]) //type conversion
    }
}


func validateInput2(_ input: [Int]) -> Bool {
    input.count == 3
}
