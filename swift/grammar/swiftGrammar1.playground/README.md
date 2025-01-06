# swift 문법

### 타입 추론 (Type inference)

> Swift type inference is a compile-time process where the Swift compiler deduces the type of a variable, constant, or expression automatically when it's declared, but the type is not explicitly specified.
> 

타입을 명시하지 않아도 컴파일 타임에 swift 컴파일러가 타입을 자동으로 지정해주는 것

</br>

### 문자열 보간법 (String interpolation)

문자열 리터럴(아래 예시의 `name` 변수)을 자리 표시자(`\()`) 위치로 대체하는 프로세스

```swift
var name: String = "BoKyeong"
print("Hello \(name)!")
```

</br>

---

### Parameter label

함수를 호출할 때 즉, 전달 인자를 작성할 때 주어지는 힌트

```swift
func function(parameterLabel parameter: Int) { ... }

function(parameterLabel: 10)
```

같은 이름에 같은 매개변수 타입의 함수 구조를 가지더라도, 매개변수 레이블이 다르다면 다른 함수로 인식된다. 

**_ (underscore)**: 매개변수 레이블 자리에 _ 기호를 사용하면 함수 호출 시 라벨이 생략된다. 암묵적인 규칙이 정해져있거나 매개변수 레이블이 불필요할 경우, 프레임워크 제작 등 함수의 레이블을 가리고 싶은 경우에 사용한다.

```swift
// _: 매개변수 레이블을 가릴 수 있다.
func combine(_ string1: String, _ string2: String) -> String {
    return "\(string1) \(string2)"
}
```

</br>

## 배열 (Array)

> An *array* stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.
> 

```swift
// initialization
var arrInit: Array<String> = Array()
var arrInit2: [String] = []

var arrInitWithSameVal: Array<String>(repeating: "number: ", count: 3)

//append
arrInit.append("1")
arrInit.append(["2", "3", "4"])
arrInit += "5"

//insert
arrInit.insert("3.5", at: 3)

//remove
arrInit.remove(at: 3)
```
