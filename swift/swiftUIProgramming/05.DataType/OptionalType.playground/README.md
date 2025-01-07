### Optional **Type**

> Generic Enumeration
A type that represents either a wrapped value or nil, the absence of a value
> 

nil값을 갖는 Generic Enum 타입

```swift
var index: Int?

// 강제 언래핑
let unwrappedIndex = index!

// optional binding: 임시 변수나 상수에 할당하여 축약할 수 있다.
if let index {
    print(treeArray[index])
}
```

</br>

- type casting
    
    ```swift
    // upcasting
    // UIView -> UIControl -> UIButton 순으로 상속 관계
    let value = myDictionary["Swift"] as! Int
    print(value)
    
    // downcasting
    // UIScrollView ->  UITextView
    let myScrollView: UIScrollView = UIScrollView()
    //let myTextView = myScrollView as! UITextView // 강제 타입 캐스팅
    ```
    
    - **upcasting**:
        
        특정 클래스의 객체가 상위 클래스들 중의 하나로 변형되는 것. as 키워드를 사용한다. 이러한 변환은 컴파일러가 성공 여부를 알려줄 수 있어 ‘보장된 변환’이라고도 한다.
        
    - **downcasting**:
        
        어떤 클래스에서 다른 클래스로 만드는 변환이 일어날 때 발생하는 캐스팅. as! 키워드를 사용한다. 변환이 안전하게 수행된다거나 유효하지 않은 변환 시도를 컴파일러가 잡아낸다는 보장이 없어 에러가 발생할 수 있다.
        
    - **as? 키워드를 사용한 옵셔널 바인딩 방법**:
        
        ```swift
        if let myTextView = myScrollView as? UITextView {
        	print("Type cast to UITextView succeeded")
        } else {
        	print("Type cast to UITextView failed")
        }
        ```
        
- **Range Type**
    
    ```swift
    let closedRange = 1...5
    let range = 0..<5
    let partiaRangeForm = 0...
    let partiaRangeThrough = ...5
    let partialRangeUpTo = ..<5
    ```
