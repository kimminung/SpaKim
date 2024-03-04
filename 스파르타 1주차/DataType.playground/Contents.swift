// MARK: - 숫자

// Int
var age: Int = 18 // Int 타입

// Float
var interestRate: Float = 1.2345678910 // Float 타입
print("이자율은 \(interestRate) % 입니다")
// 출력값: 이자율은 1.2345679 % 입니다

// Double
var interestRate1: Double = 1.2345678910123456789 // Double 타입
print("이자율은 \(interestRate1) % 입니다")
// 출력값: 이자율은 1.2345678910123457 % 입니다




// MARK: - 참 혹은 거짓

// Bool 변수 선언 및 초기화
var isOpen: Bool = true
var isLogged: Bool = false

// 조건문에서 Bool 값 사용
if isOpen {
    print("문이 열려 있습니다.")
} else {
    print("문이 닫혀 있습니다.")
}

// Bool 값을 반환하는 함수
func checkLoginStatus(isLogged: Bool) {
    if isLogged {
        print("로그인되었습니다.")
    } else {
        print("로그인되지 않았습니다.")
    }
}

// 함수 호출
checkLoginStatus(isLogged: isLogged)



// MARK: - 문자

// String
var emptyString: String = ""
var anotherEmptyString = String()

var variableString = "Mom"
variableString += " and Dad"
print(variableString)
// 출력값: "Mom and Dad"

// Character
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"




// MARK: - 다양한 값의 묶음

let http404Error: (Int, String) = (404, "Not Found")

let (justTheStatusCode, _): (Int, String) = http404Error
print("The status code is \(justTheStatusCode)")
// 출력값: "The status code is 404"

// 튜플 값에 접근하려면 순서를 알고 있어야 합니다.
print("The status code is \(http404Error.0)")
// 출력값: "The status code is 404"
print("The status message is \(http404Error.1)")
// 출력값: "The status message is Not Found"

// 각 엘레먼트에 이름을 붙일 수 있습니다.
let http200Status: (Int, String) = (statusCode: 200, description: "OK")

// 많은 데이터를 담는 데는 적합하지 않다 - 사용하는 쪽에서 또 매핑(Mapping)을 해야 함
let myInfo: (String, Int, Int, Int, String, String) =
(name: "peter", registrationNumber: 970212, height: 185, weight: 75, job: "developer", hobby: "soccer")




// MARK: - 모든 타입

var anyArray: [Any] = [1,"Hi", true]

var anyValue: Any = 1000
anyValue = "어떤 타입도 수용 가능"
anyValue = 12345.67

// 컴파일 에러
//let doubleValue: Double = anyValue  // 🚨 에러 메시지: Cannot convert value of type 'Any' to specified type 'Double'
// Any 타입에 Double 값을 넣는 것은 가능하지만
// Any는 Double 과 엄연히 다른 타입이 때문에
// Double 타입의 값에 Any 타입의 값을 할당할 때에는 명시적으로 타입을 변환해 주어야 합니다.
// 타입 변환은 이후 강의에서 배우니 타입 변환이 필요하구나까지 알고 계시면 됩니다!



// MARK: - 타입 추론, 안정성, 형변환
// 타입 추론
var weight = 90
type(of: weight) // Int.Type

var language = "Swift"
type(of: language) // String.Type

// 타입 안정성
var integer = 5
var double = 3.1

//integer = double -> 불가능
//
//integer + double -> 불가능

// 타입 형변환
let integerString = "321"
let number = Int(integerString)

print(number) // 321

let doubleString = "321.2"
let number2 = Int(doubleString)

print(number2) // nil -> 추후 학습 예정. 값이 없음을 표현
