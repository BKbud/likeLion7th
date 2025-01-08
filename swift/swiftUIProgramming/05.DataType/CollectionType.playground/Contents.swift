
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

// Dictionary 사전형
var bookDict1 : [String: String] = [
    "100-432112": "Wind in the Willows",
    "200-532874": "Tale of Two Cities",
    "202-546549": "Sense and Sensibility",
    "104-109834": "Shutter Island"
]

var myDictionary = [Int: String]()

let keys = ["100-432112", "200-532874", "202-546549", "104-109834"]
let values = ["Wind in the Willows", "Tale of Two Cities", "Sense and Sensibility", "Shutter Island"]

// zip을 사용한다고 해서
var bookDict = Dictionary(uniqueKeysWithValues: zip(keys, values))
print(bookDict.count)
print(bookDict["200-532874"] ?? "Book not found") //dictionary value는 옵셔널 타입을 갖는다. 따라서 값을 사용할 떄 항상 unwrapping을 해주어야 한다.

bookDict.updateValue("The Ruins", forKey: "200-532874")

bookDict["300-898871"] = "The Overlook"

bookDict["300-898871"] = nil // 값 제거
bookDict.removeValue(forKey: "300-898871")

for (key, value) in bookDict {
    print("key: \(key), value: \(value)")
}
