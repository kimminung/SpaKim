//: [Previous](@previous)

import Foundation


struct MovieData: Decodable {
    let movieCd: Int?
    let movieNm: Int?
    let movieNmEn: String?
    let movieNmOg: String?
    let openDt: String
    let prdtStatNm: String
    let typeNm: String
    let genreNm: String
    let directors: String
    let peopleNm: String
    let actors: String
    let showTypes: String
    let showTypeGroupNm: String
    let watchGradeNm: String
    let staffs: String
    
//    enum CodingKeys: String, CodingKey {
//        case movieCd
//        case movieNm
//        case movieNmEn
//        case movieNmOg
//        case openDt
//        case prdtStatNm
//        case typeNm
//        case genreNm
//        case directors
//        case peopleNm
//        case actors
//        case showTypes
//        case showTypeGroupNm
//        case watchGradeNm
//        case staffs
//    }
}


let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)


let url = URL(string: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=9a51098fee3a5f3ee0d7e6cb17074a8c&movieCd=20200202")!

let task = session.dataTask(with: url) { data, response, error in
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
//        print("--> response \(response)")
        return
    }
    
    guard let data = data else {return}
    
    do {
        let decoder = JSONDecoder()
        let profile = try decoder.decode(MovieData.self, from: data)
        print("profile: \(profile)")
    } catch let error  as NSError {
        print("error: \(error)")
    }
    
    
//    let result = String(data:data, encoding: .utf8)
//    print(result)
}

task.resume()

//: [Next](@next)
