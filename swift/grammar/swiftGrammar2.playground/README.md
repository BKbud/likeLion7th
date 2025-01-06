# swift 문법 2

</br>

## Optional

> **A type that represents either a wrapped value or the absence of a value.**
> 

```swift
let longForm: Optional<Int> = Int("42")
let shortForm: Int? = Int("42")
```

위와 같이 타입 뒤에 물음표를 붙여 optional 타입으로 지정할 수 있다. 해당 타입은 wrapping value와 ‘값이 없음’을 뜻하는 nil값을 가질 수 있다.

값이 없는 null에 의해 많은 문제가 발생하자 swift는 기본적인 타입들이 null을 가지는게 아닌 특정 타입만이 null을 가지도록 하여 안정성을 높였다. 이제 모든 경우에 대해 null을 고려해서 프로그래밍 하지 않고 null이 필요한 경우에 대해서만 예외를 처리해줄 수 있다. (역발상으로 이렇게까지..) 호환성도 유지, 유지보수 용이. 다만 swift에서 nil 값을 처리하기 위한 방법들을 알아야 한다. 가보자고

기본적으로 옵셔널 타입의 값은 wrapping되어 있으므로 unwrapping하는 과정이 필수적이다. 대표적으로 세 가지 방법이 있다.

```swift
var optionalPerson?

// unconditional unwrapping
let number = Int("42")!
print(number)

// optional binding
if let person = optionalPerson {
	print(person)
} else {
	print("this var has nil value")
}

guard let person = optionalPerson else {
	print("this var has nil value")
	//exception logic
}

// Using the nil-coalescing Operator
let person = optionalPerson ?? "default person"

```

- unconditional umwrapping (강제 언래핑): 강제로 값을 언래핑한다.
- Optional binding: if let 혹은 guard let 구문을 통해 옵셔널 값을 안전하게 unwrapping 할 수 있다.
- nil-coalescing: 닐 코얼레싱 방식으로 언래핑한다.

---

</br>

## Class

> Class is general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your classes using the same syntax you use to define constants, variables, and functions.
> 

**클래스의 정의는 데이터와 메소드가 결합된 사용자정의 타입(User-Defined Type)** 이다. Class로 특정 프로퍼티, 메서드를 갖도록 구조화하여 틀을 만들면, 그 틀을 사용해서 같은 특성을 가진 여러개의 객체를 생성할 수 있다.

- 객체지향과 class에 대해 너무 잘 설명해놓은 블로그가 있으니 개념이 헷갈리면 또 읽자
    
    **[출처]** [객체지향(Object-Oriented)과 클래스(Class)](https://blog.naver.com/29java/70187502359)|**작성자** [이구자바](https://blog.naver.com/29java)
    
</br>

**self 키워드** 

인스턴스 내에서 자신을 가리키는 키워드를 self로 한다. 통상 생성자를 작성할 때 매개변수의 이름과 클래스 내에서 사용할 변수의 이름이 같다면 둘을 구분하기 위해 클래스 변수에 self 키워드를 붙여 사용한다.

</br>

**super 키워드**

상속 받기 전의 함수, 프로퍼티에 접근할 때 super 키워드를 사용한다.

</br>

**static 키워드**

> 스위프트에서 **Static**은 '타입' 프로퍼티 혹은 '타입' 함수를 의미한다. 클래스에 속한 프로퍼티 및 메서드를 의미한다. 인스턴스의 생성 없이 이름만으로도 호출이 가능하다.
> 
- static 멤버는 인스턴스 위에서는 사용할 수 없다.

</br>

### 상속

쉽게 말해서 기존 클래스와 약간 다른 클래스를 만들 때 상속을 사용한다. 데이터(프로퍼티)를 추가하거나 기능(메서드)을 추가할 수 있다.

final: **찐막**

더 이상 상속할 수 없도록 하는 접근제어자이다. 말 그대로 마지막 클래스.

</br>

### Access control(접근제어)

선언, 파일, 그리고 모듈에 의해 코드의 노출을 관리한다.

- **Public**: *public access* enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module.
- **Package**: *Package access* enables entities to be used within any source files from their defining package but not in any source file outside of that package.
- **Internal**: *Internal access* enables entities to be used within any source file from their defining module, but not in any source file outside of that module.
- **File-private**: *File-private access* restricts the use of an entity to its own defining source file.
- **Private**: *Private access* restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file.

---

</br>

## Struct (구조체)

> Model custom types that encapsulate data
> 

값을 캡슐화해서 사용하는 사용자 정의 타입

</br>

Class vs Struct

공통점

- Define properties to store values
- Define methods to provide functionality
- Define subscripts to provide access to their values using subscript syntax
- Define initializers to set up their initial state
- Be extended to expand their functionality beyond a default implementation
- Conform to protocols to provide standard functionality of a certain kind

</br>

클래스의 추가적인 기능

- Inheritance enables one class to inherit the characteristics of another.
- Type casting enables you to check and interpret the type of a class instance at runtime.
- Deinitializers enable an instance of a class to free up any resources it has assigned.
- Reference counting allows more than one reference to a class instance.

</br>

**mutating:**

</br>

---

## Enum (열거형)

> 연관된 상수들을 하나의 이름으로 묶은 자료형
> 
- 대문자로 시작하는 것이 관례이다.
- 연관값(Associated Value), 원시값(Raw Value)을 이용하면 추가 정보를 저장할 수 있다. 원시값을 별도로 지정해주지 않으면 Int는 0부터 증가하여 값을 매칭한다. 설정해둔 값이 있다면 그 수부터 증가한다. 문자열은 case의 이름으로 매칭된다.

```swift
enum CompassDirection: Int {
        case north = 1
        case south = 2
        case east = 3
        case west
    }
let direction: CompassDirection = .west

// switch문에서의 응용
switch direction {
        case .north: print("북")
        case .south: print("남")
        case .east: print("동")
        case .west: print("서")
    }

print(direction.rawValue) // 4
```

</br>

### Raw value (원시값)

- 열거형의 case와 매칭되는 기본값
- 각 케이스에 값을 매칭시켜 사용할 수 있다.

</br>

### Associated value (연관값)

- 구체적인 추가 정보를 저장하기 위해 사용. 튜플식으로 지정한다.
- 연관된 정보를 케이스에 추가적으로 저장하는 개념으로, 타입에 제한 없이 자유롭게 정의 가능하다.

```swift
enum Computer {
    case cpu(core: Int, ghz:Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
}

var cpu = Computer.cpu(core: 6, ghz: 1.4)
var ram = Computer.ram(16, "DDR4")
```

---

</br>

## Closure (클로저)

> Group code that executes together, without creating a named function.
> 

이름이 없는 함수

```swift
let simpleClosure = { print("Hello World") }

simpleClosure()

// closure 원형
let multiply: (Int, Int) -> Int = { (x: Int, y: Int) -> Int in
		return x * y
}
// closure 생략 표현: { param1, param2 in returnValue }
let multiply: (Int, Int) -> Int = {x, y in x * y}

print(multiply(5, 6))
```

변수 캡쳐

[Documentation](https://bbiguduk.github.io/swift-book-korean/documentation/the-swift-programming-language-korean/closures/#%EC%BA%A1%EC%B2%98%EA%B0%92-Capturing-Values)

싱글톤
