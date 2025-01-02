//
//  Function.swift
//  
//
//  Created by 정보경 on 12/31/24.
//


/// Editor, structure, add document or opt + cmd + /  -> description 작성. 함수에 대한 설명을 추가합니다.
/// - giveName: 이름
/// - middleName: 중간 이름
/// - lastName: 성
public func runFunction() {
    // 함수를 선언할 때 매개변수의 기본값을 줄 수 있다.
    func fullName(giveName: String,
                  middleName: String? = nil,
                  lastName familyName: String) -> String {
        var fullName = familyName
        if let middleName { fullName += " \(middleName)"}
        fullName += " \(giveName)"
        return fullName
    }

    let myFullName = fullName(giveName: "bokyeong", lastName: "jeong")
    print(myFullName)
    let myFullName2 = fullName(giveName: "AAA", middleName: "BBB", lastName: "CCC")
    print(myFullName2)

    // _: 매개변수 레이블을 가릴 수 있다.
    func combine(_ string1: String, _ string2: String) -> String {
        return "\(string1) \(string2)"
    }

    func combine(_ int1: Int, _ int2: Int) -> Int {
        return int1 + int2
    }

    let combineString = combine("Hello", "World")
    print(combineString)

    let combineInt = combine(1, 2)
    print(combineInt)

}
