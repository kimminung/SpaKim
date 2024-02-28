import Foundation
/*
var data: Set<Int> = []

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    let copyData = makeCopyData(of: data)

    let sortedTable = sortTuple(copyData, col)
    var result = 0
    
    return result
}

func makeCopyData(of data: [[Int]]) -> [Int: [Int]] {
    var copyData = [Int: [Int]]() //초기화
    
    //기본키를 key로 설정, 각 tuple을 value로 설정
    for row in 0..<data.count { //0부터 data.count 미만으로..돌리네
        let defaultKey = data[row][0]   //기본키는 데이터의 [row마다(0..n)][0]번째
        copyData[defaultKey] = data[row] //
    }
    return copyData
}

func sortTuple(_ data: [Int: [Int]], _ col: Int) -> [(key: Int, value: [Int])] {
    return data.sorted {
        if $0.value[col-1] == $1.value[col-1] {
            return $0.key > $1.key
        }
        return $0.value[col-1] < $1.value[col-1]
    }
    
}
*/

            

extension String {
  subscript (_ i: Int) -> Element {
    return self[self.index(startIndex, offsetBy: i)]
  }
}

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {

  var mutableRows = data.sorted { lhs, rhs in
    if lhs[col - 1] == rhs[col - 1] {
      return lhs[0] > rhs[0]
    }
    return lhs[col - 1] < rhs[col - 1]
  }

//  print("mutable: \(mutableRows)")

  var acc_i = [Int]()

  for (index, row) in mutableRows.enumerated() {
    let acc = row.map { $0 % (index + 1) }
    let s_i = acc.reduce(0) { $0 + $1 }
    acc_i.append(s_i)
  }
    var answer = 0
  for value in acc_i[row_begin - 1...row_end - 1] {
      answer = answer ^ value
  }

  return answer // bitwiseList(Array(range))
}
func bitwiseList(_ array: [Int]) -> Int {
  var xor: String = ""
  var mutable = array

  while mutable.isEmpty == false {
    let first = mutable.removeFirst()
    let bin = String(first, radix: 2)

    if xor.isEmpty {
      xor = bin
      continue
    }
    xor = bitwiseXOR(bin, xor)

  }
  return  convertDecimal(xor)
}

func bitwiseXOR(_ lhs: String, _ rhs: String) -> String {
  var lhs = lhs
  var rhs = rhs
  var xor: String = ""

  if lhs.count != rhs.count {
    let maxCount = max(lhs.count, rhs.count)
    lhs = equalizeLength(lhs, n: maxCount)
    rhs = equalizeLength(rhs, n: maxCount)
  }

  for index in 0..<lhs.count {
    let value =  lhs[index] != rhs[index] ? "1" : "0"
    xor.append(value)
  }
//  print("lhs: \(lhs), rhs: \(rhs)")
//  print("xor: \(xor)")
  return String(xor)
}


func equalizeLength(_ s: String, n: Int) -> String {
  var mutable = String(s.reversed())
  while mutable.count != n {
    mutable.append("0")
  }
  return String(mutable.reversed())
}
func convertDecimal(_ base: String) -> Int {
  var base = Int(base) ?? 0
  var pow = 1
  var acc = 0
  while base >= 10 {
    let mod = base % 10
    base = base / 10
    acc += mod * pow
    pow *= 2
  }
  acc += base * pow
  return acc
}

/*
 import Foundation

 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
     let sortedData = data.sorted { ($0[col-1], -$0[0]) < ($1[col-1], -$1[0]) }
     var result = 0
     for i in row_begin...row_end {
         result ^= sortedData[i-1].reduce(0) { $0 + $1%i }
     }
     return result
 }
 */

/*
 import Foundation

 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
     var data = data.sorted{ $0[0] > $1[0] }.sorted { $0[col-1] < $1[col-1] }
     var answer = 0
     for i in stride(from: row_begin-1, through: row_end-1, by: 1) {
         answer ^= data[i].reduce(0) { $0 + ($1 % (i+1)) }
     }
     return answer
 }
 */

/*
 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
     let sortedData = data.sorted {
         if $0[col-1] == $1[col-1] {
             return $0[0] > $1[0]
         }
         return $0[col-1] < $1[col-1]
     }

     var result = [Int]()
     for i in stride(from: row_begin, through: row_end, by: 1) {
         result.append(sortedData[i-1].map { $0 % i }.reduce(0, +))
     }
     return result.reduce(0, ^)
 }
 */

/*
 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
     var res = 0
     var dict: [Int:[[Int]]] = [:]
     var visited: Set<Int> = []
     var sortedData: [[Int]] = []

     var c = col - 1
     for (idx, d) in data.enumerated() {
         dict[data[idx][c], default: []].append(d)
         visited.insert(data[idx][c])
     }

     var vals: [Int] = Array(visited)
     vals.sort()
     for val in vals {
         dict[val]!.sort { $0[0] > $1[0] }
         sortedData += dict[val]!
     }

     var rowBegin = row_begin - 1, rowEnd = row_end - 1
     for (idx, val) in sortedData.enumerated() {
         guard idx >= rowBegin && idx <= rowEnd else { continue }
         var temp = 0
         var curMod = idx + 1
         for v in val {
             temp += v % curMod
         }

         res = res ^ temp
     }

     return res
 }
 */

/*
 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
     var data = data.sorted { $0[col-1] == $1[col-1] ? $0[0] > $1[0] : $0[col-1] < $1[col-1] }
     var numbers = [Int]()
     for mod in row_begin-1...row_end-1 { numbers.append(data[mod].map { $0 % (mod + 1) }.reduce(0, +)) }
     return numbers.reduce(0, ^)
 }
 */

/*
 func solution(_ data: [[Int]], _ col: Int, _ rowBegin: Int, _ rowEnd: Int) -> Int {
     return ArraySlice(rowBegin - 1..<rowEnd).reduce(0) { acc1, i1 in
         acc1 ^ data.sorted { t1, t2 in
             t1[col - 1] == t2[col - 1] ? t2[0] < t1[0] : t1[col - 1] < t2[col - 1]
         }[i1].reduce(0) { acc2, i2 in
             acc2 + i2 % (i1 + 1)
         }
     }
 }
 */

/*
 import Foundation

 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
     var sorted = data.sorted{
         if $0[col-1] < $1[col-1] {
             return true
         } else if  $0[col-1] == $1[col-1] {
             if $0[0] > $1[0] {
                 return true
             } else {
                 return false
             }
         } else {
             return false
         }
     }
     var result:Int = 0
     for i in row_begin-1...row_end-1 {
         var sum:Int = 0
         for j in sorted[i] {
             sum += j%(i+1)
         }
         result = result^sum
     }
     return result
 }
 */

/*
 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {

     var totalSI:[Int] = []
     var answer = 0

     var sortedData = data.sorted{
         if $0[col-1] == $1[col-1]{
             return $0[0] > $1[0]
         }else{
             return $0[col-1] < $1[col-1]
         }
     }

     for rowIndex in (row_begin-1)...(row_end-1){
         var sum = 0
         for columnIndex in 0..<sortedData[0].count{
             sum = sum + sortedData[rowIndex][columnIndex] % (rowIndex+1)
         }
         totalSI.append(sum)
     }


     for index in 0..<totalSI.count{
         if index == 0{
             answer = totalSI[0]
         }else{
             answer ^= totalSI[index]
         }
     }

     return answer


 }
 */

/*
 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
     let data = sort(data, col - 1)
     var xor = 0

     for i in (row_begin...row_end) {
         xor ^= data[i - 1].reduce(0) { $0 + ($1 % i) }
     }

     return xor
 }

 func sort(_ data: [[Int]], _ index: Int) -> [[Int]]{
     return data.sorted {
         if $0[index] > $1[index] { return false }

         else if $0[index] == $1[index] {
             if $0[0] > $1[0] { return true }
             else { return false }
         }

         else { return true }
     }
 }
 */

/*
 import Foundation

 func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
     let data = data.sorted{ $0[col - 1] != $1[col - 1] ? $0[col - 1] < $1[col - 1] : $0[0] > $1[0] }

     let result = (row_begin...row_end).map { index in
         data[index - 1].reduce(0) { $0 + $1 % index }
     }.reduce(0,^)

     return result
 }
 */
