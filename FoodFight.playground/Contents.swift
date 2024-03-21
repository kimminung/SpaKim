import Foundation

func solution(_ food:[Int]) -> String {
    
    guard food.count >= 2, food.count <= 9 else {return ""}
    
    for i in food {
        guard i >= 1, i <= 1000 else {return ""}
    }
    
    var result = ""
    for i in food.indices {
        result += String(repeating: String(i), count: food[i] / 2)
    }
    
    return result + "0" + result.reversed()
}

//solution([1, 3, 4, 6])
//solution([1, 7, 1, 2])

solution( [1, 2, 2, 2, 2])


//
func solution1(_ food: [Int]) -> String {
    let myString = food.enumerated().map { index, i in String(repeating: String(index), count: (i % 2 == 0 ? i : i - 1) / 2) }.joined()
    return "\(myString)0\(String(myString.reversed()))"
}


//
func solution2(_ food:[Int]) -> String {
    var sortedFood:String = ""
    food.reversed().enumerated().map{ index, foodCount in
        let lastIndex = food.count - 1
        if index == lastIndex {
            sortedFood.insert("0", at: String.Index(utf16Offset: sortedFood.count/2, in: sortedFood))
            return
        }
        for _ in 0..<foodCount/2 {
            sortedFood.insert(contentsOf: "\(lastIndex - index)", at: sortedFood.startIndex)
            sortedFood.insert(contentsOf: "\(lastIndex - index)", at: sortedFood.endIndex)
        }
    }
    return sortedFood
}


func solution3(_ food:[Int]) -> String {
    var f = food.map{ $0 / 2 }
    f.removeFirst()
    let s = f.enumerated().map{ String(repeating: "\($0.offset+1)", count: $0.element) }.joined(separator:"")
    return s + "0" + s.reversed()
}


func solution4(_ food:[Int]) -> String {
    var placement: String = ""
    for index in 1..<food.count {
        placement.append(String(repeating: "\(index)", count: food[index]/2))
    }
    return "\(placement)0\(String(placement.reversed()))"
}


//
func solution5(_ food:[Int]) -> String {
    var result: String = "0"

    let resultIndex = result.index(result.startIndex, offsetBy: 0)

    for index in stride(from: food.count - 1, to: 0, by: -1) {
        if food[index] / 2 == 0 {
            continue
        } else {
            for _ in 1...(food[index] / 2) {
                result.insert(contentsOf: String(index), at: resultIndex)
            }

            for _ in 1...(food[index] / 2) {
                result.append(String(index))
            }
        }
    }

    return result
}

/*
from collections import deque


def solution(food):
    temp = []

    for x in range(1, len(food)):
        s = str(x) * food[x]

        if len(s) % 2 == 0:
            mid = int(len(s) / 2)
            temp.append(s[0:mid])
            temp.append(s[mid::])
        else:
            s = s[0:-1]
            mid = int(len(s) / 2)
            temp.append(s[0:mid])
            temp.append(s[mid::])

    q = deque(['0'])
    for idx, x in enumerate(reversed(temp), start=0):
        if idx % 2 == 0:
            q.appendleft(x)
        else:
            q.append(x)

    return ''.join(q)
*/

/*
def solution00(food):
    answer = ''
    ans = ''
    
    for i in range(1, len(food)):
        for j in range(food[i]//2):
            ans += str(i)
    answer = ans + '0' + ans[::-1]
    return answer
*/

/*
 def solution(food):
     answer = '0'

     for i in range(len(food) - 1, 0, -1):
         c = int(food[i] / 2)

         while c > 0:
             answer = str(i) + answer + str(i)
             c -= 1

     return answer
 */
