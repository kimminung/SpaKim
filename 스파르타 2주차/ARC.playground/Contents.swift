

// MARK: ARC
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed") // RC: 1️⃣
// Prints "John Appleseed is being initialized"

reference2 = reference1 // RC: 2️⃣
reference3 = reference1 // RC: 3️⃣

reference1 = nil // RC: 2️⃣
reference2 = nil // RC: 1️⃣

reference3 = nil // RC: 0️⃣
// Prints "John Appleseed is being deinitialized"

// MARK: 아래 세 예시는 하나씩 주석을 풀어서 실행해보세요!
// MARK: 강한 참조 순환 문제와 해결 방법
//
//class Man {
//    var name: String
//    var girlfriend: Woman?
//
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("Man Deinit!") }
//}
//
//class Woman {
//    var name: String
//    var boyfriend: Man?
//
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("Woman Deinit!") }
//}
//
//var chelosu: Man? = .init(name: "철수")
//var yeonghee: Woman? = .init(name: "영희")
//
//
//chelosu?.girlfriend = yeonghee
//yeonghee?.boyfriend = chelosu
//
//chelosu = nil
//yeonghee = nil
//
//
// MARK: 약한 참조(Weak Reference)를 사용한 해결 방법
//
//class Man {
//    var name: String
//    weak var girlfriend: Woman?
//
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("Man Deinit!") }
//}
//
//class Woman {
//    var name: String
//    var boyfriend: Man?
//
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("Woman Deinit!") }
//}
//
//
//var chelosu: Man? = .init(name: "철수")
//var yeonghee: Woman? = .init(name: "영희")
//
//chelosu?.girlfriend = yeonghee
//yeonghee?.boyfriend = chelosu
//
//
//chelosu = nil
//yeonghee = nil
//chelosu?.girlfriend

// MARK: 비소유 참조(Unowned Reference)를 사용하여 강한 참조 순환 문제를 해결
//class Man {
//    var name: String
//    unowned var girlfriend: Woman?
//
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("Man Deinit!") }
//}
//
//class Woman {
//    var name: String
//    var boyfriend: Man?
//
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("Woman Deinit!") }
//}
//
//var chelosu: Man? = .init(name: "철수")
//var yeonghee: Woman? = .init(name: "영희")
//
//chelosu?.girlfriend = yeonghee
//yeonghee?.boyfriend = chelosu
//
//
//yeonghee = nil
//chelosu?.girlfriend // 에러 발생
