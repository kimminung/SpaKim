import UIKit

/*
let array = [1, 2, 3, 4, 5]
var dp = array
 
for i in 1..<dp.count {
   dp[i] = dp[i-1] + array[i]
}
*/

/*
let array2 = [[1, 2, 3, 4],
              [5, 6, 7, 8],
              [9, 10, 11, 12],
              [13, 14, 15, 16]]
              
var dp = Array(repeating: [Int](repeating: 0, count: array2[0].count + 1), count: array2.count + 1)

for i in 1...array2.count {
    for j in 1...array2[0].count {
       dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + array2[i-1][j-1]
// dp가 array2보다 size가 1씩 크기때문에 마지막 array2에 접근할때 -1씩 감소해줬다.
   }
}
 */


func solution(_ array2:[[Int]]) -> [[Int]] {
    var dp = Array(repeating: [Int](repeating: 0, count: array2[0].count + 1), count: array2.count + 1)
    
    for i in 1...array2.count {
        for j in 1...array2[0].count {
            dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + array2[i-1][j-1]
        }
    }
    return dp
}

solution([[1, 2, 3, 4],
          [5, 6, 7, 8],
          [9, 10, 11, 12],
          [13, 14, 15, 16]])


//
/*
let n = readLine()!.split(separator: " ").map{ Int($0)! }
let h = n[0]
let w = n[1]
var arr = [[Int]]()
for _ in 1...h {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
var dp = Array(repeating: [Int](repeating: 0, count: w + 1), count: h + 1)
for i in 1...h {
    for j in 1...w {
        dp[i][j] = arr[i-1][j-1] + dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1]
    }
}
for _ in 0..<Int(readLine()!)! {
    let ijxy = readLine()!.split(separator: " ").map{ Int($0)! }
    let i = ijxy[0]
    let j = ijxy[1]
    let x = ijxy[2]
    let y = ijxy[3]
    print(dp[x][y] - dp[x][j-1] - dp[i-1][y] + dp[i-1][j-1])
}

dp = [[0, 0, 0, 0, 0],
      
      [0, 1, 3, 6, 10],

      [0, 6, 14, 24, 36],

      [0, 15, 33, 54, 78],

      [0, 28, 60, 96, 136]]
*/
