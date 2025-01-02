//
//  Protocol.swift
//  
//
//  Created by 정보경 on 1/2/25.
//
import Foundation

public func runProtocol() {
    // 특정 메서드를 가지도록 강요할 수 있다. 프레임워크처럼 구조에 대한 규약을 제공한다.
    protocol Describable {
        var description: String { get }
    }
    
    struct Person: Describable {
        let name: String
        let age: Int
        
        var description: String {
            return "Person: \(name), \(age)"
        }
    }
    
    let person: Person = Person(name: "Bokyeong", age: 24)
    print(person.description)
    
    protocol Movable {
        func move(to point: CGPoint)
    }
    
    class Car: Movable {
        var position: CGPoint = CGPoint(x: 0, y: 0)
        
        func move(to point: CGPoint) {
            self.position = point
            print("Car moved to \(point)")
        }
    }
    
    let car = Car()
    car.move(to: CGPoint(x: 10, y: 20))
    print(car.position)
    
    protocol Named {
        init(name: String)
        
        func displayName() -> String
    }
    
    // 클래스, 구조체에 대한 확장 기능을 제공한다.
    extension Named {
        func printDescription() {
            print(displayName())
        }
    }
    
    extension String {
        func makeUpperCase() -> String {
            return uppercased()
        }
    }
    
    // required가 필요한 이유?
    // 상속 구조 때문. 프로토콜을 계승받는 클래스를 상속받는 경우 자식 클래스도 프로토콜 규약 속성을 가지도록 강제할 수 있다.
    // 자식 클래스에서도 프로토콜 규약을 지켜야 한다.
    // 생성자의 경우에만 한함.
    class Person2: Named {
        func displayName() -> String {
            return "Person2: \(name)"
        }
        
        let name: String
        
        required init(name: String) {
            self.name = name
        }
    }
    
    class Friend: Person2 {
        
        required init(name: String) {
            fatalError("init(name:) has not been implemented")
        }
        
        
        let age: Int
        
    }
    
    struct Point: Named {
        func displayName() -> String {
            return "Point: \(name)"
        }
        
        let name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    let person3 = Person2(name: "BK")
    person3.printDescription()
    
    print("car".makeUpperCase())
    
    
    // 프로토콜 합성
    protocol Payable {
        func calculateWages() -> Double
    }

    protocol TimeOffRequestable {
        func requestTimeOff(days: Int) -> Bool
    }

    func processEmployee(employee: Payable & TimeOffRequestable) {
        let wages = employee.calculateWages()
        let timeOffRequested = employee.requestTimeOff(days: 10)
    }
    //---

    // associatedtype: 계승받은 클래스에서 typealias로 마치 대문자처럼 타입을 지정해서 사용할 수 있다.
    protocol Container {
        associatedtype Item
        mutating func add(_ item: Item)
        var count: Int { get }
    }

    struct IntStack: Container {
        typealias Item = Int
        private var items: [Int] = []
        
        mutating func add(_ item: Int) { items.append(item) }
        var count: Int { items.count }
    }
    //---

    // generic: 타입을 받을 때 특정 프로토콜을 계승하는 타입만을 인자로 사용할 수 있도록 범위를 지정해줄 수 있다.
    protocol Describable {
        var description: String { get }
    }

    func printDescription<T: Describable>(_ item: T) {
        print(item.description)
    }

    //--- 프로토콜 합성
    protocol Runnable {
        func run()
    }
    protocol Swimmable {
        func swim()
    }
    protocol Flyable {
        func fly()
    }
    struct Bird: Flyable, Runnable {
        func fly() { print("Flying") }
        func run() { print("Running") }
    }
    struct Fish: Swimmable {
        func swim() { print("Swimming") }
    }
    struct Duck: Flyable, Runnable, Swimmable {
        func fly() { print("Flying") }
        func run() { print("Running") }
        func swim() { print("Swimming") }
    }
    let duck = Duck()
    duck.fly()
    duck.run()
    duck.swim()


}
