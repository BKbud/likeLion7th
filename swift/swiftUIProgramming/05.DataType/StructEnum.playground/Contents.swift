
struct SampleStruct {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg() -> String {
        "Hello, \(name)" // 함수의 한줄 실행구문의 결과가 함수의 반환타입과 일치하는 경우 return을 작성하지 않아도 자동으로 반환한다.
    }
}

class SampleClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg() -> String {
        return "Hello " + name
    }
}

let myStruct1 = SampleStruct(name: "Mark")
var myStruct2 = myStruct1
myStruct2.name = "David"

print(myStruct1.name)  // 출력: Mark
print(myStruct2.name)  // 출력: David

let myClass1 = SampleClass(name: "Mark")
var myClass2 = myClass1
myClass2.name = "David"

print(myClass1.name)  // 출력: David
print(myClass2.name)  // 출력: David

//Enumeration
enum Temperature {
    case hot
    case warm
    case cold(centigrade: Int)
}

func displayTempInfo(temp: Temperature) {
    switch temp {
    case .hot:
        print("Hot")
    case .warm:
        print("Warm")
    case .cold(let centigrade) where centigrade <= 0 && centigrade > -20:
        print("Ice warning: \(centigrade) degrees.")
    case .cold:
        print("It is cold but not freezing.")
    }
}

displayTempInfo(temp: Temperature.cold(centigrade: -10))
