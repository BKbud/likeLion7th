//
//  propertyObserver.swift
//  
//
//  Created by 정보경 on 1/2/25.
//

public func runPropertyObserver() {
    // 변경 상황 추적 observer: willSet, didSet
    class Manager {
        var currentUserName: String = "Emmanuel Goldstein" {
            willSet(newValue) { // 기본 매개변수(newValue)는 생략 가능하다.
                print("Will set \(newValue), old val: \(currentUserName)")
            }
            didSet(oldValue) {
                print("Did set \(oldValue), new val: \(currentUserName)")
            }
        }
        
        var practiceObserver: Int = 100 {
            willSet(myNewVal) {
                print("new value is \(myNewVal), previous value is \(practiceObserver).")
            }
            didSet(myOldValue) {
                print("oldValue \(myOldValue) has been changed to \(practiceObserver).")
            }
        }
        
        init(_ currentUserName: String) {
            self.currentUserName = currentUserName
        }
        
        func changeManage(_ name: String) {
            self.currentUserName = name
        }
    }

    let manager = Manager("new name")
    manager.currentUserName = "Elaine Marley"
    manager.practiceObserver = 50
    print(manager.practiceObserver)

}
