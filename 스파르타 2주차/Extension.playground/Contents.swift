// MARK: - Extension
/*
 extension 확장할 타입 이름 {
      //타입에 추가될 새로운 기능 구현
 }

 extension 확장할 타입 이름: 프로토콜1, 프로토콜2, 프로토콜3 {
     //프로토콜 요구사항 구현
 }
 */
// MARK: - Extension 가능한 케이스
// 1. 새로운 계산된 속성(Computed Property) 추가
// String 타입에 확장하여 문자열의 길이를 반환하는 속성 추가
extension String {
    var length: Int {
        return self.count
    }
}

let str = "Hello"
print(str.length) // 출력: 5

// 2. 새로운 인스턴스/타입 메서드 추가
// Int 타입에 확장하여 제곱 값을 반환하는 메서드 추가
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 3
print(number.squared()) // 출력: 9

// 3. 새로운 초기화(Initializer) 추가
// Double 타입에 확장하여 특정 숫자로 초기화하는 초기화 메서드 추가
extension Double {
    init(fromString str: String) {
        self = Double(str) ?? 0.0
    }
}

let value = Double(fromString: "3.14")
print(value) // 출력: 3.14


// 4. 프로토콜 채택(Protocol Conformance)
protocol Printable {
    func printDescription()
}

struct MyStruct {}

// Extension을 사용하여 기존 타입에 프로토콜 채택
extension MyStruct: Printable {
    func printDescription() {
        print("Printing description of MyStruct")
    }
}

let myInstance = MyStruct()
myInstance.printDescription() // 출력: Printing description of MyStruct


// 5. 서브스크립트 추가(Subscripting)
struct Matrix {
    private var data: [[Int]]
    
    init(rows: Int, columns: Int) {
        data = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    }
    
    // Extension을 사용하여 서브스크립트 추가
    subscript(row: Int, column: Int) -> Int {
        get {
            return data[row][column]
        }
        set {
            data[row][column] = newValue
        }
    }
}

var matrix = Matrix(rows: 3, columns: 3)
matrix[0, 0] = 1
matrix[1, 1] = 2

print(matrix[0, 0]) // 출력: 1
print(matrix[1, 1]) // 출력: 2

// 6. 중첩 타입(Nested Type) 추가
struct Container {
    // 기존 타입 내에서 중첩된 타입
    struct NestedType {
        var value: Int
    }
}

// Extension을 사용하여 중첩 타입 추가
extension Container {
    struct AnotherNestedType {
        var name: String
    }
}

let nested = Container.NestedType(value: 5)
print(nested.value) // 출력: 5

let anotherNested = Container.AnotherNestedType(name: "NestedType")
print(anotherNested.name) // 출력: NestedType


// MARK: - Extension 불가능한 케이스
//// 1. 저장 프로퍼티(Stored Property) 추가
//// Extension으로 저장 프로퍼티 추가 시 컴파일 에러 발생
//extension Int {
//    var newProperty: Int = 5 // 컴파일 에러 발생
//}
//
//
//// 2. 기존 기능의 재정의(Override)
//// Extension으로 기존 메서드 재정의 시 컴파일 에러 발생
//extension Int {
//    func description() -> String { // 컴파일 에러 발생
//        return "This is an extension method"
//    }
//}
//
//
//// 3. 초기화 메서드(Initializer)의 재정의
//// Extension으로 기존 타입의 초기화 메서드 재정의 시 컴파일 에러 발생
//extension String {
//    init() { // 컴파일 에러 발생
//        self = "Default Value"
//    }
//}
//
//
//// 4. 기존 타입의 저장된 프로퍼티에 기본값 설정
//// Extension으로 기존 타입의 저장된 프로퍼티에 기본값 설정 시 컴파일 에러 발생
//extension Double {
//    var defaultValue: Double = 10.0 // 컴파일 에러 발생
//}
