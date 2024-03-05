import Foundation

func solution(_ t:String, _ p:String) -> Int {
    guard p.count >= 1, p.count <= 18 else {return -1}
    guard p.count <= t.count, t.count <= 10000 else {return -1}
    
    //var t : Int = 0
    //var p : Int = 0
    var t = t
    var p = p
    if t.first == "0", p.first == "0" {
//        t = t.dropFirst()
//        p.dropFirst()
        t = t.trimmingCharacters(in: ["0"])
        p = p.trimmingCharacters(in: ["0"])
    }
//    guard t.first != "0", p.first != "0" else {
//        t = t.trimmingCharacters(in: ["0"])
//        p = p.trimmingCharacters(in: ["0"])
//    }
    print(t)
    while 
    
    return 0
}

//solution("3141592", "271")
solution("003141592", "00271")
