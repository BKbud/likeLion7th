/*:
 ## Nested type (중첩 타입)
 열거형, 구조체, 프로토콜과 같은 타입을 중첩할 수 있다.
 */

class Device {
    enum Category {
        case watch
        case phone
        case tablet
    }

    enum Orientation {
        case portrait
        case portraitUpsideDown
        case landscapeLeft
        case landscapeRight
    }
    
    let category: Category
    let orientation: Orientation = .portrait
    
    init(category: Category) {
        self.category = category
    }
}

let device = Device(category: .phone)
let desiredOrientation: Device.Orientation  = .portrait
let phoneHasDesiredOrientation: Bool = device.orientation == desiredOrientation

struct UserInterface {
    struct Version {
        let major: Int
        let minor: Int
        let patch: Int
    }
    
    enum Orientation {
        case portrait
        case landscape
    }
    
    let version: Version
    let orientation: Orientation
}

func uiOrientation(for deviceOrientation: Device.Orientation) -> UserInterface.Orientation {
    switch deviceOrientation {
    case .portrait, .portraitUpsideDown:
        return .portrait
    case .landscapeLeft, .landscapeRight:
        return .landscape
    }
}
