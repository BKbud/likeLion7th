//
//  Struct.swift
//  
//
//  Created by 정보경 on 12/31/24.
//
import Foundation
/// 구조체를 사용하는 경우
/// - 간단한 값을 캡슐화 할 때
/// - 복사본이 원본과 독립적이어야 할 때
/// - 상속이 불가능할 때
struct Point {
    var x: Int
    var y: Int
    
    func distanceFromOrigin() -> Double {
        return sqrt(Double(x * x + y * y))
    }
    // 값타입은 기본적으로 내부에서 인스턴스 메서드를 통해 값을 변경할 수 없다.
    // mutating 키워드를 명시하여 값을 변경할 수 있다.
    mutating func moveBy(x deltaX: Int, y deltaY: Int) {
        self.x += deltaX
        self.y += deltaY
    }
}

struct Circle {
    var radius: Double
    
    //computed property
    var area: Double {
        return radius * radius * Double.pi
    }
    
    func areaFunction() -> Double {
        return radius * radius * Double.pi
    }
}

public func runStruct() {
    var point = Point(x: 1, y: 2)

    print("\(point.x) \(point.y)")
    print(point.distanceFromOrigin())

    point.moveBy(x: 2, y: 3)
    print(point.distanceFromOrigin())
}

