/*:
 ## 3 Bit wise 연산자
 */
// 이진수에 대한 상수 정의
let zero: Int = 0b000
let one: Int = 0b001
let two: Int = 0b010
let three: Int = 0b011
let four: Int = 0b100
let five: Int = 0b101
let six: Int = 0b110
let seven: Int = 0b111

// 다른 비트 값을 이용해 옵션을 생성
//let phone: Int        = 0b00000001
//let tablet: Int       = 0b00000010
//let watch: Int        = 0b00000100
//let laptop: Int       = 0b00001000
//let desktop: Int      = 0b00010000
//let tv: Int           = 0b00100000
//let brainImplant: Int = 0b01000000

let phone: Int = 1 << 0
let tablet: Int = 1 << 1
let watch: Int = 1 << 2
let laptop: Int = 1 << 3
let desktop: Int = 1 << 4
let tv: Int = 1 << 5
let brainImplant: Int = 1 << 6

//var supportedDevices: Int = phone + tablet + tv

//   0 0 0 1 0 0 1 1 = supportedDevices
// & 0 0 0 0 0 0 1 0 = tablet (device)
// ------------------
//   0 0 0 0 0 0 1 0 = device

//@MainActor
//func isSupported(device: Int) -> Bool {
//    let bitwiseAnd: Int = supportedDevices & device
//    let containsDevice = bitwiseAnd == device
//    return containsDevice
//}


// phone + tablet + tv calculation:
//   0 0 0 0 0 0 0 1 = phone
// + 0 0 0 0 0 0 1 0 = tablet
// + 0 0 0 0 0 1 0 0 = tv
// ------------------
//   0 0 0 0 0 1 1 1 = deviceThatSupportUIKit
let deviceThatSupportUIKit = phone + tablet + tv

// desktop + tv calculation:
//   0 0 0 0 1 0 0 0 = desktop
// + 0 0 0 0 0 1 0 0 = tv
// ------------------
//   0 0 0 0 1 1 0 0 = statinaryDevice
let statinaryDevice = desktop + tv

// deviceThatSupportUIKit | statinaryDevice calculation:
//   0 0 0 0 0 1 1 1 = deviceThatSupportUIKit
// | 0 0 0 0 1 1 0 0 = statinaryDevice
// ------------------
//   0 0 0 0 1 1 1 1 = stationaryOrUIKitDevices
//let stationaryOrUIKitDevices = deviceThatSupportUIKit | statinaryDevice

// Verification of union operation:
//   0 0 0 0 1 1 1 1 = stationaryOrUIKietDevices
// = 0 0 0 0 1 1 1 1 = (phone + tablet + tv + desktop)
// ------------------
//   true              = orIsUnion
//let orIsUnion = stationaryOrUIKitDevices == (phone + tablet + tv + desktop)
//print(orIsUnion)

/// OptionSet: Adopting this protocol in your custom types lets you perform set-related operations such as membership tests, unions, and intersections on those types.
/// 비트의 집합으로 Set의 특징을 가진 자료구조. 집합 연산, 포함 여부 등을 확인하는 식으로 사용할 수 있다.
struct Devices: OptionSet {
    var rawValue: Int
    
    static let phone = Devices(rawValue: 1 << 0)
    static let tablet = Devices(rawValue: 1 << 1)
    static let watch = Devices(rawValue: 1 << 2)
    static let laptop = Devices(rawValue: 1 << 3)
    static let desktop = Devices(rawValue: 1 << 4)
    static let tv = Devices(rawValue: 1 << 5)
    static let brainImplant = Devices(rawValue: 1 << 6)
    
    static let none: Devices = []
    static let all: Devices = [.phone, .tablet, .watch, .laptop, .desktop, .tv, .brainImplant]
    static let stationary: Devices = [.desktop, .tv]
    static let supportsUIKit: Devices = [.phone, .tablet, .tv]
}

let supportedDevices: Devices = [.phone, .tablet, .watch, .tv]

// 포함 여부를 확인할 수 있다.
let phoneIsSupported = supportedDevices.contains(.phone)

// Union / OR (합집합)
let stationaryOrUIKitDevices = Devices.supportsUIKit.union(Devices.stationary)

// Intersection / AND (교집합)
let stationaryAndUIKitDevices = Devices.supportsUIKit.intersection(Devices.stationary)

/*:
## 사용자 정의 연산자
 연산자를 커스텀하여 원하는 동작을 하도록 만들 수 있다.
 */
infix operator >>>

func >>> (lhs: String, rhs: String) -> String {
    var combined = rhs
    combined.append(lhs)
    return combined
}

//func >>> (lhs: String, rhs: [String]) -> [String] {
//    var combined = rhs
//    combined.append(lhs)
//    return combined
//}
//
//func >>> (lhs: [String], rhs: [String]) -> [String] {
//    var combined = rhs
//    combined.append(contentsOf: lhs)
//    return combined
//}

// Generic을 활용한 커스텀 연산자
func >>> <Element>(lhs: Element, rhs: Array<Element>) -> Array<Element>  {
    var combined = rhs
    combined.append(lhs)
    return combined
}

func >>> <Element>(lhs: Array<Element>, rhs: Array<Element>) -> Array<Element> {
    var combined = rhs
    combined.append(contentsOf: lhs)
    return combined
}

let appendedString = "Two" >>> "One"
print(appendedString)

let appendStrArr = "Three" >>> ["One", "Two"]
print(appendStrArr)

let appendArrArr = ["Three", "Four"] >>> ["One", "Two"]
print(appendStrArr)

let appendIntToArray = 1 >>> [3, 4]
print(appendIntToArray)
