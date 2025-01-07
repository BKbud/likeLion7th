### ControlFlow

**repeat-while loop**

```swift
// repeat while -> 범위 코드를 우선 실행한 후 조건을 만족하는지 확인한다.
repeat {
    count += 1
} while count < 10
```

</br>

**continue:**

반복문의 나머지 코드를 건너뛰고 반복문의 처음으로 다시 돌아가게 한다.

</br>

**guard 구문:**

표현식이 false일 때 수행될 else 절을 반드시 포함해야 한다. else 절의 코드는 반드시 현재의 코드 흐름에서 빠져나가는 구문(ex. return, break, continue, throw …)을 포함해야 한다. 

```swift
func multiplyByTen(value: Int?) {
    guard let number = value, number < 10 else {
        print("Number is too high")
        return
    }
    let result = number * 10
    print(result)
}
```

</br>

**switch 구문:**

- 제한된 개수나 범위의 조건을 검사할 때 적절하다.
- where 구문을 사용하여 부가적인 조건을 추가할 수 있다.
- swift의 switch는 case 조건에 일치하면 자동으로 구문 밖으로 빠져나가므로 break를 걸 필요가 없다.
- 실행 흐름이 그 다음의 case 구문으로 계속 진행하게 하려면 `fallthrough` 구문을 사용한다.

```swift
switch temperature {
case 0...49 where temperature % 2 == 0:
    print("Cold and even")
    fallthrough
case 50...79 where temperature % 2 == 0:
    print("Warm and even")
    fallthrough
case 80...110 where temperature % 2 == 0:
    print("Hot and even")
    fallthrough
default:
    print("Temperature out of range or odd")
    break
}
```
