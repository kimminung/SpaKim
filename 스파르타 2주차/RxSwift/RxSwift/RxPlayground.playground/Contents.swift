// swift 예시
import Foundation
import RxSwift
import RxCocoa

class DataModel {
    var textValue: String = ""

    func updateText(to newValue: String) {
        textValue = newValue
        print("Value updated: \(textValue)")
    }
}

let dataModel = DataModel()

dataModel.updateText(to: "Hello, Swift!")
dataModel.updateText(to: "Another value")

// swift의 didset을 이용한 예시
class DataModel1 {
    var textValue: String = "" {
        didSet {
            print("Value updated: \(textValue)")
        }
    }
}

let dataModel1 = DataModel1()

func changeText(to newValue: String) {
    dataModel1.textValue = newValue
}

changeText(to: "Hello, Swift!")
changeText(to: "Another value")

// RxSwift의 예시
class DataModel2 {
    
    let textValueSubject = BehaviorSubject<String>(value: "")
    
    var textValue: Observable<String> {
        return textValueSubject.asObservable()
    }
}

let dataModel2 = DataModel2()

let disposable = dataModel2.textValue.subscribe(onNext: { newValue in
    print("Value changed to: \(newValue)")
})

dataModel2.textValueSubject.onNext("Hello, RxSwift!")
dataModel2.textValueSubject.onNext("Another value")
