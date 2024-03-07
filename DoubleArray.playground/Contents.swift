import Cocoa

func doubleArray(_ num1:Int, _ num2:Int) -> [[Int]] {
    
//    var arrA : [[Int]] = Array(repeating: Array(repeating: 1,count:num1 ), count: num2)
    
//    var arr2 = [[Int]](repeating: Array(repeating: 1,count: 5 ), count: 3)

    
    var arrB : [[Int]] = []
//    var arrTotal : [[Int]] = [[]]
    
    for i in 0..<num1 {
        arrB.append([i])
        for j in 1..<num2 {
            arrB.append([j])
        }
    }
    print(arrB)
    return arrB
}

doubleArray(10, 10)


