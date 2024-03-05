// MARK: - 배열
// 배열 생성하기
// 1. 타입 추론으로 생성하기
var array1 = [1, 2, 3]
//var array2 = [] // error! 타입 추론으론 빈 배열 생성 불가
 
 
// 2. 타입 Annotation으로 생성하기
var array3: [Int] = [1, 2, 3]
var array4: [Int] = [] //빈 배열 생성
 
 
// 3. 생성자로 생성하기
var array5 = Array<Int>()
var array6 = [Int]()
var array7 = [Int](repeating: 0, count: 10)   //생성과 동시에 10개 Element 생성 및 0으로 초기화

// 배열 갯수 확인하기
var array8 = [1, 2, 3]

let count: Int = array8.count      // 배열 갯수 확인 : 3
let isEmpty: Bool = array8.isEmpty // 배열 비었는지 확인 : false

// 배열 요소에 접근하기
var array9 = [1, 2, 3]

// 1. Subscript로 접근하기
array9[0]        // 1
array9[1]        // 2
 
// 2. 범위로 접근하기
array9[0...1]    // [1, 2]
 
// 3. 속성으로 접근하기
array9.first     // Optional(1)
array9.last      // Optional(3)

// 배열에 요소 추가하기
// 1. append : 끝에 추가
var array10 = [1, 2, 3]
array10.append(4)                            // [1, 2, 3, 4]
array10.append(contentsOf: [5, 6, 7])        // [1, 2, 3, 4, 5, 6, 7]

// 2. inset : 중간에 추가
var array20 = [1, 2, 3]
array20.insert(0, at: 0)                      // [0, 1, 2, 3]
array20.insert(contentsOf: [10, 100], at: 2)  // [0, 1, 10, 100, 2, 3 ]

// 배열에 요소 변경하기
// 1. Subscript로 변경하기
var array11 = [1, 2, 3]
array11[0] = 10                       // [10, 2, 3]
array11[0...2] = [10, 20, 30]         // [10, 20, 30]
array11[0...2] = [0]                  // [0]
array11[0..<1] = []                   // []
 
// 2. replaceSubrange로 바꾸기 (범위 변경 시)
var array21 = [1, 2, 3]
array21.replaceSubrange(0...2, with: [10, 20, 30])     // [10, 20, 30]
array21.replaceSubrange(0...2, with: [0])              // [0]
array21.replaceSubrange(0..<1, with: [])               // []

// 배열에 요소 삭제
// 1. 일반적인 삭제하기
var array12 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
 
array12.remove(at: 2)             // [1, 2, 4, 5, 6, 7, 8, 9]
array12.removeFirst()             // [2, 4, 5, 6, 7, 8, 9]
array12.removeFirst(2)            // [5, 6, 7, 8, 9]
array12.removeLast()              // [5, 6, 7, 8]
array12.popLast()                 // [5, 6, 7]
array12.removeLast(2)             // [5]
array12.removeAll()               // []
 
// 2. 특정 범위 삭제하기
var array22 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
 
array22.removeSubrange(1...3)     // [1, 5, 6, 7, 8, 9]
array22[0..<2] = []               // [6, 7, 8, 9]

// 배열 비교하기
var array14 = [1, 2, 3]
var array24 = [1, 2, 3]
var array34 = [1, 2, 3, 4, 5,]
 
array14 == array24                    //true
array14.elementsEqual(array3)        //false

// 배열 정렬하기
var array15 = [1, 5, 3, 8, 6, 10, 14]
 
// 1. sort : 배열을 직접 "오름차순"으로 정렬
array15.sort()                                         // [1, 3, 5, 6, 8, 10, 14]
 
// 1-1. sort + 클로저 : 배열을 직접 "내림차순"으로 정렬
array15.sort(by: >)                                    // [14, 10, 8, 6, 5, 3, 1]
 
 
// 2. sorted : 원본은 그대로 두고, "오름차순"으로 정렬된 새로운 배열을 만들어 리턴
let sortedArray = array1.sorted()                     // [1, 3, 5, 6, 8, 10, 14]
 
// 2-1. sorted + 클로저 : 원본은 그대로 두고, "내림차순"으로 정렬된 새로운 배열을 만들어 리턴
let sortedArray2 = array1.sorted(by: >)               // [14, 10, 8, 6, 5, 3, 1]

// MARK: - 세트

var letters = Set<String>()
// 값 넣기
letters.insert("Classical Music")

// 초기화
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

favoriteGenres.isEmpty // false
favoriteGenres.count // 3
favoriteGenres.contains("Rock") // true
favoriteGenres.randomElement() // Hip hop (다른 element가 나올 수 있음)

// 업데이트(update) - 삽입, 교체, 추가
// 배열에서 사용하는 append가 없음
var set1: Set<Int> = [1,1,2,2,3,3]
set1.update(with: 1) // 1 -> 기존에 있던 요소이므로 값을 옵셔널 타입으로 리턴
set1.update(with: 7) // nil -> 기존에 없던 요소이므로 Set에 요소가 추가되고 nil 리턴

set1.remove(1) // 1 -> 삭제된 요소를 리턴
set1 // [2,3,7]

set1.remove(5) // nil -> 존재하지 않는 요소를 삭제했을 때 에러는 발생하지 않고 nil 리턴

// 전체요소 삭제
set1.removeAll()
set1.removeAll(keepingCapacity: true) // 요소는 제거하지만 메모리는 제거하지 않는다

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// 합집합
oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// 교집합
oddDigits.intersection(evenDigits).sorted()
// []

// 차집합
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]

// 대칭 차집합
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]




// MARK: - 딕셔너리

var namesOfIntegers: [Int: String] = [:]

namesOfIntegers[16] = "sixteen" // 16은 subscript가 아니라 "키"임

// 초기화
namesOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

airports.keys // ["YYZ", "DUB"]
airports.values // ["Toronto Pearson", "Dublin"]

airports.keys.sorted() // ["DUB", "YYZ"]
airports.values.sorted() // ["Dublin", "Toronto Pearson"]

airports["APL"] = "Apple International"
// airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin", "APL": "Apple International"]

// key에 매칭된 value 값 초기화
airports["APL"] = nil

// 딕셔너리 airports에 있는 값의 수
print(airports.count)
// 출력값: 2

// 딕셔너리 airports에 있는 모든 key들
print(airports.keys)
// ["YYZ", "DUB"]

// 해당 key가 있다면 value를 덮어쓰고, 덮어쓰기 전 기존값울 반환
let newYyz = airports.updateValue("Hello YYZ", forKey: "YYZ")
           
print(newYyz) // 출력값: Optional("Toronto Pearson")
print(airports["YYZ"]) // 출력값: Optional("Hello YYZ")

// 해당 key가 없다면 그 key에 해당하는 value에 값을 추가하고 nil을 반환
let newApl = airports.updateValue("Hello APL", forKey: "APL")

print(newApl) // 출력값: nil
print(airports["APL"]) // 출력값: Optional("Hello APL")


