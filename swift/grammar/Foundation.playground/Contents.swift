
import Foundation

// 앱을 만드는데 필요한 기본 기능들(Calendar, TimeZone, Date 등)을 정의해놓은 프레임워크
func howLongUntilHalloween() -> String {
    let calendar = Calendar.current
    let timeZone = TimeZone.current
    
    let now = Date()
    
    let yearOfNextHalloween = calendar.component(.year, from: now)
    
    var components = DateComponents(calendar: calendar, timeZone: timeZone, year: yearOfNextHalloween, month: 10, day: 31, hour: 0, second: 0)
    
    guard var halloween = components.date else {
        print("할로윈 날짜를 가져올 수 없습니다.")
        return ""
    }
    
    if halloween < now { // 올 해 할로윈이 지났다면
        components.year = yearOfNextHalloween + 1 // 다음 해 할로윈으로 변경
        halloween = components.date!
    }
    
    /// DateComponentsFormatter: formats them as a user-readable string.
    let componentFormatter = DateComponentsFormatter() // 날짜 표기 방식을 변경할 수 있는 객체
    componentFormatter.unitsStyle = .full // 날짜 표기 스타일 정의
    componentFormatter.allowedUnits = [.month, .day, .hour, .minute, .second] // 표기할 요소 정의
    
    return componentFormatter.string(from: now, to: halloween)!
}

print("할로윈까지 \(howLongUntilHalloween()) 남았습니다.")
