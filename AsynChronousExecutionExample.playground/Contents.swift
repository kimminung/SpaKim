import Cocoa

var greeting = "Hello, playground"
//비동기식 코딩

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
