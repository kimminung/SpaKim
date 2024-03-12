// MARK: - inout 키워드
/*
inout 키워드는 함수 내에서 매개변수로 전달된 값을 변경하고,
이를 함수 외부에서도 반영할 수 있도록 하는 데 사용됩니다.
이를 통해 함수 내에서 매개변수의 값을 직접 수정할 수 있습니다.

inout 키워드 사용 방법:
1. 매개변수에 inout 키워드를 붙여 선언합니다.
2. 함수 호출 시 매개변수를 & 기호로 전달하여 해당 값을 참조로 전달합니다.
*/


// 함수 정의
func increment(_ value: inout Int) {
    value += 1
}

var number = 5
print("Before increment: \(number)") // 출력: Before increment: 5

// 함수 호출 시 매개변수에 &를 사용하여 변수의 참조를 전달
increment(&number)

print("After increment: \(number)") // 출력: After increment: 6


// MARK: - Generic

// 두 변수의 값을 바꿔주는 함수를 타입별로 작성해야함(제네릭 사용 X)
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// 제네릭을 사용하면 타입에 상관없이 사용가능함
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}


// 이전에 배웠던 큐, 스택을 다시 살펴보자
struct Queue<T> {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(20)
queue.dequeue() // 10

struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}

var stack = Stack<Int>()
stack.push(10)
stack.push(20)
stack.pop() // 20


// MARK: 딕셔너리 예시
/*
@frozen public struct Dictionary<Key, Value> where Key : Hashable {

    /// The element type of a dictionary: a tuple containing an individual
    /// key-value pair.
    public typealias Element = (key: Key, value: Value)


var fruitsInventory: Dictionary<String, Int> = [:]
fruitsInventory["apple"] = 3

Key, Value 타입의 제네릭으로 되어있어 우리는 원하는 타입으로 딕셔너리를 생성할 수 있음
제약조건은 Key가 Hashable 프로토콜만 따르면 되는 것이다
기본 자료형인 String은 Hashable 프로토콜을 따르고 있음
만약 다른 자료형을 Key로 사용하려면 Hashable 프로토콜을 채택해야 함
*/


/*
where 키워드는 무엇일까요?

제네릭의 제약조건(Constraints)인 where 키워드는 제네릭 타입에 특정 조건을 부여하여
해당 제약을 충족하는 타입만을 사용할 수 있도록 하는 기능입니다.
where 키워드를 사용하여 제네릭 타입에 특정 프로토콜 채택,
특정 타입과의 상속 관계 등을 제한할 수 있습니다.
*/

// 프로토콜 채택 제약 예시
func process<T>(value: T) where T: Numeric {
    // Numeric 프로토콜을 채택하는 타입만을 제네릭 타입 T로 받음
    print("Value is a numeric type.")
}

process(value: 5) // 출력: Value is a numeric type.
process(value: 3.14) // 출력: Value is a numeric type.
// process(value: "Hello") // 컴파일 에러 - 문자열은 Numeric 프로토콜을 채택하지 않음


// 클래스의 상속 관계 제약 예시
class MyClass {}
class MySubclass: MyClass {}

func process<T>(value: T) where T: MyClass {
    print("Value is an instance of MyClass or its subclasses.")
}

let obj = MySubclass()
process(value: obj) // 출력: Value is an instance of MyClass or its subclasses.
// process(value: "Hello") // 컴파일 에러 - 문자열은 MyClass 또는 그 하위 클래스가 아님
