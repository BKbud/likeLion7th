### ObjectTypes

</br>

**`class` method vs `static` method**: 

둘 다 타입 메서드이지만 `class` 메서드는 는 재정의 가능, `static` 메서드는 불가능

</br>

**computed property (연산 프로퍼티):**

- 초기화 할 때 또는 값에 대한 요청이 있을 때마다 계산된다.
- 다른 "저장 프로퍼티"의 값을 읽어 연산을 실행하거나, 프로퍼티로 전달받은 값을 다른 프로퍼티에 저장할 수 있다.
- 항상 `var`로 선언되어야 한다

</br>

**lazy 키워드:**

클래스 멤버를 멤버 메서드를 사용하여 초기화하고 싶은 경우 lazy 키워드를 사용하여 해당 멤버에 접근할 때 메모리에 할당되도록 초기화를 지연시킬 수 있다.

```swift
lazy var myProperty: String = {
	var result = resourceIntensiveTask()
  result = processData(data: result)
  return result
}()
```

</br>

**불투명 반환 타입:**

- 불투명 반환 타입을 사용하면 지정된 프로토콜을 따르는 모든 타입이 반환될 수 있게 한다. (generic 프로토콜 버전)
- 프로토콜 이름 앞에 `some` 키워드를 붙여 선언된다.
- 구현부는 숨기고 선언부만 드러냄으로써 구제적인 구현은 숨길 수 있다. 즉, 실제 반환 타입이 아니라 반환 타입의 자격에 대해 명시하는 것이다. (강사님은 애플이 공개 API 내에서 사용되는 반환 타입을 숨기기 위해 의도적으로 설계했다고 하심)

```swift
func doubleFunc1(value: Int) -> some Equatable {
	value * 2
}
// doubleFunc1() 함수는 Equatable 프로토콜을 따르는 모든 타입의 결과가 반환된다.
```

ARC(Automatic Reference Counting)
