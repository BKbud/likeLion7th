//
//  TimerData.swift
//  ObservableDemo
//
//  Created by 정보경 on 1/13/25.
//

import Foundation

@Observable
class TimerData {
    // Published 프로퍼티 래퍼를 사용하면 프로젝트 내에 있는 뷰에서 관찰될 수 있다.
    // 최신버전에서는 @Observable 어노테이션을 사용하면 됨.
    var timeCount = 0
    
    var timer: Timer?
    
    init() {
        // 특정 시간 간격으로 timeDidFire() 함수를 실행시킴
        // [weak self]는 변수 캡쳐 시 ARC 카운트가 증가하지 않도록 해서 메모리 누수를 막는다.
        // -> self를 캡쳐링 하는 상황에서 self에 대한 순환참조가 발생하지 않기 위해 weak self를 사용한다.
        // [unowned self]는 강제 언래핑된 self 키워드, 조심해서 사용해야함. 대신 성능이 (아주 조금 더)좋음.
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            self?.timerDidFire()
        })
    }
    
    func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}
