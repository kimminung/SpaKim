// MARK: - 옵셔널과 nil
// 축약 타입 표현
var serverResponseCode: Int? = 404
// 정식 타입 표현
var myPetName: Optional<String> = "멍멍이"

func pay(with card: String?) {
   // 구현 코드
}

// 옵셔널 타입끼리의 연산은 불가능
var num1: Int? = 4
var num2: Int? = 2

//num1 + num2 // 에러 발생!

let optionalString1: String? = "Hello, "
let optionalString2: String? = "world!"

// 옵셔널 String 값들을 연결하려는 시도
//let result = optionalString1 + optionalString2 // 에러 발생!


var serverResponseCode1: Int? = 404
serverResponseCode1 = nil

var surveyAnswer: String?
// surveyAnswer 는 자동으로 nil 로 설정됩니다.



// MARK: - 옵셔널 바인딩
/*
if let <#상수 이름#> = <#옵셔널 값#> {
   // 구현 코드
}
*/

let roommateNumbers: Int? = nil
if let roommates = roommateNumbers {
    print (roommates)
}
// 출력값 없음

let ticketCounts: Int? = 3
if let ticket = ticketCounts {
    print (ticket)
}
// 출력값: 3


// 옵셔널 바인딩 할 변수가 여러 개인 경우
let boyName : String?
let girlName : String?

boyName = "하늘"
girlName = "나연"

// , 콤마로 나열합니다
if let boy = boyName,
   let girl = girlName {
    print(boy, girl)
}
// 출력값: 하늘 나연

let x : Int? = 10
let y : Int? = nil

func opbinding() {
    guard let x = x else { return }
    print(x)

    guard let y = y else { return } // y는 nil 이므로 여기서 return
    print(y) // 위에서 return 하였기 때문에 이 코드 라인은 실행되지 않음
}

opbinding()
// 출력값: 10




// MARK: - 옵셔널 강제 언래핑
let number = Int("42")!
// String값을 Int로 변환하는 함수는 return값으로 옵셔널 값을 반환합니다.
print(number)
// 출력값: 42

// 강제 언래핑이 실패한 경우
let address: String? = nil
//print(address!)
// 에러🚨 메시지: Unexpectedly found nil while unwrapping an Optional value




// MARK: - 옵셔널 기본값 설정(nil-coalescing)

var optNumber: Int? = 3
let number1 = optNumber ?? 5
print(number1) // 출력값 : 3
//number는 Int? 타입이 아니라 Int 타입

optNumber = nil
let number2 = optNumber ?? 5
print(number) // 출력값 : 5
//number는 Int? 타입이 아니라 Int 타입






// MARK: - 옵셔널 체이닝
struct Person {
    var name: String
    var address: Address
}

struct Address {
    var city: String
    var street: String
    var detail: String
}

let sam: Person? = Person(name: "Sam", address: Address(city: "서울", street: "신논현로", detail: "100"))
//print(sam.address.city) // 에러 🚨. 에러 메시지: Chain the optional using '?' to access member 'address' only for non-'nil' base values
sam?.address.city  // ✅
// 출력값: 서울
