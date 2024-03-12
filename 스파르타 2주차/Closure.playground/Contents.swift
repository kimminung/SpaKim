import Foundation
// MARK: - capture
// 값 캡처
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var total = 0
    
    // 클로저를 반환합니다.
    let incrementer: () -> Int = {
        // total 변수를 캡처하여 저장합니다.
        total += amount
        return total
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

print(incrementByTen()) // total = 10, 결과: 10
print(incrementByTen()) // total = 20, 결과: 20

// 참조 캡처
class SimpleClass {
    var value: Int = 10
}

func createClosure() -> (() -> Int) {
    let instance = SimpleClass()
    
    // 참조 캡처를 사용하여 SimpleClass의 인스턴스를 캡처합니다.
    let closure: () -> Int = {
        // 클로저가 참조하는 인스턴스의 속성을 업데이트합니다.
        instance.value *= 2
        return instance.value
    }
    
    return closure
}

// 클로저 생성
let myClosure = createClosure()

print(myClosure()) // 20
print(myClosure()) // 40

// 클로저 내부에서 참조된 인스턴스의 속성을 변경하였으므로 원본에도 영향을 줍니다.


// MARK: - closure
/*
 { (parameters) -> return type in
     // 구현 코드
 }
 */

// 함수와 클로저 비교
func pay(user: String, amount: Int) {
    // code
}

let payment = { (user: String, amount: Int) in
    // code
}

func func1(_ param: String) -> String {
    return param + "!"
}

func func2(name: String) -> String {
    return name + "***"
}

// 함수를 변수에 할당가능(변수가 함수를 가르키게 됨)
var a: (String) -> String = func1

a("안녕")

a = func2

a("hello")

// 함수(클로저)를 변수에 할당해서
let closure1 = { (param: String) -> String in         // 클로저 리터럴
    return param + "!"
}

// 사용(실행)
closure1("스티브")

/// 예시1
// 1) (클로저를 파라미터로 받는 함수)정의

func closureFunc2(closure: () -> ()) {
    print("시작")
    closure()
}

// 파라미터로 사용할 함수/클로저를 정의
func doneFunc() {          // 함수를 정의
    print("종료")
}

let doneClosure = { () -> () in      // 클로저를 정의
    print("종료")
}

// 함수를 파라미터로 넣으면서 실행 (그동안에 배운 형태로 실행한다면)
closureFunc2(closure: doneFunc)

closureFunc2(closure: doneClosure)


// 2) 함수를 실행할때 클로저 형태로 전달 (클로저를 사용하는 이유)
closureFunc2(closure: { () -> () in
    print("프린트 종료")           // 본래 정의된 함수를 실행시키면서, 클로저를 사후적으로 정의 가능
})                              // (활용도가 늘어남)

closureFunc2(closure: { () -> () in
    print("프린트 종료 - 1")
    print("프린트 종료 - 2")
    
})

/// 예시2
// 1) (클로저를 파라미터로 받는 함수)정의
func closureCaseFunction(a: Int, b: Int, closure: (Int) -> Void) {
    let c = a + b
    closure(c)
}

// 2) 함수를 실행할 때 (클로저 형태로 전달)
closureCaseFunction(a: 1, b: 2, closure: { (n) in    // 사후적 정의
    print("plus : \(n)")
})

closureCaseFunction(a: 1, b: 2) {(number) in      // 사후적 정의
    print("result : \(number)")
}

closureCaseFunction(a: 4, b: 3) { (number) in      // 사후적 정의
    print("value : \(number)")
}


/*
 파라미터 생략 등 간소화 문법
 */
// 함수의 정의

func performClosure(param: (String) -> Int) {
    param("Swift")
}

// 문법을 최적화하는 과정
// 1) 타입 추론(Type Inference)
performClosure(param: { (str: String) in
    return str.count
})

performClosure(param: { str in
    return str.count
})

// 2) 한줄인 경우, 리턴을 안 적어도 됨(Implicit Return)
performClosure(param: { str in
    str.count
})

// 3) 아규먼트 이름을 축약(Shorthand Argements)
performClosure(param: {
    $0.count
})

// 4) 트레일링 클로저
performClosure(param: {
    $0.count
})

performClosure() {
    $0.count
}

performClosure { $0.count }

let closureType1 = { (param) in
    return param % 2 == 0
}

let closureType2 = { $0 % 2 == 0 }

// 축약 형태로의 활용
let closureType3 = { (a: Int, b:Int) -> Int in
    return a * b
}

let closureType4: (Int, Int) -> Int = { (a, b) in
    return a * b
}

let closureType5: (Int, Int) -> Int = { $0 * $1 }

// 순차적 실행
func sequentialExecutionExample() {
    print("Start")

    // 1. 첫 번째 작업
    for i in 1...3 {
        print("Task \(i)")
    }

    // 2. 두 번째 작업
    print("Next Task")

    // 3. 세 번째 작업
    let result = 5 + 3
    print("Result: \(result)")

    print("End")
}

sequentialExecutionExample()
/*
위의 코드는 함수 sequentialExecutionExample 내에서 순차적으로 실행됩니다.
각각의 작업은 순서대로 실행되며, 한 작업이 끝나야 다음 작업이 실행됩니다.
이 예시에서는
'Start', 'Task 1', 'Task 2', 'Task 3', 'Next Task', 'Result: 8', 'End'
와 같은 순서로 출력됩니다.
*/

func asynchronousExecutionExample() {
    print("Start")

    // 1. 비동기로 실행되는 작업
    DispatchQueue.global().async {
        for i in 1...3 {
            print("Async Task \(i)")
        }
    }

    // 2. 순차적으로 실행되는 작업
    print("Next Task")

    // 3. 또 다른 비동기 작업
    DispatchQueue.global().async {
        let result = 5 + 3
        print("Async Result: \(result)")
    }

    // 4. 끝 부분
    print("End")
}

asynchronousExecutionExample()

/*
위의 코드는 비동기적으로 실행되는 예시입니다.
DispatchQueue.global().async를 사용하여 클로저가 다른 스레드에서 비동기적으로 실행됩니다.
따라서 비동기 작업은 순차적인 흐름을 방해하지 않고 별도의 스레드에서 실행됩니다.

실행 결과는
'Start', 'Next Task', 'End' 순서로 출력되고,
비동기 작업은 나중에 완료되어
'Async Task 1', 'Async Task 2', 'Async Task 3', 'Async Result: 8'와 같이
순서는 보장되지 않는 시점에 출력됩니다.
이는 비동기 작업이 별도의 스레드에서 동작하기 때문에,
주 스레드의 작업과 병행적으로 실행됨을 보여줍니다.
*/

// MARK: - escaping closure
// 1) 외부 변수 저장
var defaultFunction: () -> () = { print("출력") }

func escapingFunc(closure: @escaping () -> ()) {
        // 클로저를 실행하는 것이 아니라  aSavedFunction 변수에 저장.
        // 함수는 변수와 달리 기본적으로 외부 할당이 불가능
    defaultFunction = closure
}

// 2) GCD 비동기 코드
func asyncEscaping(closure: @escaping (String) -> ()) {
    
    var name = "iOS튜터"
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { //3초뒤에 실행하도록 만들기
        closure(name)
    }
}

asyncEscaping { str in
    print("name : \(str)")
}

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()    // 함수 안에서 끝나는 클로저
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } // 명시적으로 self를 적어줘야 합니다.
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"

