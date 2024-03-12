import Foundation


//처음 만들려고 했던것
let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
//let (a, b, c) = (n[0], n[1], n[2])

var result = ""

for _ in 0..<1 {
   result += "\(Int.random(in: 1..<10))"
    for _ in 0..<1 {
        result += "\(Int.random(in: 1..<10))"
        for _ in 0..<1 {
            result += "\(Int.random(in: 1..<10))"
        }
    }
}
print(result)

for i in n {
    if i == Int(result.prefix(0)) {
        print("\(i+1)strike")
    }
}


