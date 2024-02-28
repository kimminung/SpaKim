//
//  main.swift
//  RectangleSquare
//
//  Created by 민웅킴 on 2/21/24.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])
var result = ""

for _ in 1...b {
    for _ in 1...a {
        result += "*"
    }
    result += "\n"
}
print(result)



/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 for _ in 0..<b {
     print(Array(repeating: "*", count: a).joined())
 }
 */


/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 print(String(repeating: String(repeating: "*", count: n[0])+"\n", count: n[1]))
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 for _ in 1...b {
     for _ in 1...a {
         print("*", terminator: "")
     }
     print("")
 }
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])
 var line = ""
 for i in 0..<b {
     line = ""
     for j in 0..<a {
         line += "*"
     }
     print(line)
 }
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 for i in 0..<b {
     for j in 0..<a {
         print("*", terminator:"")
     }
      print("")
 }
 */


/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 for line in 0..<b {
     for count in 0..<a {
         print("*", terminator: "")
     }
     print("")
 }
 */


/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 for _ in 0..<b {
     for _ in 0..<a {
         print("*", terminator: "")
     }
     print()
 }
 */


/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }

 func printStar(_ col: Int, _ row: Int) {

     guard col <= 1000, row <= 1000 else { return }

     var stars = ""

     (0..<row).forEach { _ in
         (0..<col).forEach { currentCol in
             stars.append("*")

             if currentCol == col - 1 {
                 print(stars)
                 stars = ""
             }
         }
     }
 }

 printStar(n[0], n[1])
 */


/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 // a 가로 b 세로

 var str = ""

 for j in 1...a {
     str.append("*")
 }

 for i in 1...b
 {
     print(str)
 }
 */

/*
 func 직사각형별찍기(n: Int, m: Int) {
         var row = ""
         for _ in 0..<m {
             for _ in 0..<n {
                 row.append("*")
             }

             row.append("\n")
         }

         print(row)
     }

 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])
 직사각형별찍기(n: a, m: b)
 print(a + b)
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 for i in 0..<b {

     var s = ""
     for j in 0..<a {
         s += "*"
     }
     print(s)
 }
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 let str = String(repeating: "*", count: a)
 for _ in 0..<b {
     print(str)
 }
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])
 for i in 0..<b {
     var str = ""
     for _ in 0..<a {
         str.append("*")
     }
     print(str)
 }
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 var star = ""

 for _ in 0 ..< a{
     star.append("*")
 }

 for _ in 0 ..< b{
     print(star)
 }
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])

 for _ in 0..<b {
     print(String(repeating: "*", count: a))
 }
 */

/*
 let input = readLine()!.split(separator: " ").map { Int($0)! }
 let (width, height) = (input[0], input[1])

 print([String](repeating: String(repeating: "*", count: width), count: height).joined(separator: "\n"))
 */

/*
 let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
 let (a, b) = (n[0], n[1])
 let s :[[String]] = Array(repeating: Array(repeating:"*", count: n[0]), count:n[1])
 s.forEach {
     print($0.joined())
 }

 */
