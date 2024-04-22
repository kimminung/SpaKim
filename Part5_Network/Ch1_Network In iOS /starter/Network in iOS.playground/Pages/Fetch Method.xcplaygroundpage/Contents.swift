//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
  case invalidRequest
  case transportError(Error)
  case responseError(statusCode: Int)
  case noData
  case decodingError(Error)
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

// network 담당 NetworkService.. page도 뷰 담당 서비스를 만들듯
final class NetworkService {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    
    
    /*
     //Resule<>은 하나의 enum타입과 같은 역할
     @frozen public enum Result<Success, Failure> where Failure : Error {

         /// A success, storing a `Success` value.
         case success(Success)

         /// A failure, storing a `Failure` value.
         case failure(Failure)
     */
    func fetchProfile(userName: String, completion: @escaping (Result<GithubProfile, Error>) -> Void) {
        let url = URL(string: "https://api.github.com/users/\(userName)")!

        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.transportError(error)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200..<300).contains(httpResponse.statusCode) {
                completion(.failure(NetworkError.responseError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let profile = try decoder.decode(GithubProfile.self, from: data)
                completion(.success(profile))
            } catch let error  as NSError {
                completion(.failure(NetworkError.decodingError(error)))
            }
        }
        task.resume()
    }
}

// network 담당 NetworkService
// NetworkService 이용한 네트워크 작업

let networkService = NetworkService(configuration: .default)

networkService.fetchProfile(userName: "kimminung") { result in   //fetch된 파일은 비동기로.. result는 enum
    switch result {
    case .success(let profile):
        print("Profile: \(profile)")
    case .failure(let error):
        print("Error: \(error)")
    }
}



//: [Next](@next)
