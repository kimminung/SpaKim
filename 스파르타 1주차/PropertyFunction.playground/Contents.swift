// MARK: - 할당 연산자

let color = "purple"
print(color) // 출력값: purple

var foodName = "사과"
var fruitName = "포도"
foodName = fruitName
print(foodName) // 출력값 : 포도

// 변수 여러개를 한번에 선언하고 값을 할당하는 방법
var a = 1, b = 2, c = 3



// MARK: - 저장 프로퍼티

let name = "철수"
//name = "영희" // 🚨Error: Change 'let' to 'var' to make it mutable


var age = 10
age = 50




// MARK: - 연산 프로퍼티


var x = 10
var y = 20

// 👇🏻 sum이 연산 프로퍼티
var sum: Int {
    get {
        return x + y
    }
    set {
        sum = x + y
    }
}

print(sum)
// 출력값: 30

// get, set 중 get만 필요한 경우에는 키워드 생략 가능
var sum1: Int {
        return x + y
}

// 아래와 같이 더 축약 가능
var sum2: Int {
        x + y
}




// MARK: - print

print("Hello World 🌍") // 출력값: Hello World 🌍





// MARK: - 한 줄 텍스트, 멀티라인 텍스트

var greeting = "Hello World 🌍"

var greeting1 =              """
                            Hello
                            World
                            🌍
                            """





// MARK: - 문자열 보간법

let name1 = "정종"
var greeting2 = "Hello \(name1) 🌍" // 출력값: Hello 정종 🌍

let height = 185
let myInfo = "My height is \(height)"  // 출력값: My height is 185



// MARK: - 주석
// 한 줄 주석
/*
여러줄
주석
입니다
*/




// MARK: - 함수

/*
func 함수_이름(아규먼트_레이블: 파라미터_타입) -> 리턴_타입 {
  // ... 코드
}
// 네이밍 컨벤션으로 카멜케이스를 사용합니다 (ex- methodName 🙆🏻‍♀️ / method_name 🙅🏻‍♀️)
*/

func sayHi(friend: String) {
  print("Hi~ \(friend)!")
}
sayHi(friend: "영호")


func sayHi(to friend: String) {
  print("Hi~ \(friend)!")
}
sayHi(to: "영호")


func sayHi(_ friend: String) -> String {
  return ("Hi~ \(friend)!")
}
print(sayHi("영호"))
// 출력값: Hi~ 영호!


// 정상 몸무게 = (키 - 100) * (9/10) 이라고 할 때
// 특정 키에 알맞은 몸무게를 구하는 함수
func getWeight(height: Int) -> Double {
    let weight = (height - 100) * 9 / 10
    return Double(weight)
}

// 특정 몸무게에 알맞은 키를 구하는 함수
func getHeight(weight: Int) -> Double {
    let height = weight * 10 / 9 + 100
    return Double(height)
}

