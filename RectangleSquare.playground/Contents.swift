import UIKit
import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

print(a + b)


//플레이그라운드에서는 readLine()입력 불가. macOS버전 프로젝트 생성의 Command Line Tool을 활용. 
