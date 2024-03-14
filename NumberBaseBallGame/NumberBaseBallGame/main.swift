import Foundation

/* // 입력 부분 1차 주석 (46번라인 2차 2주석 있음)
print("게임 시작")
/// BaseballGame.swift, Lv.1 , Lv2
while true {
    print("숫자3개 입력:")
//    print(<#T##Any...#>, separator: <#T##String#>, terminator: <#T##String#>)
    //정수 입력받기
    if let n = readLine() {
        if n.count == 3 {
//            for i in n {
//                //                if
//            }
            if let n = Int(n) {*/ // 입력 부분 1차 주석 해제 (46번라인 2차 주석 있음)
                ///main.swift <->BaseballGame.swift
                ///위에서 입력 받게끔
//                let game = BaseballGame()
//                game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기
                
                ///main.swift <-> Lv1.swift
                ///위에서 입력 받게끔
//                let gameLv1 = Lv1(n: n )
//                gameLv1.start()
                
                ///main.swift <-> Lv2.swift
                ///위에서 입력 받게끔
//                let gameLv2 = Lv2(n: n )
//                gameLv2.start()
                
                ///main.swift <-> Lv3.swift
                ///함수 실행부                    // Lv1, 2와 다르게 따로 입력라인 만들어 봄
                  let gameLv3 = Lv3()
                  try gameLv3.start()

                ///main.swift <-> Lv4.swift
//                let gameLv4 = Lv4(n: n )
//                gameLv4.start(입력값: Lv4)
                
                ///main.swift <-> Lv5.swift
//                let gameLv5 = Lv5(n: n )
//                gameLv5.start(입력값: Lv5)
                
                ///main.swift <-> Lv6.swift
//                let gameLv6 = Lv6(n: n )
//                gameLv6.start(입력값: Lv6)
// 입력 부분 2차 주석
          /*  }
            
        } else {
            print("0을 제외한 서로 다른 숫자 3가지 입력.")
        }
    }
}*/ // 입력 부분 2차 주석 해제


/// readLine() 함수를 이용하여 유저의 입력값 처리하기
/// readLine() 함수에 대해 학습해보고 활용하기

/*
 let input = readLine()
 print(type(of:input))
 // prints "Optional<String>"
 
 let inputOut = input!
 print(type(of:inputOut))
 //prints "String"
 
 let intvar = Int(InputOut)
 print(type(of:intvar))
 //prints "Optional<Int>"
 
 let result = intvar!
 print(type(of:result))
 //prints "Int"
 */


// 이를 한번에 입력하고 싶다면 아래와 같이 코드를 작성하면 된다.
//정수 입력받기
//let n = Int(readLine()!)!

/*
 //문자열 하나 입력받기
 let text = readLine()!
 
 
 //띄어쓰기 구분하여 입력받기, 바로 배열로 입력받기
 let input1 = readLine()!  // h e l l o 라고 입력
 print(type(of: input1))
 print(input1)
 // prints "String"
 // prints "h e l l o"
 
 
 let result1 = input1.components(separatedBy: " ")
 print(type(of: result1))
 print(result1)
 // prints "Array<String>"
 // prints ["h", "e", "l", "l", "o"]
 
 
 /*
  fountdation 프레임워크에 포함되어있는 components 메서드를 활용하여 띄어쓰기로 구분해주었다. 이렇게 쓰게 되면 띄어쓰기를 기준으로 입력받은 문자열이 "배열" 로 바로 return된다. 유용할것 같다!
  */
 
 
 
 
 //띄어쓰기로 정수 여러개 입력 받기
 let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
 // 입력: 1 2 3
 // Array<Int>
 // [1, 2, 3]
 
 
 //(띄어쓰기없이) 한 번에 입력 받아서 배열로 return하기
 let input3 = Array(readLine()!) //입력; hello
 print(input3)
 print(type(of:input3))
 
 //prints ["h", "e", "l", "l", "o"]
 // prints Array<String>
 /*
  흔하진 않지만, 간혹 띄어쓰기 없이 입력을 받는 경우가 있다. 그럴 때 위와 같은 방법을 사용하면 좋다. 알아서 저절로 한글자씩 배열의 한 인덱스에 저장해준다. 편한것 같다. 이를 int형으로 입력받고 싶다면 아래와 같이 작성하자.
  */
 
 
 //
 let result2 = input3.map { Int(String($0))! }
 print(result2)
 print(type(of: result2))
 
 //prints [1,2,3,4,5]  만약, 입력이 "12345" 였다면 이렇게 출력,
 //prints Array<Int>
 */

/*
 //처음 만들려고 했던것
 let nn = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 //let (a, b, c) = (n[0], n[1], n[2])
 
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
 print(result)
 
 for i in nn {
 if i == Int(result.prefix(0)) {
 print("\(i+1)strike")
 }
 }
 */
