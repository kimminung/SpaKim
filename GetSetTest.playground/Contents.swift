import Cocoa

var x = 10
var y = 20
var z = 0

var sum : Int {
    get {
        return x + y
    }
    set {
        z = x + y + 100
    }
}

print(sum)

print(sum = 20)
print(sum)
print(type(of: sum))
