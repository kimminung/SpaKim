//: [Previous](@previous)

import Foundation


struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}


let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/kimminung")!
//let url = URL(string: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=9a51098fee3a5f3ee0d7e6cb17074a8c&targetDt=20240422")!

let task = session.dataTask(with: url) { data, response, error in
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print("--> response \(response)")
        return
    }
    
    guard let data = data else {return}
    // data -> GithubProfile
    
    do {
        let decoder = JSONDecoder()
        let profile = try decoder.decode(GithubProfile.self, from: data)
        print("profile: \(profile)")
    } catch let error  as NSError {
        print("error: \(error)")
    }
    
    
//    let result = String(data:data, encoding: .utf8)
//    print(result)
}

task.resume()

//: [Next](@next)
