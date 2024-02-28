let arr = [1,2,3,4]

func solution(_ arr:[Int]) -> Double {
    var total = 0
    guard arr.count > 1 && arr.count < 100 else {return -1}
        guard arr.startIndex > -10000 && arr.endIndex < 10000 else { return -1 }
    
   for r in arr {
//       guard -10000...10000 ~= r else { return -1}
        total += r
    }
    print(Double(total))
    return (Double(total) / Double(arr.count))
}


