import UIKit

func solution(_ a: Int, _ b: Int )-> String{
    let year = 2016
    guard year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) else {return ""}
    let dateComponents = DateComponents(year:year, month: a, day: b)
    let date = Calendar.current.date(from: dateComponents)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE"
    let weekDay = dateFormatter.string(from: date!)
    return weekDay.uppercased()
}

solution(5, 24)
    
    let now = Date()
let dateComponents = DateComponents(year: 2016, month: 5, day: 25)
//    let calendar = Calendar.current
    let calendar = Calendar(identifier: .gregorian)
//    return calendar.component(.year, from: now)
calendar.dateComponents([.year, .month, .day, .weekday], from: now )
Calendar.current.date(from: dateComponents)


func getTodayWeekDay()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.string(from: Date())
        return weekDay
  }

getTodayWeekDay()

func getTodayWeekDay2()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        let weekDay = dateFormatter.string(from: Date())
        return weekDay
  }
getTodayWeekDay2()





func solution1(_ a:Int, _ b:Int) -> String {

    let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let totalDay = monthDay[0..<a-1].reduce(0, +) + b

    return w[totalDay % 7]
}

func solution2(_ a:Int, _ b:Int) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    let date = dateFormatterGet.date(from:"2016-\(a)-\(b)")
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat  = "EE"//"EE" to get short style
    return dateFormatter.string(from:date!).uppercased()
}

func solution3(_ a:Int, _ b:Int) -> String {

    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyyMMdd"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "EEE"

    let str = "2016" + String(format: "%02i", a) + String(format: "%02i", b)

    let date = dateFormatterGet.date(from: str)
    return dateFormatterPrint.string(from: date!).uppercased()
}

func solution4(_ a:Int, _ b:Int) -> String {

    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "EEE"

    let date = dateFormatterGet.date(from: "2016-\(a)-\(b)")
    return dateFormatterPrint.string(from: date!).uppercased()
}


func solution5(_ a:Int, _ b:Int) -> String {
    //원하는 날짜 설정
    var date = DateComponents()
    date.year = 2016
    date.month = a
    date.day = b

    // DateFormatter를 통해 출력하는 방식을 설정
    // "EE" -> Weekday with Three characters only (eg: MON, TUE...)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EE"

    //날짜를 현재 Calendar에 맞는 형식으로 설정 후 계산
    let dates = Calendar.current.date(from:date)!
    let weekdayString = dateFormatter.string(from: dates)

    return weekdayString.uppercased()
}

func solution6(_ a:Int, _ b:Int) -> String {
    let date = Calendar.current.date(from: DateComponents(year:2016, month: a, day: b))
    let formatter = DateFormatter()
    formatter.dateFormat = "EE"
    return formatter.string(from: date!).uppercased()
}
