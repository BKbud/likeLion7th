### Function (함수)

- 함수도 하나의 타입으로 사용되어 변수에 저장할 수 있다.

</br>

**기본값**

```swift
// 함수를 선언할 때 기본값을 넣어줄 수 있다.
func buildMessageFor(_ name: String = "Customer", count: Int) -> String {
    return "\(name), you are customer number \(count)"
}
```

</br>

**가변 매개변수**

- 함수를 호출할 때 매개변수를 여러개 받을 수 있다. 점 세개를 이용하여 가변 매개변수를 선언한다.
- under score를 사용하여 parameter label을 생략할 수 없다.

```swift
func displayStrings(_ strings: String..., counts: Int...) {
    for string in strings { // strings [String]
        print(string)
    }
    print("count: \(counts)")
}

displayStrings("Hello", "World", "Swift", "Programming", counts: 1, 2, 3)
```

</br>

**inout 키워드 (copy in copy out)**

함수가 받는 모든 매개변수는 기본적으로 상수이다. 때문에 함수 내에서 매개변수의 값을 변경하고 싶다면 매개변수의 새로운 복사본을 생성하여 사용한다. 매개변수로 받은 외부 값을 변경하고 싶다면 inout 키워드를 사용한다.

> In-out parameters are passed as follows:
> 1. When the function is called, the value of the argument is copied.
> 2. In the body of the function, the copy is modified.
> 3. When the function returns, the copy’s value is assigned to the original argument.

즉, 함수가 호출되면 inout 키워드가 붇은 인자값이 복사되고, 함수에서 복사본을 수정한 후 함수가 끝나 값을 반환하면 기존 변수에 수정된 값을 할당한다.

예를 들어 observer가 정의된 프로퍼티 값에 inout 매개변수가 사용된다면 함수가 호출될 때 getter가, 값을 반환할 때 setter가 호출된다.

최근에는 피지컬 메모리에 저장된 변수는 call-by-reference 방식으로 동작한다는데, 공식 문서에서는 오류 상황을 만들지 않게 항상 copy-in copy-out 방식으로 동작한다고 생각하고 사용하는 것을 권장한다.

```swift
func doubleValue(_ value: inout Int) /* -> Void */ {
    value *= 2 // value = value * 2
    print(value)
}

var myValue: Int = 10
doubleValue(&myValue)
```

</br>

**후행 클로저**: 

매개변수로 클로저가 제일 마지막에 온다면 함수를 호출할 때 소괄호를 생략할 수 있다.

```swift
let result = performOperation(4, 5, operation: multifly)
// ==
let result = performOperation(4, 5) { $0 * $1 }
```

</br>

**클로저의 변수 캡쳐:**

클로저를 변수에 저장하면 로컬(?)변수를 캡쳐해서 클로저가 소멸될 때 까지 값을 유지할 수 있다.

~~클로저 호출 스콥이 반복될 때마다 스택에 함수가 쌓이는데(콜스택), 아마.. 콜 스택의 시작점에 저장되어 있을 것이다.~~

```swift
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    return incrementer
}

let incrementByTen = makeIncrementer(incrementAmount: 10)
print(incrementByTen()) // 10
print(incrementByTen()) // 20
print(incrementByTen()) // 30
```
