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
    var result = ""
//    var ii = 0
    for i in s {
        //         ii+=1
        let ascii = Int(UnicodeScalar(String(i))!.value)
        var count = 0
        char.append(String(i))
        if char[count] >= "^[A-Z]*$" {
            if char[count] == "^[Z]*$" {
                result += String(UnicodeScalar((ascii + 6) + n)!).lowercased()
            } else {
                // print((UnicodeScalar(ascii + n)!))
                result += String(UnicodeScalar(ascii + n)!)
            }
        } else if char[count] >= "^[a-z]*$"{
            if char[count] == "^[z]*$" {
                result += String(UnicodeScalar((ascii - 56) + n)!).uppercased()
            } else {
                result += String(UnicodeScalar(ascii + n)!)
            }
        } else if char[count] >= "^[ ]*$"{
            result += [" "]
        } else {
            //            return fatalError("Error")
            return "Err4"
        }
        count+=1
    }
    
    print(s)
    print(result)
    return String(result)
}

//solution("a  sd as", 1)
solution("a B z", 4)
