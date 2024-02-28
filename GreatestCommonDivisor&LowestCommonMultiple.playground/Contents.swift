import Cocoa

func solution(_ n:Int, _ m:Int) -> [Int] {
    guard n > 0, m > 0, n <= 1000000, m <= 1000000 else {return []}
    
    var c = [1, 1]
    var tmp = 2
    var n = n
    var m = m
    while tmp <= n && tmp <= m {
        if n % tmp == 0 && m % tmp == 0 {
            n /= tmp
            m /= tmp
            c[0] *= tmp
            c.append(tmp)
        } else {
            tmp += 1
        }
    }
    return [c[0], c[0] * n * m]
}

func solution00(_ n:Int, _ m:Int) -> [Int] {
    let g = gcd(n, m)
    let l = lcm(n, m)
    
    return [g, l]
}

func gcd(_ a:Int, _ b:Int) -> Int {
    let r = a % b
    
    if r != 0 {
        return gcd(b,r)
    } else {
        return b
    }
}

func lcm(_ a:Int, _ b: Int) -> Int {
    let r = a * b / gcd(a, b)
    
    return r
}

//solution00(3, 12)
solution00(2, 5)

/*
 func gcd(_ a: Int, _ b: Int) -> Int {
     let mod: Int = a % b
     return 0 == mod ? min(a, b) : gcd(b, mod)
 }

 func lcm(_ a: Int, _ b: Int) -> Int {
     return a * b / gcd(a, b)
 }

 func solution(_ n:Int, _ m:Int) -> [Int] {
     return [gcd(n, m), lcm(n, m)]
 }
 */
    
    
func solution0(_ n:Int, _ m:Int) -> [Int] {
    var numN = n
    var numM = m
    var numZ = numN
    
    var count = 2
    var result = [Int]()
    
    while numN > 1 {
            if numN % count == 0 {
                numN /= count
                result.append(count)
            } else if numN == 1{
                numN = numM
                result.append(numN)
            } else {
                count += 1
            }
        }
    return Array(Set(result)).sorted()
}

solution0(3, 12)
//solution(2, 5)

func solution1(_ n:Int, _ m:Int) -> [Int] {
    var first: [Int] = []
    for index in 1...n {
        if n % index == 0  && m % index == 0 {
            first.append(index)
        }
    }
    let maxValue: Int = first[first.count-1]
    return [maxValue ,(n * m)/maxValue ]
}

//
func solution2(_ n:Int, _ m:Int) -> [Int] {
    let g = gcd(n,m);
    return [g, g * (n/g) * (m/g)];
}

func gcd2(_ n:Int,_ m: Int)->Int {
    return n%m == 0 ? m : gcd(m, n%m)
}

//
import Foundation

func solution3(_ n:Int, _ m:Int) -> [Int] {
    func findPrimeList(_ m : Int ) -> [Int]{
        if m == 1 { return [1] }
        if m == 2 { return [2] }
        if m == 3 { return [3]}
        var n = m
        var li = [Int]()
        for i in 2...Int(sqrt(Double(n))) {
            while n % i == 0 {
                n /= i
                li.append(i)
            }
        }
        if n > 1 { li.append(n)}
        return li
    }

    func find(n : [Int], m : [Int]) -> [Int]{
        let nSetList = Set(n)
        let mSetList = Set(m)

        var s = 1
        var x = 1

        let nmSet = nSetList.union(mSetList)

        var nDict = [Int:Int]()
        var mDict = [Int:Int]()

        nSetList.forEach{num in
            nDict[num] = n.filter{$0==num}.count}

        mSetList.forEach{num in
            mDict[num] = m.filter{$0==num}.count}


        for num in nmSet {
            var nCount = 0
            var mCount = 0
            if let nC = nDict[num] {
                nCount = nC
            }
            if let mC = mDict[num] {
                mCount = mC
            }

            if nCount != 0 && mCount != 0 {
                s *= Int(pow(Double(num), Double(min(nCount,mCount))))
                x *= Int(pow(Double(num), Double(max(nCount,mCount))))

            }else if nCount == 0 {
                x *= Int(pow(Double(num), Double(mCount)))

            }else if mCount == 0 {
                x *= Int(pow(Double(num), Double(nCount)))
            }

        }
        return [s,x]

    }



    return find(n: findPrimeList(n), m: findPrimeList(m))



}
//



//
func solution4(_ n:Int, _ m:Int) -> [Int] {
    var result : [Int] = [0,0]
    var max = 0
    var min = 0
    if(n<m)
    {
        max = m
        min = n
    }else{
        max = n
        min = m
    }

    for i in 1...min
    {
        if(min%i == 0 && max%i == 0)
        {
            if(result[0] < i)
            {
                result[0] = i
            }
        }
    }

    for i in max...1000000
    {
        if(i%max == 0 && i%min == 0)
        {
            result[1] = i
            break;
        }
    }
    return result
}


//
func solution5(_ n:Int, _ m:Int) -> [Int] {
    var small : Int = 0
    var common = [Int]()
    if n>m{
         small = m
    } else {
         small = n
    }

    var moc : Int = small

    var a1 = m
    var b1 = n
   repeat {
       var a : Int = moc
       if a1%a == 0 {
           if b1%a == 0 {
               common.append(a)
               a1 /= a
               b1 /= a
           }
       }

       moc -= 1
   }while moc >= 1

    var choiso : Int = 1;
    for i in 0..<common.count {
        choiso *= common[i];
    }

    var choidae : Int = 1;
    var c = m/choiso
    var d = n/choiso

    choidae = c*d*choiso


    return [choiso, choidae]
}

func solution6(_ n:Int, _ m:Int) -> [Int] {
    var min = n < m ? n : m
    var max = n > m ? n : m
    var GCD = 0
    var LCM = 0

    for num in 1...min {
        if n % num == 0 && m % num == 0 {
            GCD = num
        }
    }

    for num in max...(n * m) {
        if num % n == 0 && num % m == 0 {
            LCM = num
            break
        }
    }
    return [GCD, LCM]
}

//
func solution7(_ n:Int, _ m:Int) -> [Int] {
    let small = n > m ? m : n
    let large = n > m ? n : m

    return [gcd(small, large), lcm(small, large)]
}

func lcm3(_ small:Int, _ large:Int) -> Int {
    if large % small == 0 {
        return large
    }

    var result = small * large

    for num in large...(small*large) {
        if num % large == 0 && num % small == 0 {
            result = num
            break
        }
    }

    return result
}

func gcd3(_ small:Int, _ large:Int) -> Int {
    if large % small == 0 {
        return small
    }

    var result = 1
    var factor = small / 2
    while factor != 1 {
        if small % factor == 0 && large % factor == 0 {
            result = factor
            break
        }
        factor -= 1
    }

    return result
}


func solution8(_ n:Int, _ m:Int) -> [Int] {
    let min = n > m ? m : n
    let max = n > m ? n : m

    if min == 1 || max % min == 0 {
        return [min, max]
    }
    else {
        var tmp: [Int] = []
        for i in 1...max {
            if min % i == 0 && max % i == 0 {
                tmp = [i, i*(min/i)*(max/i)]
            }
        }
        return tmp
    }
}

func solution9(_ n:Int, _ m:Int) -> [Int] {
    var (a, b) = (n, m)
    while b != 0 {
        let temp = a % b
        a = b
        b = temp
    }
    return [a, n * m / a]
}

//소인수분해
/*
func solutionFactorization(_ n:Int) -> [Int] {
        var num = n
        var count = 2
        var result = [Int]()

        while num > 1 {
            if num % count == 0 {
                num /= count
                result.append(count)
            } else {
                count += 1
            }
        }
    return Array(Set(result)).sorted()
}
solutionFactorization(2022)
*/
