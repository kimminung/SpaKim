// MARK: - 산술 연산자
var result = 1 + 2
print(result)
// 출력값: 3

result += 5
// result = result + 5
print(result)
// 출력값: 8

result = 10 - 6
print(result)
// 출력값: 4

result -= 3
// result = result - 3
print(result)
// 출력값: 1

result = 8 * 2
print(result)
// 출력값: 16

result = 12 / 5
print(result)
// 출력값: 2
result = 10 % 3
print(result)
// 출력값: 1
// result는 10을 3으로 나눈 후 나머지 이므로 1



// MARK: - 비교 연산자
var result1 = (1 == 2)
print(result1)
// 출력값: false

result1 = (1 != 2)
print(result1)
// 출력값: true

result1 = (1 > 2)
print(result1)
// 출력값: false

result1 = (1 < 2)
print(result1)
// 출력값: true

result1 = (1 >= 2)
print(result1)
// 출력값: false

result1 = (2 <= 2)
print(result1)
// 출력값: true



// MARK: - 논리 연산자
var allowedEntry = false
allowedEntry = !allowedEntry
print(allowedEntry)
// 출력값: true

let enteredDoorCode = true
let passedRetinaScan = false
let permittedAccess = enteredDoorCode && passedRetinaScan
print(permittedAccess)
// 출력값: false

let enter = allowedEntry || permittedAccess
print(enter)
// 출력값: true


// MARK: - 범위 연산자
(1...5)
// 1, 2, 3, 4, 5

(1..<5)
// 1, 2, 3, 4

(3...)
// 3, 4, 5, 6, 7 ...

let names = ["안나", "알렉스", "오드리", "잭"]

for name in names[2...] {
    print(name)
}
// 출력값:
// 오드리
// 잭

for name in names[...2] {
    print(name)
}
// 출력값:
// 안나
// 알렉스
// 오드리

for name in names[..<2] {
    print(name)
}
// 출력값:
// 안나
// 알렉스



// MARK: - 삼항 연산자
let height = 150
var nickname = (height > 185) ? "Daddy Long Legs" : "TomTom"
print(nickname)
// 출력값: TomTom

// 이를 if-else 문으로 표현하면
var nickname2 = ""
if height > 185 {
    nickname = "Daddy Long Legs"
} else {
    nickname = "TomTom"
}




// MARK: - 조건문
/*
// if 뒤 "조건"은 Bool 타입 즉 true 혹은 false 이어야 합니다
if <#조건#> {
  // 구현부 코드
}
*/

var temperature = 17
if temperature <= 13 {
    print("쌀쌀한 날씨가 지속되겠습니다.")
} else if temperature >= 22 {
    print("해가 떠오르는 낮부터는 더위 예상됩니다.")
} else {
    print("밤낮으로 선선한 날씨가 예상됩니다.")
}
// 출력값: 밤낮으로 선선한 날씨가 예상됩니다.

if true {
        print("항상 실행됩니다")
}
// 출력값: 항상 실행됩니다

if false {
        print("항상 실행됩니다")
}
// 출력값: (없음) - if 뒤 조건문이 false이므로 중괄호 내부 코드가 실행되지 않음

/*
if <#조건#> {
  // 구현부 코드
}
switch <#조건#> {
case <#값 1#>:
    // 구현부 코드
case <#값 2#>,
    <#값 3#>:
    // 구현부 코드
default:
    // 모든 케이스가 적용되지 않는 경우
    // 구현부 코드
}
*/


let cookieCount = 62
let message: String
switch cookieCount {
case 0:
    message = "🍪 없음 🙅‍♂️"
case 1..<5:
    message = "🍪 아주 조금 있음"
case 5..<12:
    message = "🍪 조금 있음"
case 12..<100:
    message = "🍪 꽤 있음 🍪"
case 100..<1000:
    message = "🍪🍪 많음 🍪🍪"
default:
    message = "🍪🍪🍪엄청 많음🍪🍪🍪"
}
print(message)
// 출력값: "🍪 꽤 있음 🍪"



let species = "시츄"

switch species {
case "말티즈" :
    print("말티즈입니다")
case "시츄":
    break // 실행 구문이 없을때는 반드시 break를 써주어야 함
default:
    print("강아지입니다")
}



var number = 5

switch number {
case ..<5:
    print("under 5")
    fallthrough
case 5:
    print("5")
    fallthrough // 해당 케이스의 구문이 실행된 이후에도 무조건 다음블럭을 실행함
default:
    print("default")
}
// 출력 결과
// 5
// default

// default를 사용하지 않는 예시
enum Day {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

func activities(for day: Day) {
    switch day {
    case .monday:
        print("월요일: 회사 회의")
    case .tuesday:
        print("화요일: 운동 가기")
    case .wednesday:
        print("수요일: 책 읽기")
    case .thursday:
        print("목요일: 친구와 만나기")
    case .friday:
        print("금요일: 영화 보기")
    case .saturday:
        print("토요일: 쇼핑하기")
    case .sunday:
        print("일요일: 가족과 시간 보내기")
    }
}

activities(for: .monday)
activities(for: .friday)



// MARK: - 반복문
/*
for 각 value의 변수 이름 in 순회할 수 있는 타입 {
     // 내부 로직
}
*/

let alphabets: [String] = ["a", "b", "c", "d"]

for character in alphabets {
  print(character)
}

// 출력값:
// a
// b
// c
// d

let students = ["Tom": 2, "Harry": 4, "Sarah": 1]

for (name, grade) in students {
  print("\(name) 은 \(grade) 학년이야")
}

// 출력값:
// Tom 은 2 학년이야
// Harry 은 4 학년이야
// Sarah 은 1 학년이야

/*
// while 뒤의 "조건"은 Bool 타입, 즉 true 혹은 false이고, true일때 중괄호 내부 코드 실행
while <#조건#> {
   // 구현 코드
}
*/

let lastName : [String] = ["송", "김", "박", "정" ]

var index : Int = 0
while index < 4 {
    print("옆집 \(lastName[index]) 씨네 \(index)번째 결혼식")
    index += 1
}
// 출력값:
// 옆집 송 씨네 0번째 결혼식
// 옆집 김 씨네 1번째 결혼식
// 옆집 박 씨네 2번째 결혼식
// 옆집 정 씨네 3번째 결혼식

//while true {
//        print("Hello") // Hello 가 계속 출력됨
//}


