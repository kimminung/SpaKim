import Cocoa

func solution(_ s:String, _ n:Int) -> String {
    //    guard s = /[A-Za-z\s]/ else {return "Err"}
    //Cannot assign to value: 's' is a 'let' constant
    //Cannot assign value of type 'Regex<Substring>' to type 'String'
    //Use of '=' in a boolean context, did you mean '=='? eplace '=' with '=='
    //    guard s = /[A-Za-z ]/ else {return "Err"}
    
    
    // let simpleDigits = try Regex("[A-Za-z\\s]")
    // let ss = #"[a-zA-Z\\s]"#
    guard n >= 1, n <= 25 else{return "Err2"}
//     guard s >= "^[a-zA-Z ]*$" else {return "Err1"}
    // guard s >= ss else {return "Err1"}
    
    guard let regex = try? NSRegularExpression(pattern: "^[A-Za-z ]*$") else { return "Err1" }
    let range = NSRange(location: 0, length: s.utf16.count)
    guard regex.matches(in: s, range: range).count > 0 else { return "Err1" }
    
    guard s.count <= 8000 else {return "Err3"}
    
    var char = [String]()
    var result = ""
    var count = 0
    for i in s {
        let ascii = Int(UnicodeScalar(String(i))!.value)
        
        char.append(String(i))
        if char[count] >= "A" && char[count] <= "Z" {
            if char[count] == "Z" {
                result += String(UnicodeScalar(ascii + (n-26))!)
            } else {
                result += String(UnicodeScalar((ascii + n - 65) % 26 + 65)!)
            }
        } else if char[count] >= "a" && char[count] <= "z" {
            if char[count] == "z" {
                result += String(UnicodeScalar(ascii + (n-26))!)
            } else {
                result += String(UnicodeScalar((ascii + n - 97) % 26 + 97)!)
            }
        } else if char[count] == " " {
            result += " "
        } else {
            return "Err4"
        }
        count += 1
    }
    return String(result)
}

//
func solution0(_ s:String, _ n:Int) -> String {
    guard n >= 1, n <= 25 else{return "Err2"}
    
    guard let regex = try? NSRegularExpression(pattern: "^[A-Za-z ]*$") else { return "Err1" }
    let range = NSRange(location: 0, length: s.utf16.count)
    guard regex.matches(in: s, range: range).count > 0 else { return "Err1" }
    
    guard s.count <= 8000 else {return "Err3"}
    
    return s.map { character in
        let ascii = character.asciiValue!
        var crypt = ascii + UInt8(n)
        
        if ascii >= 97 && ascii <= 122 {
            if crypt > 122 {
                crypt -= 26
            }
        } else if ascii >= 65 && ascii <= 90 {
            if crypt > 90 {
                crypt -= 26
            }
        } else {
            crypt -= UInt8(n)
        }
        
        return String(UnicodeScalar(crypt))
    }.joined()
}

//solution("AB", 1)
//solution("a  sd as", 1)
//solution("z", 1)
//solution("김만", 2)
//solution("a B z", 4)

solution("z", 15)
solution0("z", 15)

//
func solution1(_ s:String, _ n:Int) -> String {
    let str = Array(s)
    var result = ""
    for i in str {

        var asciiCode = i.asciiValue!
        if asciiCode >= 65 && asciiCode <= 90 {
            if asciiCode + UInt8(n) > UInt8(90){
                asciiCode = UInt8(65) + (asciiCode + UInt8(n) - UInt8(90)) - UInt8(1)
                result += String(UnicodeScalar(asciiCode))
            } else {
                result += String(UnicodeScalar(asciiCode + UInt8(n)))
            }
        } else if asciiCode >= 97 && asciiCode <= 122 {
            if asciiCode + UInt8(n) > UInt8(122){
                asciiCode = UInt8(97) + (asciiCode + UInt8(n) - UInt8(122)) - UInt8(1)
                result += String(UnicodeScalar(asciiCode))
            } else {
                result += String(UnicodeScalar(asciiCode + UInt8(n)))
            }
        } else {
            result += String(i)
        }
    }
    return result
}


//
func solution2(_ s:String, _ n:Int) -> String {

    let alphabet = [0:"A",1:"B",2:"C",3:"D",4:"E",5:"F",6:"G",7:"H",8:"I",9:"J",10:"K",11:"L",12:"M",13:"N",14:"O",15:"P",16:"Q",17:"R",18:"S",19:"T",20:"U",21:"V",22:"W",23:"X",24:"Y",25:"Z"]
    var result = ""

    for i in 0..<s.count {
        var sIndex = s[s.index(s.startIndex, offsetBy: i)]
        var upper:Int = 0
        if sIndex == " " {
            result.append(" ")
            continue
        }

        for (key, value) in alphabet {
            if sIndex.uppercased() == value {
                upper = key + n
                if upper > 25 {
                    upper -= 26
                }
                break
            }
        }

        if sIndex.isUppercase {
            result.append(alphabet[upper]!)
        } else {
            result.append(alphabet[upper]!.lowercased())
        }
    }

    return result
}

//
func solution3(_ s:String, _ n:Int) -> String {
  let n = UInt8(n)
  let uppercaseBoundary: ClosedRange<UInt8> = 65 ... 90
  let lowercaseBoundary: ClosedRange<UInt8> = 97 ... 122

  var result = ""

  for character in s {
    guard !character.isWhitespace else {
      result += " "
      continue
    }

    let asciiValue = character.asciiValue!
    if uppercaseBoundary.contains(asciiValue) {
      var newAsciiValue = asciiValue + n
      if !uppercaseBoundary.contains(newAsciiValue) {
        newAsciiValue = 65 + newAsciiValue - 90 - 1
      }
      result += String(Character(.init(newAsciiValue)))
    } else {
      var newAsciiValue = asciiValue + n
      if !lowercaseBoundary.contains(newAsciiValue) {
        newAsciiValue = 97 + newAsciiValue - 122 - 1
      }
      result += String(Character(.init(newAsciiValue)))
    }
  }
  return result
}


//
func solution4(_ s:String, _ n:Int) -> String {
    let a=Int(UnicodeScalar("a").value), A=Int(UnicodeScalar("A").value)
    return s.map{
        if $0 == " " {return " "}
        let unicode = Int(UnicodeScalar(String($0))!.value)
        let x = unicode<a ? A:a
        return String(UnicodeScalar((unicode - x + n) % 26 + x)!)
    }.joined()
}



//
func solution5(_ s:String, _ n:Int) -> String {

    var upper = Array("abcdefghijklmnopqrstuvwxyz".uppercased())
    var lower = Array("abcdefghijklmnopqrstuvwxyz")
    var ss = Array(s)
    var result = ""

    print(ss)

    for i in ss{
        if upper.contains(i){
            var indexNum = upper.index(of: i)! + n

            if indexNum > 25{
                indexNum = indexNum - 26
            }

            result.append(upper[indexNum])
        }else if lower.contains(i){
            var indexNum = lower.index(of: i)! + n

            if indexNum > 25{
                indexNum = indexNum - 26
            }
            result.append(lower[indexNum])

        }else{
            result.append(i)
        }
    }

    print(result)
    return result
}


//
func solution6(_ s:String, _ n:Int) -> String {
    return String(s.utf16.map {
        if 65 <= $0 && $0 <= 90 {
            return Character(UnicodeScalar((Int($0) + n - 65 ) % 26 + 65)!)
        } else if 97 <= $0 && $0 <= 122 {
            return Character(UnicodeScalar((Int($0) + n - 97 ) % 26 + 97)!)
        } else {
            return Character(UnicodeScalar($0)!)
        }
    })
}


//
func solution7(_ s:String, _ n:Int) -> String {
    let lowercase = (Unicode.Scalar("a").value ... Unicode.Scalar("z").value).compactMap({ Unicode.Scalar($0) }).map({ String($0) })
    let uppercase = (Unicode.Scalar("A").value ... Unicode.Scalar("Z").value).compactMap({ Unicode.Scalar($0) }).map({ String($0) })

    return s.reduce("") { (result, char) -> String in
        if lowercase.contains(String(char)) {
            let index = lowercase.firstIndex(of: String(char)) ?? 0
            let shift = (n + index) % lowercase.count

            return result + lowercase[shift]

        } else if uppercase.contains(String(char)) {
            let index = uppercase.firstIndex(of: String(char)) ?? 0
            let shift = (n + index) % uppercase.count

            return result + uppercase[shift]

        } else {
            return result + " "
        }
    }
}

//
func solution8(_ s:String, _ n:Int) -> String {
    var str = ""

    let a:UInt8 = 65
    let z:UInt8 = 90
    let A:UInt8 = 97
    let Z:UInt8 = 122

    for c in s {
        if(c == " ") {
            str.append(c)
        } else {
            let char = Character(extendedGraphemeClusterLiteral: c)
            var sum = char.asciiValue! + UInt8(n)

            if(char.asciiValue! <= z && sum > z) {
                sum = (a-1) + (sum-z)
            } else if(char.asciiValue! >= A && sum>Z)  {
                sum = (A-1) + (sum-Z)
            }

            str.append( Character(UnicodeScalar(sum)) )
        }
    }
    return str
}


//
func solution9(_ s:String, _ n:Int) -> String {

    let lowwer = "abcdefghijklmnopqrstuvwxyz".compactMap { $0.description }
    let upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".compactMap { $0.description }

    var result = ""
    for a in Array(s) {
        var shift = " "
        if let index = lowwer.firstIndex(of: a.description) {

            let shiftIndex = index + n
            if shiftIndex >= lowwer.count {
                shift = lowwer[abs(lowwer.count - shiftIndex)]
            } else {
                shift = lowwer[shiftIndex]
            }
        } else if let index = upper.firstIndex(of: a.description) {
            let shiftIndex = index + n
            if shiftIndex >= upper.count {
                shift = upper[abs(upper.count - shiftIndex)]
            } else {
                shift = upper[shiftIndex]
            }
        }
        result.append(shift)
    }
    return result
}

//

func solution10(_ s:String, _ n:Int) -> String {
    return s
//    .compactMap({ transform($0, n: n) })
    .map({ String($0) })
    .joined()
}

func transform11(_ c: Character, n: Int) -> Unicode.Scalar {
    switch c {
        case "A"..."Z":
            if c.asciiValue! + UInt8(n) > Character("Z").asciiValue! {
                return Unicode.Scalar(c.asciiValue! + UInt8(n - 1) - Character("Z").asciiValue! + Character("A").asciiValue!)
            } else {
                return Unicode.Scalar(c.asciiValue! + UInt8(n))
            }
        case "a"..."z":
            if c.asciiValue! + UInt8(n) > Character("z").asciiValue! {
                return Unicode.Scalar(c.asciiValue! + UInt8(n - 1) - Character("z").asciiValue! + Character("a").asciiValue!)
            } else {
                return Unicode.Scalar(c.asciiValue! + UInt8(n))
            }
        default:
            return " "
    }
}
//
func solution12(_ s:String, _ n:Int) -> String {
    let lower = Array("abcdefghijklmnopqrstuvwxyz")
    let upper = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var arr = Array(s)

for i in 0..<arr.count {
    if lower.contains(arr[i]) {
        let index = (lower.firstIndex(of: arr[i])!+n)%26
        arr[i] = lower[index]
    } else if upper.contains(arr[i]) {
        let index = (upper.firstIndex(of: arr[i])!+n)%26
        arr[i] = upper[index]
    }
}
    return String(arr)
}


//
let asciia = "a".cString(using: .ascii)![0]
let asciiz = "z".cString(using: .ascii)![0]
let asciiA = "A".cString(using: .ascii)![0]
let asciiZ = "Z".cString(using: .ascii)![0]
let alphabatCount: Int = Int(asciiZ-asciiA)

func solution13(_ s:String, _ n:Int) -> String {
    var cstr = s.cString(using: .ascii)!
    cstr = cstr.map { shift($0, n: n) }

    return String(cString: cstr)
}

func shift(_ c: CChar, n: Int) -> CChar {
    if c >= asciia && c <= asciiz {
        let remain = (Int(c - asciia) + n) % (alphabatCount+1)
        return CChar(remain) + asciia
    } else if c >= asciiA && c <= asciiZ {
        let remain = (Int(c - asciiA) + n) % (alphabatCount+1)
        return CChar(remain) + asciiA
    }

    return c
}


//
func solution14(_ s:String, _ n:Int) -> String {

    let answer = String(s.map { (a)  in
        if a != " " {
            if (a.asciiValue! >= 65 && a.asciiValue! <= 90 && (Int(a.asciiValue!) + n) > 90) || (a.asciiValue! >= 97 && a.asciiValue! <= 122 && (Int(a.asciiValue!) + n) > 122)  {
                let b = Character(UnicodeScalar(a.asciiValue! + UInt8(n) - UInt8(26)))
                return b
            }
            let b = Character(UnicodeScalar(a.asciiValue! + UInt8(n)))
            return b
        }
        return " "
    })

    return answer
}


//
func solution15(_ s:String, _ n:Int) -> String {

    return Array(s).map { value in
        if value == " " {
            return " "
        }

        if !value.isLetter {
            return String(value)
        }

        var aVal = value.asciiValue!
        if value.isUppercase {
            if aVal + UInt8(n) > 90 {
                aVal -= 26
            }
        }
        if value.isLowercase {
            if aVal + UInt8(n) > 122 {
                aVal -= 26
            }
        }
        return String(Character(UnicodeScalar(aVal + UInt8(n))))
    }.reduce("") {
        $0 + $1
    }
}

//
func solution16(_ s:String, _ n:Int) -> String {
    var result = ""
    let aScalar = 97
    let AScalar = 65
    let alphaRange = 26

    for ch in s {
        switch ch {
        case " ":
            result += " "
        case "a"..."z":
            let chScalar = ch.unicodeScalars.first!.value
            let newScalar = (Int(chScalar) - aScalar + n) % alphaRange + aScalar
            result += String(UnicodeScalar(newScalar)!)
        case "A"..."Z":
            let chScalar = ch.unicodeScalars.first!.value
            let newScalar = (Int(chScalar) - AScalar + n) % alphaRange + AScalar
            result += String(UnicodeScalar(newScalar)!)
        default:
            continue
        }
    }

    return result
}
