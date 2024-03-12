import Foundation


//let game = BaseballGame()
//game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기
//
//// readLine() 함수를 이용하여 유저의 입력값 처리하기
//// readLine() 함수에 대해 학습해보고 활용하기
//let input = readLine()



//처음 만들려고 했던것
let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
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

for i in n {
    if i == Int(result.prefix(0)) {
        print("\(i+1)strike")
    }
}




