// swift 예시
import Foundation
import Combine

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

// didset을 이용한 예시
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

// combine 예시
class DataModel2 {
    @Published var textValue: String = ""
}

let dataModel2 = DataModel2()

let cancellable = dataModel2.$textValue.sink { newValue in
    print("Value changed to: \(newValue)")
}

dataModel2.textValue = "Hello, Combine!"
dataModel2.textValue = "Another value"
