var myProperty: Int = 20{
   didSet(oldVal){
      //myProperty의 값이 변경된 직후에 호출, oldVal은 변경 전 myProperty의 값
   }
   willSet(newVal){
      //myProperty의 값이 변경되기 직전에 호출, newVal은 변경 될 새로운 값
   }
}

var name: String = "Unknown" {
    willSet {
        print("현재 이름 = \(name), 바뀔 이름 = \(newValue)")
    }
    didSet {
        print("현재 이름 = \(name), 바뀌기 전 이름 = \(oldValue)")
    }
}
 
name = "Peter"
// willSet이 먼저 실행됨
// 현재 이름 = Unknown, 바뀔 이름 = Peter
// 현재 이름 = Peter, 바뀌기 전 이름 = Unknown

class UserAccount {
    var username: String
    var password: String
    var loginAttempts: Int = 0 {
        didSet {
            if loginAttempts >= 3 {
                print("로그인 시도가 3회 이상 실패하였습니다. 계정이 잠겼습니다.")
                lockAccount()
            }
        }
    }
    
    var isLocked: Bool = false {
        didSet {
            if isLocked {
                print("계정이 잠겼습니다.")
            } else {
                print("계정이 잠금 해제되었습니다.")
            }
        }
    }
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func login(with enteredPassword: String) {
        if enteredPassword == password {
            print("로그인 성공!")
            loginAttempts = 0 // 로그인 성공 시 로그인 시도 횟수 초기화
        } else {
            print("잘못된 비밀번호입니다.")
            loginAttempts += 1 // 로그인 실패 시 로그인 시도 횟수 증가
        }
    }
    
    private func lockAccount() {
        isLocked = true
    }
    
    func unlockAccount() {
        isLocked = false
    }
}

// 사용자 계정 생성
let user = UserAccount(username: "user123", password: "password123")

// 로그인 시도
user.login(with: "wrongpassword")
// 출력:
// 잘못된 비밀번호입니다.

user.login(with: "wrongpassword")
// 출력:
// 잘못된 비밀번호입니다.

user.login(with: "wrongpassword")
// 출력:
// 잘못된 비밀번호입니다.
// 로그인 시도가 3회 이상 실패하였습니다. 계정이 잠겼습니다.
// 계정이 잠겼습니다.

// 계정 잠금 해제
user.unlockAccount() // 계정이 잠금 해제되었습니다.
