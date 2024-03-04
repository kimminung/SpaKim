// 추상화 - 이렇게 타입을 정의하는 것
class Account {}
struct Account1 {}
protocol Account2 {}

// 캡슐화
class Person {
  private var location = "서울"

  private func doSomething1() {
    print("잠시 휴게소에 들려서 딴짓")
  }
  private func doSomething2() {
    print("한숨 자다 가기")
  }

  func currentLocation() {
    print("====")
    print("현재 위치 :", location)
    print("====")
  }

  func goToBusan() {
    print("서울을 출발합니다.")
    doSomething1()
    doSomething2()
    print("부산에 도착했습니다.")
    location = "부산"
  }
}

// 상속
class Animal {
    var species = "동물"
}

class Dog: Animal {
    var name = "초코"
}

let dog = Dog()
dog.species // 동물
dog.name // 초코


// 다형성

//1) 오버라이딩

class Dog1 {
  func bark() { print("멍멍") }
}
class Poodle: Dog1 {
  override func bark() { print("왈왈") }
}
class Husky: Dog1 {
  override func bark() { print("으르르") }
}
class Bulldog: Dog1 {
  override func bark() {
    super.bark()
    print("bowwow")
  }
}

var dog1: Dog1 = Dog1()
dog1.bark() // 멍멍

dog1 = Poodle()
dog1.bark() // 왈왈

dog1 = Husky()
dog1.bark() // 으르르

dog1 = Bulldog()
dog1.bark() // 멍멍, bowwow


// 2) 오버로딩
// 함수를 식별할 땐 단순히 함수 이름을 보고 하는 게 아니라
// 함수 이름, 파라미터(타입, 갯수, Argument Label), 리턴타입을 모두 종합해서 함수를 식별
func printParameter() {
  print("No param")
}

func printParameter(param: Int) {
  print("Input :", param)
}


func printParameter(_ param: Int) -> Int {
  print("Input :", param)
    return param
}

func printParameter(_ param: Int) -> Double {
  print("Input :", param)
    return Double(param)
}

printParameter()
printParameter(param: 1)
let int: Int = printParameter(2)
let double: Double = printParameter(2)
