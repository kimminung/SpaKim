// MARK: - 큐

/*
<T> 에 대해서는 추후 배울 예정
제네릭이라는 것인데, 하나의 타입으로 국한되지 않고
타입에 유연하게 코드를 작성할 수 있는 기능입니다.
*/

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



// MARK: - 스택

/*
<T> 에 대해서는 추후 배울 예정
제네릭이라는 것인데, 하나의 타입으로 국한되지 않고
타입에 유연하게 코드를 작성할 수 있는 기능입니다.
*/
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
