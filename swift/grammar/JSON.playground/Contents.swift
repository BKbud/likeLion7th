//import PlaygroundSupport
//PlaygroundPage.current.needsIndefiniteExecution = true // 오래 걸리는 일을 기다릴 수 있도록 설정
//
//import Foundation
//
//// 웹페이지에 숨을 불어넣는 json이면 충분.
//let config = URLSessionConfiguration.default
//let session = URLSession(configuration: config)
//
//func fetchRepos(forUsername username: String) -> Void {
//    let urlString = "https://api.github.com/users/\(username)/repos"
//    let url = URL(string: urlString)!
//
//    var request = URLRequest(url: url)
//    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
//
//    let task = session.dataTask(with: request) { data, response, error in
//        defer {
//            PlaygroundPage.current.finishExecution() // playground를 중단하기 위한 코드
//        }
//
//        guard let jsonData = data else {
//            print(error ?? "Network Error")
//            return
//        }
//
//        do {
//            let deserialized = try JSONSerialization.jsonObject(with: jsonData, options: [])
//            print(deserialized)
//        } catch {
//            print(error)
//        }
//    }
//    task.resume()
//}
//
//fetchRepos(forUsername: "apple")
//--------------------------------------
//import Foundation
//import PlaygroundSupport
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//let config = URLSessionConfiguration.default
//let session = URLSession(configuration: config)
//
//func fetchRepos(forUsername username: String) async throws {
//    let urlString = "https://api.github.com/users/\(username)/repos"
//    let url = URL(string: urlString)!
//
//    var request = URLRequest(url: url)
//    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
//
//    do {
//        let (data, _) = try await URLSession.shared.data(for: request)
//        let deserialized = try JSONSerialization.jsonObject(with: data, options: [])
//        print(deserialized)
//    } catch {
//        print(error)
//    }
//}
//
//Task {
//    try await fetchRepos(forUsername: "apple")
//}

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum ResponsError: Error {
    case requestFailed
    case unexpectedResponseStructure
}

func fetchRepos(forUsername username: String,
                completionHandler: @escaping ([[String: Any]]?, ResponsError?) -> Void) async {
    let urlString = "https://api.github.com/users/\(username)/repos"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url)
    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
    //    request.setValue("SwiftPlayground", forHTTPHeaderField: "User-Agent")
    
    do {
        // 비동기 실행 이전
        let (data, _) = try await URLSession.shared.data(for: request)
        // 비동기 실행 이후
        let deserialized = try JSONSerialization.jsonObject(with: data, options: [])
        guard let repos = deserialized as? [[String: Any]] else {
            completionHandler(nil, .unexpectedResponseStructure)
            return
        }
        completionHandler(repos, nil)
    } catch {
        print(error)
        completionHandler(nil, .requestFailed)
    }
}

await fetchRepos(forUsername: "apple") { repos, error in
    if let error {
        print("Error: \(error)")
        return
    }
    print("Repos: \(repos!.count)")
}
