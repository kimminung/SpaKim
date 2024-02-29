import Foundation

var n = 12345
func solution(_ n:Int64) -> [Int] {
    
    var num = Int(n)
    var arr = [Int]()
    
    for _ in 1..<num+1 {
        if num == 0 {
            return arr
//            break
        } else {
        arr.append(num%10)
        num /= 10
//        r = num
        }
    }
//    print(arr)
    return arr
//    print(arr)
}

solution(12345)
/*
func solution(_ n:Int64) -> [Int] {
    var str : [String] = [String(Int64(n))] //  ['12345']
    var result : [Int] = []
    

        for i in 0..<(Int(str.count)) {
            
        }
        return result

}
*/


/*
func solution(_ n:Int64) -> [Int] {
    var char : [Character] = []
    var result : [Int] = []
    
    for i in 0..<char.count {
        result.append(Int(char.index(char.startIndex, offsetBy: i)))
    }
    return result
}
*/


/*
func solution(_ n:Int64) -> [Int] {
    var char : [Character] = [Character(String(Int64(n)))]
//    var char : [Character] = []
    var result : [Int] = []
    
    for i in 0..<char.count {
        result.append(Int(char.index(char.startIndex, offsetBy: i)))
    }
    return result
}
*/


/*

func solution(_ n:Int64) -> [Int] {

    guard n <= 10000000000, n > -1 else { return [-100] }
    
    var a = Int(Int64(n))
   print (a)   //12345
    var st = [String(a)]
    print (st)  //["12345"]
    var r = [Int]()
    print (r)   //[]
    
        print(st.endIndex) //1
    for var x in 0...st.count-1 {
        print (x)   //0
        print (st)  //["12345"]
        // x *= 10
        print (x)   //0
        // x += a % 10
        print (x)   //5
       print (a)   //12345
        // a /= 10
       print (a)   //1234
        print (r)   //[]
        //        r.append(Int(x))
        r.append(Int(st[st.index(st.startIndex, offsetBy: x)])!)
        print (r)
    }
    return r
}

 */


/*

func solution(_ n:Int64) -> [Int] {
    guard n <= 10000000000, n > -1 else { return [-100] }
    //    var n : [String] = []
    var result : [Int] = []
    if n > 0 {
        var n : [String] = []
        for index in 0...Int(String(n.))! {
            result.append(Int(index))
        }
    }
    return result
}

*/

/*
func solution(_ n:Int64) -> [Int] {
    guard n <= 10000000000, n > -1 else { return [-100] }
    
    var result : [Int] = []
    var n = [Int]()
    
    while n[Int.max] != 0 {
        result = [Int(result[Int.max] * 10) + Int(n[Int.max] % 10)]
        Int(n[Int.max] / 10)
        
    }
    
    return result
}
*/

/*
var n = 12345
func solution(_ n:Int64) -> [Int] {
    
    var r = [String(n)]   //"12345"
    print(r)
    var result = [Int]()
    
    for var i in 0...n {    //0 01234
        print(i)    //4
        print(r)    //12345.count -1 =
        i *= 10 //40
//        i += Int(String(r))! % 10   //45
        print(i)
        i /= 10 //4
        result.append(Int(Int64(i)))
        break
    }
    
    return result
}
print(solution(Int64(n)))
*/



func solution0(_ n:Int64) -> [Int] {
    return  "\(n)".compactMap { $0.hexDigitValue }.reversed()
}


func solution1(_ n:Int64) -> [Int] {
    let arr = String(n).compactMap { Int(String($0)) }
    return arr.reversed()
}


func solution2(_ n:Int64) -> [Int] {
    return String(n).reversed().compactMap { Int(String($0)) }
}


func solution3(_ n:Int64) -> [Int] {
    return  String(String(n).reversed()).map { Int(String($0))! }
}


func solution4(_ n:Int64) -> [Int] {
    return String(n).reversed().map{Int(String($0))!};
}


func solution5(_ n:Int64) -> [Int] {
    let input = String(n)
    var res = [Int]()
    for i in 0..<input.count {
        res.append(Int(String(input[input.index(input.startIndex, offsetBy: i)]))!)
    }
    res.reverse()
    return res
}


func solution6(_ n:Int64) -> [Int] {
    return Array(String(n)).map{ Int(String($0))! }.reversed()
}

func solution7(_ n:Int64) -> [Int] {
    guard n <= 10000000000, n > -1 else { return [-100] }
    
    var result : [Int] = Array(String(n)).map{Int(String($0))!}.reversed()
    
    return result
}

solution7(12345)
