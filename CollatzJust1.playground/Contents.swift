import Foundation

func solution(_ num:Int) -> Int {
    
    guard num >= 1, num < 8000000, num > 0 else { return 0 }
    
    var num = num
    var count = 0
    while num != 1 {
//        continue
        if num % 2 == 0 {
//            result + 1
            num /= 2
//            continue
            
        } else if num % 2 == 1 {
//            result + 1
            num = num * 3 + 1
//            (num * 3) + 1
        }
        count += 1
//        return num
        
        if count >= 500 {
            return -1
        }
    }
    
    return count
}

//solution(6)
solution(16)
//solution(626331)


//
func odd(_ n: Int) -> Int {
    return n * 3 + 1
}

func even(_ n: Int) -> Int {
    return n / 2
}

func solution2(_ num:Int) -> Int {
    var ans = num
    var count = 0
    while ans != 1 && count < 500 {
        ans = ans % 2 == 0 ? even(ans) : odd(ans)
        count += 1
    }
    return count >= 500 ? -1 : count
}
//

func solution3(_ num:Int) -> Int {
    var number = num
     if number == 1 { return 0 }
    for i in 0..<500 {
        if number%2 == 0  {
            number = number/2;
        } else {
            number = number*3 + 1;
        }
        if number == 1 { return i+1};
    }
    return -1;
}


func solution4(_ num:Int) -> Int {
    var val = num
    var count = 0

    while val != 1 {
        if 0 == val % 2 {
            val /= 2
            count += 1
        } else {
            val = (val * 3 + 1) / 2
            count += 2
        }

        if 500 < count {
            return -1
        }
    }

    return count
}


/*
 func odd(_ n: Int) -> Int {
     return n * 3 + 1
 }

 func even(_ n: Int) -> Int {
     return n / 2
 }

 func solution5(_ num:Int) -> Int {
     var ans = num
     var count = 0
     while ans != 1 && count < 450 {
         ans = ans % 2 == 0 ? even(ans) : odd(ans)
         count += 1
     }
     return count >= 450 ? -1 : count
 }
 */

func solution6(_ num:Int) -> Int {
    var result = num
    var count = 0
    while result != 1 && count < 500 {
        if result % 2 == 0 {
            result = result / 2
        } else {
            result = result * 3 + 1
        }
        count += 1
    }

    if count == 500 {
        return -1
    }

    return count
}


func solution7(_ num:Int) -> Int {
        var result = num
    var count = 0

    while result != 1 {
        if result % 2 == 0 {
            result = result/2
        }else {
            result = result*3+1
        }
        count+=1

        if count >= 500 {
            count = -1
            break;
        }
    }

    return count
}


func solution8(_ num:Int) -> Int {
    var count = 0;
    var n = num;
    while n != 1 {
        n = collatz(n);
        count = count+1;
        if count > 450 {
            return -1;
        }
    }
    return count;
}

func collatz(_ num:Int) -> Int {
    if num % 2 == 0 {
        return num/2;
    }else{
        return 3*num + 1;
    }
}


func solution9(_ num:Int) -> Int {
    var input = num
    var count:Int = 0
    while (count<500) && (input != 1) {
        if input % 2 == 0 {
            input /= 2
        }
        else {
            input *= 3
            input += 1
        }
        count += 1
    }
    if count == 500 { count = -1}
    return count
}


var count = 0

func solution10(_ num:Int) -> Int {
    guard count <= 500 else { return -1 }

    if num == 1 {
        let currentCount = count

        count = 0

        return currentCount
    }

    count += 1

    if num % 2 == 0 {
        return solution(num / 2)
    } else {
        return solution((num * 3) + 1)
    }
}


func solution11(_ num:Int) -> Int {
    var count = -1
    return collatz(Int64(num), count: &count)
}

func collatz(_ num:Int64, count:inout Int) -> Int {
    count += 1
    return (count>=500 ? -1 : (num==1 ? count : collatz(num%2==0 ? num/2 : num*3+1, count: &count)))
}



func solution12(_ num:Int) -> Int {
    var number = num
    if number == 1 { return 0 }
    for i in 1..<500 {
        if number % 2 == 0 {
            number /= 2
        } else {
            number = number*3 + 1
        }
        if number == 1 { return i }
    }
    return -1
}
