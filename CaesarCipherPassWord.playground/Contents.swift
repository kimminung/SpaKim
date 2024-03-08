import Cocoa

func solution(_ s:String, _ n:Int) -> String {
//    guard s = /[A-Za-z\s]/ else {return "Err"}
    //Cannot assign to value: 's' is a 'let' constant
    //Cannot assign value of type 'Regex<Substring>' to type 'String'
    //Use of '=' in a boolean context, did you mean '=='? eplace '=' with '=='
//    guard s = /[A-Za-z ]/ else {return "Err"}
    guard n >= 1, n <= 25 else{return "Err2"}
    guard s >= "^[A-Za-z ]*$" else {return "Err1"}
    guard s.count <= 8000 else {return "Err3"}
    
    var char = [String]()
//    var ii = 0
    for i in s {
//         ii+=1
        char.append(String(i))
        if char. >= "^[A-Za-z ]*$" {
            
        }
        }
    
    print(s)
    return s
}

solution("a  sd as", 1)
