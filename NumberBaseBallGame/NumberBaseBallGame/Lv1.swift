import Foundation

class Lv1 {
    let n : Int
    init(n: Int) {
        self.n = n
    }
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        print("정답은 \(answer)입니다.")
    }
    
    func makeAnswer() -> String {
        // 함수 내부를 구현하기
        var result = ""
        
        for _ in 1...3 {
            result += "\(Int.random(in: 1...9))"
        }
        
        return result
    }
    
    
    
    /*
     1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
     
     정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
     */
/*
    func examLv1() -> [Int]{
//        var arr = (1...9).map { $0 * 2 }
        var arr = (1...9).map { $0 }
//        arr.randomElement()
//        let a = arr.shuffle()   //arr을 섞고 보여줌
        let shuffledArray = arr.shuffled()  //arr은 섞지 않고 새로 담아줌
        print("arr:", arr)
        print("ed:", arr.shuffled())
        
        print(shuffledArray[0...2])
//        return shuffledArray[0...2] //Cannot convert return expression of type 'Array<Int>.SubSequence' (aka 'ArraySlice<Int>') to return type '[Int]'
        return [Int](shuffledArray[0...2]) //type conversion
        
        var arr2 = (1..<9).map { number in
            return number * 2
        }
        
        print(arr2)
    }*/
        
}

