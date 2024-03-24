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

let url = URL(string: "https://api.github.com/users/cafielo")!

let task  = session.dataTask(with: url) { data, response, err in
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print("--> response \(response)")
        return
    }
    
    guard let data = data else { return }
    
    do {
        let decoder = JSONDecoder()
        let profile = try decoder.decode(GithubProfile.self, from: data)
        print(profile)
    } catch let error as NSError{
        print("error: \(error)")
    }
}
    
task.resume() // 태스크 시작

// App Model  -> JSON  (인코딩)
// App Model  <- JSON  (디코딩) (지금 예제)



//: [Next](@next)
