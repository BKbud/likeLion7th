
var myArr = Array<String>()
var myArr2: [String] = ["E", "E"]

// 값 추가
myArr.append("A")
myArr.append(contentsOf: ["C", "D"])

// 삽입
myArr.insert("B", at: 1)
myArr += myArr2
myArr.insert(contentsOf: ["F", "G"] , at: myArr.endIndex)

// 삭제
myArr.remove(at: 2)
myArr.removeAll(where: {$0 == "E"})

if myArr.isEmpty { print("it's Empty Array") }

let lastItem = myArr.removeLast()
print(lastItem)

myArr.forEach{ print($0) }

for item in myArr {
    print(item)
}

// map: 반환값이 있는 forEach
let lowercasedArr = myArr.map { $0.lowercased() }
print(myArr)

print(lowercasedArr)


let mixedArray: [Any] = ["A String", 432, 34.989]

for object in mixedArray {
    if let intValue = object as? Int {
        print(intValue)
    } else if let doubleValue = object as? Double {
        print(doubleValue)
    } else if let stringValue = object as? String {
        print(stringValue)
    }
}
