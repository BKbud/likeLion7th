**let vs var**

let: 스택 메모리에서 관리됨. 빠르고 효율적이다.

var: 힙 메모리에서 관리됨. 비교적 느리다.

</br>

### **Integer Type:**

MSB(Most Significant Bit): 최상위 비트. 0이면 양수, 1이면 음수.

</br>

정수 리터럴

```swift
let decimalInteger = 17
let binaryInteger = 0b10111 // 2진수
let octalInteger = 0o777 // 8진수
let hexInteger = 0xFF //16진수
```

숫자 구분자 (Swift 5.1 이후)

```swift
// 숫자 구분자 (Swift 5.1 이후)
let largeNumber = 1_000_000_000
print(largeNumber)
```

---
