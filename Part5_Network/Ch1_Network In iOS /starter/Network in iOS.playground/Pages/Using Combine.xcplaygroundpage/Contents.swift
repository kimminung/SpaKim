//: [Previous](@previous)

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case responseError(statusCode: Int)
}

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

final class NetworkService {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }

    func fetchProfile(userName: String) -> AnyPublisher<GithubProfile, Error> {
        let url = URL(string: "https://api.github.com/users/\(userName)")!
        
        //dataTask publisher를 만들 예정.
        let publisher = session
            .dataTaskPublisher(for: url)
        // 받은 Data 디코딩 잘하기
        // 서버에서 받은 response 확인 및 data 확인
            .tryMap { result -> Data in //result = respone, data를 클로저로 줄여 사용중
                guard let httpResponse = result.response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
               }
                return result.data
        }   //decoding을 도와주는 오퍼레이터
            .decode(type: GithubProfile.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        return publisher
    }
}

let networkService = NetworkService(configuration: .default)

let subscription = networkService
    .fetchProfile(userName: "kimminung")
    .receive(on: RunLoop.main)
//    .print()
//    .retry(3)   //실패를 대비해서 3번은 다시 돌려보게끔 하는 코드
    .sink { completion in
        print("completion: \(completion)")
    } receiveValue: { profile in
        print("profile: \(profile)")
    }



//: [Next](@next)



