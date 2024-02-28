import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    guard n <= 100000000 else {return -1}
    
    for r in String(n) {
        answer += Int(String(r))!
    }
    

    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    print("\(n)")
    
    return answer
}


solution(987)

func solutionX(_ n:Int) -> Int
{
    var num : [Character] = []
//     num.append(Character("\(n)"))
    for i in String(n) {
        num.append(i)
    }
    var sum = num.reduce(0){$0+Int(String($1))!}
    return sum
}
solutionX(123)
func solutionOOO(_ n:Int) -> Int {
    var answer:Int = 0
    var arr: [Character] = []
    for i in String(n){
        arr.append(i)
    }

    for i in arr{
        answer += Int(String(i))!
    }

    return answer
}

//하고싶은게 이거였음
/*
func solutionO(_ n:Int) -> Int
{
    var answer:Int = 0
        let strNum: String = String(n)
    var calNums = [Character]()

    for chars in strNum.characters{
        calNums.append(chars)
    }

    for a in calNums{
        if let number = Int(String(a)) {
                answer += number
        }
    }

    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    print("Hello Swift")

    return answer
}*/
//얘는 잘 됨
func solutionOO(_ n:Int) -> Int
{
    var answer:Int = 0

    var CharacterArray : [Character] = Array(String(n))
    var IntArray : [Int] = CharacterArray.map{Int(String($0))!}

    return  IntArray.reduce(0, +)
}

func solutionBest(_ n:Int) -> Int
{
    return String(n).reduce(0, {$0+Int(String($1))!});
}


func solution6(_ n:Int) -> Int
{
    let string:String = String(n)
    return string.reduce(0) { $0 + Int(String($1))!}
}

func solutionMap(_ n:Int) -> Int
{
    let str = String(n)
    let answer = str.map{$0}.map{String($0)}.map{Int($0)!}.reduce(0, +)

    return answer
}


func solution2(_ n:Int) -> Int
{
    var answer:Int = 0
    var val = n

    while val > 0 {
        answer += val % 10
        val /= 10
    }

    return answer
}
solution2(1234567)

func solution3(_ n:Int) -> Int
{
    var answer:Int = 0

    let arr = String(n).compactMap { Int(String($0)) }
    answer = arr.reduce(0, +)
    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    print(answer)

    return answer
}


func solution4(_ n:Int) -> Int
{
    let arr = String(n).compactMap { Int(String($0)) }
    return arr.reduce(0, +)
}

func solution5(_ n:Int) -> Int
{
    var answer:Int = 0
    let str = String(n)
    for i in 0..<str.count {
        answer += Int(String(str[str.index(str.startIndex, offsetBy:i)]))!
    }
    return answer
}


func solution7(_ n:Int) -> Int
{
    var str: String = String(n)
    var arrchar: [Character] = []
    var arrint: [Int] = []
    var answer = 0
    for i in 0..<str.count {
        arrchar.append(str[str.index(str.startIndex, offsetBy: i)])
    }
    for j in 0..<arrchar.count {
        arrint.append(arrchar[j].wholeNumberValue!)
    }
    answer = arrint.reduce(0){$0 + $1}

    return answer
}


func solution8(_ n:Int) -> Int
{
    return n.description.trimmingCharacters(in: .whitespaces).map{Int(String($0))!}.reduce(0, +)
}


func solution9(_ n:Int) -> Int
{
    var answer:Int = 0

    let str = String(n).map{String($0)}

    return str.reduce(0){Int($0) + Int($1)!}
}
