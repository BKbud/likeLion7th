// 8bit 크기의 부호 있는 정수형
// 1 0 0 0 0 0 0 0 = -128
// 0 1 1 1 1 1 1 1 = 127
let minInt8 = Int8.min
let maxInt8 = Int8.max

print("Int8 min: \(minInt8), max: \(maxInt8)")

// 8bit 크기의 부호 없는 정수형
// 0 0 0 0 0 0 0 0 = 0
// 1 1 1 1 1 1 1 1 = 255
let minUInt8 = UInt8.min
let maxUInt8 = UInt8.max

print("UInt8 min: \(minUInt8), UInt8 max: \(maxUInt8)")

// 정수 리터럴
let decimalInteger = 17
let binaryInteger = 0b10111 // 2진수
let octalInteger = 0o777 // 8진수
let hexInteger = 0xFF //16진수

print("decimalInteger: \(decimalInteger), binaryInteger: \(binaryInteger), octalInteger: \(octalInteger), hexInteger: \(hexInteger)")

// 숫자 구분자 (Swift 5.1 이후)
let largeNumber = 1_000_000_000
print(largeNumber)
