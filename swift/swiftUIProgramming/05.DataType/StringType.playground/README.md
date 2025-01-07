### String(문자열) **Type**

```swift
let string: String = "string"

string.count
string.isEmpty
string.uppercased()
string.lowercased()
string.prefix(3) // str
string.suffix(3) // ing
string.hasPrefix("str") // true
string.hasSuffix("ine") // false
```

</br>

**String.Index Type**

string의 index는 String.Index라는 타입으로 되어있어 정수로 문자열 인덱스에 접근할 수 없다.

```swift
let firstIndex = greeting.startIndex
let lastIndex = greeting.index(before: greeting.endIndex)

// 문자열 슬라이싱
let range = greeting.index(firstIndex, offsetBy: 1)..<greeting.index(lastIndex, offsetBy: -1)
print(greeting[range])
```
</br>

**Tuple Type**

```swift
let myTuple = (count: 10, length: 432.433, message: "This is a String")
print(myTuple.2) //432.433
print(myTuple.message) // This is a String
```
