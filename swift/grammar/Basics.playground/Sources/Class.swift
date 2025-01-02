//
//  Class.swift
//
//
//  Created by 정보경 on 12/31/24.
//


/// 클래스를 사용하는 경우:
/// - 참조가 필요할 때
/// - 상속이 필요할 때
/// - 인스턴스의 identity를 제어해야 할 때
class Person {
    let givenName: String
    let middleName: String?
    let familyName: String
    var country: String = "KR"
    
    init(givenName: String, middleName: String? = nil, familyName: String) {
        self.givenName = givenName
        self.middleName = middleName
        self.familyName = familyName
    }
    
    var displayName: String {
        return "\(fullName()) - Location: \(country)"
    }
    
    func fullName() -> String {
        var fullName: String = ""
        if let middleName { fullName += middleName + " " }
        fullName += givenName + " " + familyName
        return fullName
    }
    
    static func createDummyPerson() -> Person {
        return Person(givenName: "John", familyName: "Doe")
    }
}

public func runClass() {
    let person = Person.createDummyPerson()
    print(person.fullName())
    let person2 = Person(givenName: "Jane", familyName: "Doe")
    print(person2.fullName())
    let person3 = Person.createDummyPerson()
    person3.country = "US"
    print(person3.displayName)
    print(person.displayName)
}

//let person = Person(givenName: "Jungman", familyName: "Bae")
//
//// 클래스의 복사는 주소의 복사, 같은 주소를 바라보게 됨. 변경시 같이 변경
//let person2 = person
//person2.givenName = "Jungman2"
//print(person.givenName)
//print(person2.givenName)
//// ObjectIdentifier 비교
//print(person === person2)
//
//// 구조체의 복사는 값의 복사, 다른 위치에 동일한 값을 저장함
//let point = Point(x: 10, y: 20)
//var point2 = point
//point2.x = 30
//print(point.x)
//print(point2.x)
//// print(point === point2) 구조체는 객체 비교 불가
