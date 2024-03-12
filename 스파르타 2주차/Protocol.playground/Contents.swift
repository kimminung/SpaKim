// MARK: - 프로토콜
/*
 protocol 프로토콜이름 {
  // 프로토콜 정의
 }

 // 상속받는 클래스의 프로토콜 채택
 class 클래스이름: 슈퍼클래스, 프로토콜1, 프로토콜2 {
  // 클래스 정의
 }
 */
// 예시
protocol Student {
    var studentId: Int { get set }
    var name: String { get }
    func printInfo() -> String
}

struct UnderGraduateStudent: Student {
    var studentId: Int
    var name: String
    var major: String
    
    func printInfo() -> String {
        return "\(name), whose student id is \(studentId), is major in \(major)"
    }
}

struct GraduateStudent: Student {
    var studentId: Int
    var name: String
    var degree: String
    var labNumber: Int
    
    func printInfo() -> String {
        return "\(name), member of lab no.\(labNumber), has a \(degree) degree"
    }
}

// 프로토콜은 타입으로서도 사용가능
let underGraduate: Student = UnderGraduateStudent(studentId: 1, name: "홍길동", major: "computer")
let graduate: Student = GraduateStudent(studentId: 2, name: "김철수", degree: "master", labNumber: 104)

let studentArray: [Student] = [underGraduate, graduate]

// 프로토콜의 다중상속
protocol Coordination
 {
    var top: String { get set }
    var pants: String { get set }

    init(top: String, pants: String)

    func checkCoordination()
}

protocol Hair {
    var hair: String { get }

    func checkHairStyle()
}

struct Person: Coordination, Hair {
    var top: String
    var pants: String
    let hair: String = "포마드"

    func checkHairStyle() {
        print("오늘의 헤어스타일은 \(hair)스타일")
    }

    func checkCoordination() {
        print("상의: \(top)\n하의: \(pants)")
    }

    init(top: String, pants: String) {
        self.top = top
        self.pants = pants
    }
}

let safari: Person = Person(top: "긴팔", pants: "반바지")
safari.checkHairStyle()
safari.checkCoordination()
//오늘의 헤어스타일은 포마드스타일
//상의: 긴팔
//하의: 반바지



// MARK: - associatedType, typealias

protocol Container {
    associatedtype Item // 연관 타입
    var count: Int { get }
    mutating func append(_ item: Item)
    func item(at index: Int) -> Item
}

struct IntContainer: Container {
    typealias Item = Int // 연관 타입을 Int로 typealias하여 구현
    var items = [Item]()
    
    var count: Int {
        return items.count
    }
    
    mutating func append(_ item: Item) {
        items.append(item)
    }
    
    func item(at index: Int) -> Item {
        return items[index]
    }
}

var intBox = IntContainer()
intBox.append(5)
intBox.append(10)
print(intBox.item(at: 0)) // 출력: 5

/*
위의 예시에서 Container 프로토콜은 Item이라는 연관 타입을 가지고 있습니다.
이 연관 타입은 Container 프로토콜을 채택하는 구체적인 타입에서 실제 타입으로 정의됩니다.
IntContainer 구조체에서 Item을 Int로 typealias하여 실제 타입을 정의하고,
이를 사용하여 배열에 Int 값을 저장하고 반환하는 메서드를 구현합니다.
*/
