
// 흐름 제어 코드 (꼭 에러가 발생하는 경우가 아니라고 예외 처리에 활용할 수도 있다는 의미)
enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}

func transferFile() throws { // 예외를 던지는 함수라는 것을 알 수 있다.
    let connectionOK = true
    let connectionSpeed: Int = 20
    let fileFound: Bool = true
    
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
    
    // 파일 전송 로직...
}

do {
    try transferFile()
} catch FileTransferError.noConnection {
    
} catch { return }
