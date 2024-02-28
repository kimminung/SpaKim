import Foundation

func solution(_ n:Int) -> Int {
    guard n >= 1, n <= 100000000 else {return -1}
    
    var n = n
    var tmp = 3
    var remainder = [Int]()
//    let threeTernaryScale = remainder.reversed()
//    var num = [Int]()
    var result = 0
    
    
    while n >= tmp {
        remainder.append(n%tmp)
        n/=tmp
    }
    remainder.append(n%tmp)
    
    
    var count = remainder.count
    
    
    // n ... 27 9 3 1
    // n ... 0  0 2 1
    
    // n ... 81 27 9 3 1
    // n ...  2  2 1 1 1
    for i in 0..<count {
        var num = 1
        if count != 1{
            for _ in 1..<count {
                num *= tmp
            }
        }
//        else{
//            //1의자리 미완
//            result+=1
//        }
            
            //        if remainder[i] != 0 {
            for _ in 0..<remainder[i] {
                //                print(k)
                result+=num
            }
            count-=1
            //        }else{
            //            count-=1
            //            continue
            //        }
        
    }
    return result
}

// n ... 27 9 3 1
// n ... 0  0 2 1
//solution(45)

// n ... 81 27 9 3 1
// n ...  2  2 1 1 1
//solution(125)
solution(3)

//동익님이 주신

func solution00(_ n:Int) -> Int {
  guard n >= 1, n <= 100000000 else {return -1}
  var n = n
  var tmp = 3
  var remainder = [Int]()
//  let threeTernaryScale = remainder.reversed()
  var num = [Int]()
  var result = 0
  while n > tmp {
    remainder.append(n%tmp)
    n/=tmp
  }
  remainder.append(n%tmp)
  remainder=remainder.reversed()
  result = remainder.enumerated().map{$0}.map{Int(pow(Double(tmp),Double($0.0))) * $0.1}.reduce(0,+)
  return result
}

solution00(3)


func solution1(_ n:Int) -> Int {
        let flipToThree = String(n,radix: 3)
        let answer = Int(String(flipToThree.reversed()),radix:3)!
        return answer

}

func solution2(_ n:Int) -> Int {
    var n = n
    var arr: [Int] = []

    while n > 0 {
        arr.append(n%3)
        n = n / 3
    }

    var ret = 0
    for i in 1...arr.count {
        ret += arr[i-1] * Int(pow(3.0, Double(arr.count-i)))
    }

    return ret
}

func solution3(_ n:Int) -> Int {
    var N = n
    var list = [Int]()
    while N > 0 {
        list.append(N % 3)
        N /= 3
    }

    var tdx = 1
    var Ans = 0
    (list.reversed()).forEach {
        Ans += tdx * $0
        tdx *= 3
    }

    return Ans
}

func solution4(_ n:Int) -> Int {
    var num = n
    var array = [Int]()
    while num >= 3 {
        let divideNum = num % 3
        array.append(divideNum)

        num /= 3
    }

    if num != 0 {
        array.append(num)
    }

    var count = 1
    var answer = 0

    while !array.isEmpty {
        let element = array.removeLast()
        var mul = 1

        for _ in 0..<count - 1 {
            if count == 1 {
                break
            }

            mul *= 3
        }

        answer += element * mul
        count += 1
    }

    return answer
}

func solution5(_ n:Int) -> Int {
    var n = n
    var answer = 0
    var new_list = [Int]()
    while n>0 {
        new_list.append(n%3)
        n /= 3
    }
    let b = new_list.count
    for i in 0...b-1{
        answer += new_list[i]*Int(pow(3.0,Double(b-1-i)))
    }


    return answer
}

func solution6(_ n:Int) -> Int {
    var arr: [Int] = []

    var n = n

    while n > 0 {
        arr.append(n%3)
        n /= 3
    }

    var answer = 0
    var exponent = 1

    for i in arr.reversed() {
        answer += i*exponent
        exponent *= 3
    }

    return answer
}

func solution7(_ n:Int) -> Int {
    var num = n
    var ans = 0
    var str = ""
    var base = 1
    while num > 0 {
        str.append(String(num%3))
        num /= 3
    }
    let reversed:[Character] = str.reversed()
    for i in reversed {
        let k = Int(String(i)) ?? 0
        if k != 0 {
            ans += (k*base)
        }
        base *= 3


    }

    return ans
}

func solution8(_ n:Int) -> Int {
var str = String(n, radix: 3)
var str2: String = ""
for i in str.reversed() {
   str2 += String(i)
}
return Int(str2, radix: 3)!
}

func solution9(_ n:Int) -> Int {
    let radix3 = String(n, radix: 3, uppercase: false)
    let reverseString = String(radix3.reversed())
    return Int(reverseString, radix: 3) ?? 0
}

func solution10(_ n:Int) -> Int {
    func convert(_ n:Int)-> String{ // 3진법으로 변환
        let T:[String] = ["0","1","2",]
        let q = n / 3
        let r = n % 3

        if q == 0 {
            return T[r]
        }else {
            return convert(q) + T[r]
        }
    }
    var count = 1
    let converted = Array(convert(n)).map{Int(String($0))}

    return converted.reduce(0, { count *= 3; return $0 + ($1! * count/3)})
}

/*
 func numChange(_ n:Int) -> String {
     var str = ""
     var tmp = n
     while tmp != 0 {
         str += String(tmp % 3)
         tmp /= 3
     }
     return str
 }
 func strChange(_ str: String) -> Int {
     var cnt = 1, result = 0
     var strTmp = str
     while strTmp.count != 0 {
         var tmp = strTmp.index(before: strTmp.endIndex)
         var num = Int(String(strTmp[tmp]))
         strTmp.remove(at: strTmp.index(before: strTmp.endIndex))
         if num == 0 {
             cnt *= 3
             continue
         } else {
             result += num! * cnt
             cnt *= 3
         }
     }
     return result
 }
 func solution11(_ n:Int) -> Int {
     return strChange(numChange(n))
 }
 */

func solution12(_ n:Int) -> Int {
    let s = String(String(n, radix: 3).reversed())
    return Int(s, radix : 3)!
}


func solution13(_ n:Int) -> Int {
    var value = n
    var ary = [Int]()
    var num = [1]
    while value >= 3{
        ary.append(value % 3)
        value /= 3
        num.append(num.last! * 3)
    }
    ary.append(value)
    return ary.map{$0 * num.removeLast()}.reduce(0,+)
}

func solution14(_ n:Int) -> Int {

    var temp: Int = n
    var arr: [Int] = []

    while temp != 0 {
        arr.append(temp % 3)
        temp /= 3
    }

    var result = 0
    var start = 1

    for _ in 0..<arr.count {
        result += arr.popLast()! * start
        start *= 3
    }

    return result
}

func solution15(_ n:Int) -> Int {
    var value = String(n, radix: 3).reversed()
    guard let result = Int(String(value), radix: 3) else { return 0 }
    return result
}

func solution16(_ n:Int) -> Int {
    return Int(String(String(n,radix: 3).reversed()),radix: 3)!
}

func solution17(_ n:Int) -> Int {
    var n = n
    var m = [Int]()

    while n > 0 {
        m.insert(n % 3, at: 0)
        n = n / 3
    }

    return m.enumerated().reduce(0, { $0 + Int(pow(3, Double($1.0))) * $1.1 })
}


//망작
/*
import Foundation

func solution(_ n:Int) -> Int {
    guard n >= 1, n <= 100000000 else {return -1}
    
    var n = n
    var tmp = 3
    var remainder = [Int]()
//    let threeTernaryScale = remainder.reversed()
    var num = [Int]()
    var result = 0
    
    while n > tmp {
        remainder.append(n%tmp)
        n/=tmp
    }
    remainder.append(n%tmp)
    var count = remainder.count
    // n ... 27 9 3 1
    // n ... 0  0 2 1
    for i in remainder {
        var num = 1

        if count != 1{
            for _ in 1..<count {
                num *= tmp
            }
            
            if remainder[i] != 0 {
                for _ in 0..<Int(remainder[i]) {
                    result+=num
                }
                count-=1
            }else{
                count-=1
                continue
            }
        }else{
            result+=1
        }
        
    }
    
    return result
}
*/
