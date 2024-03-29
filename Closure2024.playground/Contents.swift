import UIKit
import Foundation

var add = { (first: Int, second: Int) -> Int in
    return first + second
}

var add2 : (Int, Int) -> Int = { (first, second) in
    return first + second
}

let result = add(1,2)
print(result)

let result2 = add2(1,2)
print(result2)


//Int + Int + 함수타입 파라미터
func add(first: Int, second: Int, completionHandler:(Int) -> Void) {
    let result3 = first + second
    completionHandler(result3)
}

add(first: 1, second: 2, completionHandler: {
    (number: Int) -> Void in
    print("계산 결과는 \(number)입니다.")
})




func add2(first: Int, second: Int, completionHandler:(Int) -> Void) {
    let result3 = first + second
    completionHandler(result3)
}

add2(first: 1, second: 2, completionHandler: {
    (number: Int) in
    print("계산 결과는 \(number)입니다.")
})



func add3(first: Int, second: Int, completionHandler:(Int) -> Void) {
    let result3 = first + second
    completionHandler(result3)
}

add3(first: 1, second: 2, completionHandler: {
    number in
    print("계산 결과는 \(number)입니다.")
})




func add4(first: Int, second: Int, completionHandler:(Int) -> Void) {
    let result3 = first + second
    completionHandler(result3)
}

add4(first: 1, second: 2, completionHandler: {
    
    print("계산 결과는 \($0)입니다.")
})



func add5(first: Int, second: Int, completionHandler:(Int, Int) -> Void) {
//    let result3 = first + second
    completionHandler(3, 5)
}

add5(first: 1, second: 2, completionHandler: {
    
    print("계산 결과는 \($0)입니다.")
    print("계산 결과2는 \($1)입니다.")
})


add5(first: 3, second: 5) {
    print("이렇게도 호출이 가능해요")
    print("계산 결과는 \($0)입니다.")
    print("계산 결과2는 \($1)입니다.")
}
