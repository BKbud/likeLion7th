// 오래 걸리는 작업, 비동기 호출을 위해 플레이그라운드 페이지의 무기한 실행을 허용하는 설정
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// 각종 기능 집합, 네트워킹, 날짜, 시간 등 자주 사용되는 기능을 미리 정의해둔 기본 라이브러리
import Foundation
// iOS 운영체제에서 사용되는 UI 구성을 위한 라이브러리
import UIKit

// Session: 완결된 하나의 작업 단위
let config = URLSessionConfiguration.default // Configuration: 기본 설정
// URLSession: An object that coordinates a group of related, network data transfer tasks.
let session = URLSession(configuration: config) // 설정을 적용하여 URLSession 클래스를 생성, 세션 연결

let urlString = "https://imgs.xkcd.com/comics/api.png"
let url = URL(string: urlString)! // url 생성
let request = URLRequest(url: url) // 요청 생성

// dataTask: 함수 요청 시간이 오래걸리므로 요청이 완료된 후 함수를 진행시키기 위해서 콜백 함수 사용.
// 주소를 주면 해당 주소로 요청을 날린다.
let task = session.dataTask(with: request) { data, response, error in
    //요청에 대한 결과 처리
    guard let imageData = data else { return }
    _ = UIImage(data: imageData)
}

task.resume()
