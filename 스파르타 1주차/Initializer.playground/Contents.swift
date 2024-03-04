// MARK: - 인스턴스

// Person 클래스 정의
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func greet() {
        print("Hello, my name is \(name) and I'm \(age) years old.")
    }
}

// Person 클래스의 인스턴스 생성
let john = Person(name: "John", age: 30)
let emily = Person(name: "Emily", age: 25)

// 생성된 인스턴스 사용
john.greet() // 출력: Hello, my name is John and I'm 30 years old.
emily.greet() // 출력: Hello, my name is Emily and I'm 25 years old.



// MARK: - 기본 초기화

class Person1 {
    var name: String = ""
    var age: Int = 0
}

let person1 = Person1() // 기본 초기화




// MARK: - 지정 초기화

class Person2 {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person2 = Person2(name: "John", age: 30) // 지정 초기화





// MARK: - 편의 초기화

class Person3 {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}

let person3 = Person3(name: "Alice") // 편의 초기화 사용




// MARK: - 강제 해제되지 않는 옵셔널 초기화

class Person4 {
    var name: String?
    var age: Int = 0
}

let person4 = Person4()
person4.name = "Emily"
person4.age = 25




// MARK: - 실패 가능 생성자

// class의 실패 가능 생성자

class UserProfile {
    let username: String

    // 실패 가능 생성자: 유효하지 않은 이름을 사용할 경우 초기화 실패
    init?(username: String) {
        // 유효한 사용자 이름인지 확인
        guard username.count >= 5 else {
            return nil // 입력된 사용자 이름이 유효하지 않을 경우 초기화 실패
        }

        self.username = username
    }
}

// 실패 가능 생성자를 사용하여 인스턴스 생성
if let validProfile = UserProfile(username: "user123") {
    print("Valid username: \(validProfile.username)")
} else {
    print("Invalid username. Username should be at least 5 characters long.")
}

if let invalidProfile = UserProfile(username: "user") {
    print("Valid username: \(invalidProfile.username)")
} else {
    print("Invalid username. Username should be at least 5 characters long.")
}


// struct의 실패 가능 생성자

struct Animal {
    let name: String
    
    init?(name: String) {
        if name.isEmpty {
            return nil    // 생성자 내에서 실패 가능 부분에 nil을 리턴하면 됨
        }
        self.name = name
    }
}

let animal1 = Animal(name: "choco") //인스턴스 생성. 타입은 Animal? 이다

let animal2 = Animal(name: "") // 문자열이기에 유효한 타입이지만 nil이 리턴된다


// enum의 실패 가능 생성자

enum HeightUnit {
    case feet
    case centiMeter
    
    init?(symbol: String) {
        switch symbol {
        case "f":
            self = HeightUnit.feet
        case "cm":
            self = HeightUnit.centiMeter
        default:
            return nil
        }
    }
}


let feet: HeightUnit = HeightUnit.feet // HeightUnit 타입

let centi: HeightUnit? = HeightUnit(symbol: "cm")

let feet2: HeightUnit? = HeightUnit(symbol: "F") // nil
