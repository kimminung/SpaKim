import Cocoa

func doubleArray(_ num1:Int, _ num2:Int) -> [[Int]] {
    
//    var arrA : [[Int]] = Array(repeating: Array(repeating: 1,count:num1 ), count: num2)
    
//    var arr2 = [[Int]](repeating: Array(repeating: 1,count: 5 ), count: 3)

    var arr1 = [Int]()
    var arrB : [[Int]] = []
//    var arrTotal : [[Int]] = [[]]
    for j in 0..<num2 {
        arr1.append(j)
    }
    for i in 0..<num1 {
        arrB.append(arr1)
    }
//        arr1 = [arr1.first!+10]
    
//    for i in 0..<num1 {
//        arrB.append([[i*10][0]])
//        for j in 1..<num2 {
//            arrB.append([[j][0]])
//        }
//    }
    
//    for k in
    print(arrB)
//    print(arrB)
    return arrB
}

doubleArray(10, 10)


//이승원님 자료
/*
 /*
 [240306 Q&A 공유]
 1. n차원 배열 순회
 a. 모든 요소를 순회하기 위해서 1차원, 2차원, 3차원... 늘어날 때마다 1개, 2개, 3개..의 for-in 순회가 필요 (map 등의 고차함수를 사용해도 마찬가지)
 b. 연습: 0~99까지 숫자를 순서대로 10개마다 1개의 배열로 구성한 총 10개의 1차원 배열이 들어있는 2차원 배열에서 3의 배수에 해당하는 요소만 출력해보기
 아래 2차원 배열을 직접입력하는 하드코딩 방식 대신 다른 방법으로 생성할 수있는 방법이 있는지도 고민해보기
 */
 import Foundation

 var numArr : [[Int]] = []
 for i in stride(from: 0, to: 100, by: 10){
     var tempArr : [Int] = []
     for j in i..<i+10{
         tempArr.append(j)
     }
     numArr.append(tempArr)
 }

 let flatArr = numArr.flatMap{$0}
 let answer = flatArr.filter{$0 % 3 == 0}
 for (index,element) in numArr.enumerated() {
     numArr[index] = numArr[index].filter{$0 % 3 == 0}
 }
 print(numArr)
 print(answer)
 */

