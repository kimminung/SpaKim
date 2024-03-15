////
////  Lv2.swift
////  NumberBaseBallGame
////
////  Created by 민웅킴 on 3/12/24.
////
///
//   하고싶었던것:
//
//  1. readLine puppeteer swift 안되넹 입력 상태 만들려고 했는딩
//
//  2. DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
//      print("숫자3개 입력: \(n)")
//    }        차라리 배운걸로, 처음에 멍때리고 입력하는곳 못찾을까봐 3초 뒤에 입력하세요 띄우려고했는데 잘 안됨
//    break

//  3. guard n.isWholNumber == true else {return start()} 인트형 체크하려고 시도 사용 실패
//  4. guard n.wholeNumberValue > 0 else {return start()} 인트형인지 값으로 체크하려고 시도 실패
//
import Foundation
//
class Lv2 {
    let n : Int
    init(n: Int) {
        self.n = n
    }
    
    func intToArray (_ number: Int) -> [Int] {
        var num = number
        var result = [Int]()
        while num >= 1 {
            result.append(num % 10)
            num /= 10
        }
        return result
    }
    
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        let inputVal = n
        var exit: Bool = false
        
        let answerList = intToArray(answer)
        let inputList = intToArray(inputVal)
        

        
        print(answer)
        repeat {
            var ball: Int = 0
            var strike: Int = 0
            var answerIndex: Int = 0
            var inputIndex: Int = 0
            // 1. 유저에게 입력값을 받음
            // main.swift에서 처리
            
            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            // main.swift에서 처리
            
            // 3. 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            //0을 가진거, 반복 아직 처리 못했음
            
            // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
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
            
        } while exit == true
        
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


//
func examLv2() {
    let answer = ExamLv2MakeAnswer()
    
    print("정답:", answer)
    
    print("< 게임을 시작합니다 >")
    
    let input = readLine() ?? "" // ?? : 오류날 경우 빈 문자열로 처리를 한다.
    
    print("User Input: ", input)
    
    
    
    //let input = "123ㄱ"
    
    /*
//    let stringArr = input.map { $0 } //$0: String.Element
    let stringArr = input.map { String($0) }
    
    print(stringArr.compactMap{ Int($0) })
    */
    while true {
        
        print("숫자를 입력하세요")
        let numberArray = input.map { String($0) }.compactMap{Int($0)} //체이닝
        
        //    print(numberArray)
        //TODO: input 값 검증
        let isValidate = validateInput(numberArray)
        
        guard isValidate else {
            print("올바르지 않은 값입니다.")
            print()
//            exit(0) //exit func exit(_: Int32) -> Never
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
    
//    print("스트라이크:", strike)
//    print("볼:", ball)
    
    // let input = "123"
    
    // for text in input {
    // print(text)
    // print(type(of: text))    //character
    // }
    
}
func ExamLv2MakeAnswer() -> [Int] {
    
    let arr = (1...9).map { $0 }

    let shuffledArray = arr.shuffled()

    return [Int](shuffledArray[0...2]) //type conversion
}
    //유효한 값이면  true, 않으면 false
/*
func validateInput(_ input: [Int]) -> Bool {
    guard input.count == 3 else {
        return false
    }
    return true
}*/

func validateInput(_ input: [Int]) -> Bool {
    input.count == 3
}
