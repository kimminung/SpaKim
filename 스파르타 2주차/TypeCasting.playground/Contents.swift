// is
let char: Character = "A"
 
print(char is Character)
// 출력값: true
print(char is String)
// 출력값: false
 
let bool: Bool = true

print(bool is Bool)
// 출력값: true
print(bool is Character)
// 출력값: false

// 타입이란?
// Person은 슈퍼 클래스(부모 클래스)
//class Person {
//
//}
//
//// Student는 서브 클래스(자식 클래스) - 상속받은 클래스
//class Student: Person {
//
//}
//
//// Teacher는 서브 클래스(자식 클래스) - 상속받은 클래스
//class Teacher: Person {
//
//}

class Human {
    let name: String
    //let name: String = "KimMin"
    init(name: String) {
        self.name = name
    }
}

class Teacher: Human {
    //as 설명용
    //let subject: String = "English"
}
class Student: Human {
    //let grade: Int = 1
}

let people: [Human] = [
    Teacher.init(name: "kim선생"),
    Student.init(name: "park학생"),
    Student.init(name: "yu학생")
]

for human in people {
    if human is Teacher {
        print("나는 선생님: \(human.name) 입니다.")
    } else if human is Student {
        print("나는 학생: \(human.name) 입니다.")
    } else if human is Human {
        print("나는 사람: \(human.name) 입니다.")
    }
}
let human = Teacher.init(name: "aa") as Human

//// as, as!, as?
class Person {
    var id = 0
    var name = "name"
    var email = "hgk@gmail.com"
}

class Worker: Person {
    // id
    // name
    // email
    var salary = 300
}

class Programmer: Worker {
    // id
    // name
    // email
    // salary
    var lang = "Swift"
}


// 업캐스팅 - as
let person1 = Person()
let worker1 = Worker()
let programmer1 = Programmer()
let personList = [person1, worker1, programmer1] // 타입을 선언하지 않았지만 Person1 타입으로 인식 -> 즉 업캐스팅이 되었음
personList[1].name
//personList[1].salary // Person 타입으로 보고 있기 때문에 salary에 접근하지 못함

let worker2 = Worker()
worker2.salary

let workerPerson = worker2 as Person
//workerPerson.salary // Person 타입으로 보고 있기 때문에 salary에 접근하지 못함


// 다운캐스팅 - as? / as!
// as?
let pro = programmer1 as? Programmer // 타입 변환이 될 수도 있고 안될 수도 있기 때문에 옵셔널을 리턴

if let person2 = programmer1 as? Programmer {
    person2.lang
}

if let person3 = worker1 as? Programmer {
    person3.lang
}

// as!
//let pro2 = worker2 as! Programmer // Error : 타입 변환 실패시 오류
