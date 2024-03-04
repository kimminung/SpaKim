// 부모 클래스(Person) 선언
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func greet() {
        print("Hello, my name is \(name).")
    }
}

// Person 클래스를 상속받는 자식 클래스(Student) 선언
class Student: Person {
    var studentID: Int

    init(name: String, age: Int, studentID: Int) {
        self.studentID = studentID
        super.init(name: name, age: age)
    }

    func study() {
        print("\(name) is studying.")
    }
}

// Student 클래스 인스턴스 생성 및 사용
let john = Student(name: "John", age: 20, studentID: 123)
john.greet() // 출력: Hello, my name is John.
john.study() // 출력: John is studying.



// override, super 키워드 예시

class Animal {
    func makeSound() {
        print("Some generic sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        super.makeSound() // 부모 클래스의 메서드 호출
        print("Bark!")
    }
}

let dog = Dog()
dog.makeSound()


// final 키워드 예시

final class Vehicle {
    final var wheels: Int = 0
    
    final func makeSound() {
        print("Some generic sound")
    }
}

// Error: 'SubVehicle' cannot inherit from final class 'Vehicle'
//class SubVehicle: Vehicle {
    // Error: 'wheels' cannot override 'final' var from superclass
    // override var wheels: Int = 4
    
    // Error: 'makeSound()' cannot override a final method
    // override func makeSound() {
    //     print("Custom sound")
    // }
//}
