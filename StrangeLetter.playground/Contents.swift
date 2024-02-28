import Cocoa
//    .description.trimmingCharacters
//김정호님 코드
func solution(_ s:String) -> String {
    var answer = ""
    var index = 0
    
    for c in s {
        let ascii = Int(UnicodeScalar(String(c))!.value)
        
        if ascii == 32 {
            index = 0
            answer += " "
        } else if index % 2 == 0 {
            if ascii >= 65 && ascii <= 90 {
                answer += String(c)
            } else {
                answer += String(UnicodeScalar(ascii - 32)!)
            }
            
            index += 1
        } else {
            if ascii >= 65 && ascii <= 90 {
                answer += String(UnicodeScalar(ascii + 32)!)
            } else {
                answer += String(c)
            }
            
            index += 1
        }
    }
    
    return answer
}

solution("try hello world")
/*
//망작
//오늘은 여기까지..그럼 안녕
func solution(_ s:String) -> String {
    //["t","r","y"," ","h","e","l","l","o"," ","w","o","r","l","d"]
    let str = s
    var arr = [Character]()
    print(arr)
    var strangeLetter = [Int]()
    var result = "\(strangeLetter)"
    print(result)
    
    for i in str {
        arr.append(i)
    }

    for j in 0..<arr.count {
        if arr[j] != " " {
            if Double(j % 2) == 0.0 {
                strangeLetter.append(Int(arr[j].asciiValue!-32))
            } else {
                strangeLetter.append(Int(arr[j].asciiValue!))
            }
        } else {
            //
        }
    }
    return result
}
 
solution("try hello world")

*/
