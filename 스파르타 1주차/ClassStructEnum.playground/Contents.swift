// MARK: - 클래스
// 참조 타입인 클래스 예시
class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

var person1 = Person(name: "Alice")
var person2 = person1 // 참조 복사
person2.name = "Bob"

print(person1.name) // 출력: Bob
print(person2.name) // 출력: Bob

// 예시 1
class Name {
    var name: String

        init(name: String) {
                self.name = name
        }
    
    func sayMyName() {
        print("my name is \(name)")
    }
}

let song : Name = Name(name: "song")

print(song.name) // song
song.sayMyName() // my name is song

song.name = "kim"
song.sayMyName() // my name is kim


// 예시 2
class PersonClass {
    var name: String // 저장 프로퍼티
    
    var introduction: String { // 계산 프로퍼티
        return "제 이름은 \(name)입니다."
    }
    
    init(name: String) {
        self.name = name
    }
}

// Person 객체 생성
let personClass = PersonClass(name: "Alice")
print(personClass.introduction) // 출력: 제 이름은 Alice입니다.


// 예시 3
class Counter {
    var count = 0 // 저장 프로퍼티
    
    func increment() { // 인스턴스 메서드
        count += 1
    }
    
    static func reset() { // 타입 메서드
        print("카운터를 초기화합니다.")
    }
}

// Counter 객체 생성
let counter1 = Counter()
counter1.increment()
counter1.increment()
print(counter1.count) // 출력: 2

Counter.reset() // 출력: 카운터를 초기화합니다.


// MARK: - 구조체

// 값 타입인 구조체 예시
struct Point {
    var x: Int
    var y: Int
}

var point1 = Point(x: 5, y: 10)
var point2 = point1 // 값 복사
point2.x = 15

print(point1) // 출력: Point(x: 5, y: 10)
print(point2) // 출력: Point(x: 15, y: 10)


struct Coffee {
  var name: String?
  var size: String?

  func brewCoffee() -> String {
    if let name = self.name {
      return "\(name) ☕️ 한 잔 나왔습니다"
    } else {
      return "오늘의 커피 ☕️ 한잔 나왔습니다"
    }
  }
}

let americano = Coffee(name: "아메리카노")
// 출력값: 아메리카노 ☕️ 한 잔 나왔습니다

// 따로 init()을 구현하지 않아도 자동으로 생성자를 받습니다.

// Memberwise Initializer 예시
struct ShoppingListItem {
    let name: String?
    let quantity: Int
    var purchased = false
}

let item1 = ShoppingListItem(name: "칫솔", quantity: 1)
let item2 = ShoppingListItem(name: "치약", quantity: 1, purchased: true)
let item3 = ShoppingListItem(name: nil, quantity: 1, purchased: true)



// MARK: - 열거형
// 간단한 열거형 선언
enum CompassDirection {
    case north
    case south
    case east
    case west
}

// 열거형의 인스턴스 생성 및 사용
var direction = CompassDirection.north
var anotherDirection = direction // 값 복사

direction = .east // 값을 변경해도 anotherDirection에는 영향이 없음

print(direction) // 출력: east
print(anotherDirection) // 출력: north

// 연관 값을 가진 열거형 선언
enum Trade {
    case buy(stock: String, amount: Int)
    case sell(stock: String, amount: Int)
    case hold
}

// 열거형의 인스턴스 생성 및 사용
let trade1 = Trade.buy(stock: "AAPL", amount: 100)
let trade2 = Trade.sell(stock: "GOOG", amount: 50)
let trade3 = Trade.hold

// switch 문을 사용하여 연관 값 추출
func processTrade(trade: Trade) {
    switch trade {
    case .buy(let stock, let amount):
        print("Buy \(amount) shares of \(stock).")
    case .sell(let stock, let amount):
        print("Sell \(amount) shares of \(stock).")
    case .hold:
        print("Hold this position.")
    }
}

// 각 열거형 케이스에 따라 다른 동작 수행
processTrade(trade: trade1) // 출력: Buy 100 shares of AAPL.
processTrade(trade: trade2) // 출력: Sell 50 shares of GOOG.
processTrade(trade: trade3) // 출력: Hold this position.


enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 한 케이스 선언 방법
var directionToHead = CompassPoint.west
directionToHead = .east

// 활용 예시 1
directionToHead = .south
switch directionToHead {
case .north:
    print("북쪽")
case .south:
    print("남쪽")
case .east:
    print("동쪽")
case .west:
    print("서쪽")
}
// 출력값: "남쪽"

// allCases
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) 잔 주문 가능합니다.")
// 출력값: 3잔 주문 가능합니다

