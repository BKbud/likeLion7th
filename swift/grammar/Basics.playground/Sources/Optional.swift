//
//  Optional.swift
//  
//
//  Created by 정보경 on 12/31/24.
//

public func runOptional() {
    
    var dayOfTheWeek: String = "Monday"
    dayOfTheWeek = "Tuesday"
    print(dayOfTheWeek)
    dayOfTheWeek = "Wednesday"
    print(dayOfTheWeek)
    // 기본 타입은 nil을 가질 수 없다.
    //dayOfTheWeek = nil

    var numberOfFingersHeldUpByFinn: Int?
    numberOfFingersHeldUpByFinn = nil

    // nil-coalescing
    print(numberOfFingersHeldUpByFinn ?? "모름")

    // 강제 언래핑 (Unconditional Unwrapping)
//    let lastNumberOfFingersHeldUpByFinn: Int = numberOfFingersHeldUpByFinn!

    // 조건부 언래핑 (Optional binding)
    if let numberOfFingerHeld = numberOfFingersHeldUpByFinn {
        // 값이 nil 이 아니면 실행
        print(numberOfFingerHeld)
    } else {
        
        print("모름")
    }

    guard let numberOfFingerHeld = numberOfFingersHeldUpByFinn else {
        print("모름")
        return
    }
    print(numberOfFingerHeld)
}
