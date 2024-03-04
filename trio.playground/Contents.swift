import Foundation

func solution(_ number:[Int]) -> Int {
    guard 3 <= number.count, number.count <= 13 else {return -1}
    for i in number {
        guard i >= -1000, i <= 1000 else { return -1}
    }

    var result = 0
    for i in 0..<(number.count - 2) {
        for j in (i+1)..<(number.count - 1) {
            for k in (j+1)..<number.count {
                if number[i] + number[j] + number[k] == 0 {
                    result += 1
                }
            }
        }
    }
    return result
}

//solution([-1001, 1000, -1, -2, -3])

//
/*
 func solution(_ number:[Int]) -> Int {
     var count = 0
     (0..<number.count).forEach { num1 in (num1+1..<number.count).forEach { num2 in (num2+1..<number.count).forEach { if number[num1] + number[num2] + number[$0] == 0 { count += 1 } } }}
     return count
 }
 */


//func 2번 쓴분도 계시네
/*
func solution(_ number:[Int]) -> Int {
    var answer = 0
    func dfs(_ now: Int, _ sum: Int, _ count: Int) {
        if count == 3 {
            if sum == 0 { answer += 1 }
            return
        }
        for i in now..<number.count {
            dfs(i+1, sum + number[i], count + 1)
        }
    }
    dfs(0, 0, 0)
    return answer
}
*/


//펑션을 위로 빼고 그 위에 변수를 넣어준..
/*
 var numberArr:[Int] = []
 var answer: Int = 0
 func comb(_ depth:Int, _ sum: Int, _ idx: Int){
     if depth == 3{
         if sum == 0 { answer += 1 }
     }else{
         for i in idx..<numberArr.count{
             comb(depth+1, sum + numberArr[i], i + 1)
         }
     }

 }

 func solution(_ number:[Int]) -> Int {
     numberArr = number
     comb(0,0,0)
     return answer
 }
 */


//
/*
 var ans = 0
 var dic = [[Int]:Bool]()

 func solution(_ number:[Int]) -> Int {
     var visited:[Bool] = Array(repeating: false, count:number.count)
     dfs(number,visited,0,0,[])
     print(dic)
     return dic.count
 }

 func dfs(_ number:[Int],_ visited:[Bool], _ cnt:Int,_ count:Int, _ arr:[Int]){
     var cnt = cnt
     var visited = visited
     var arr = arr
     if(count == 3){
         if(cnt == 0){
             if(dic[arr] == nil){
                 ans += 1
                 dic[arr] = true
             }

         }
         return
     }
     else{
         for i in 0...number.count-1{
             if(!visited[i]){
                 visited[i] = true
                 cnt += number[i]
                 arr.append(i)
                 dfs(number,visited,cnt,count+1,arr)
                 arr.removeLast()
                 cnt -= number[i]

             }
         }
     }
 }
 */

//    [T]
/*
 func combination<T>(_ elements: [T], _ k: Int) -> [[T]] {
     var result = [[T]]()

     func combi(_ index: Int, _ now: [T]) {
         if now.count == k {
             result.append(now)
             return
         }
         for i in index..<elements.count {
             combi(i + 1, now + [elements[i]])
         }
     }
     combi(0, [])
     return result
 }

 func solution(_ number:[Int]) -> Int {
     var combi = combination(number,3)
     var cnt = 0
     for i in combi {
         if i.reduce(0,+) == 0 {
             cnt += 1
         }
     }
     return cnt
 }
 */

//
/*
 func solution(_ number:[Int]) -> Int {

     var answer = 0
     var arr = number
     for i in 0..<(number.count - 1) {
         var arr = number
         arr.removeSubrange(0...i)
         for j in (i + 1)..<number.count {
             let sum = number[i] + number[j]
             arr.remove(at: 0)
             for k in arr {
                 if (sum * -1) == k {
                     answer += 1
                 }
             }
         }
     }
     return answer
 }
 */


//stride
/*
 func solution(_ number:[Int]) -> Int {
     var trio: Int = 0
     for first in stride(from: 0, to: number.count, by: 1) {
         for second in stride(from: first+1, to: number.count, by: 1) {
             for third in stride(from: second+1, to: number.count, by: 1) {
                 if number[first] + number[second] + number[third] == 0 {
                     trio += 1
                 }
             }
         }
     }
     return trio
 }
 */


//
/*
 func solution(_ number:[Int]) -> Int {
     // 3명의 정수 번호를 더했을 때 0이 되면 삼총사
     var array: [[Int]] = []

     // -1000 부터 1000까지의 원소가 들어가기 때문에 for 문 사용.
     for x in 0..<number.count - 2 {
         for y in (x + 1)..<number.count - 1 {
             for z in (y + 1)..<number.count {
                 array.append([x, y, z])
             }
         }
     }

     return array.map { $0.reduce(0) { $0 + number[$1] } }.filter { $0 == 0 }.count
 }
 */


//
/*
 func solution(_ number:[Int]) -> Int {
     let visit = [Bool](repeating: false, count: number.count)
     var counter : Int = 0

     func search(data : [Int],
                 currentIndex : Int,
                 currentDepth : Int,
                 targetDepth : Int,
                 isVisit : [Bool],
                 sum : Int
     ) {
         guard currentDepth < targetDepth else {
             if sum == 0 { counter += 1 }
             return
         }

         for i in currentIndex...data.count - 1 {

             if isVisit[i] == false {
                 var newVisit = isVisit
                 newVisit[i] = true
                 search(data: data, currentIndex: i, currentDepth: currentDepth + 1, targetDepth: targetDepth, isVisit: newVisit, sum: sum + data[i])
             }
         }
     }
     search(data: number, currentIndex: 0, currentDepth: 0, targetDepth: 3, isVisit: visit, sum: 0)
     return counter
 }
 */
