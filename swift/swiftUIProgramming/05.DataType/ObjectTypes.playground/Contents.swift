
// BankAccount라는 클래스를 정의합니다
class BankAccount {
    // 계좌 잔액을 저장하는 변수 (Float 타입)
    var accountBalance: Float
    // 계좌 번호를 저장하는 변수 (Int 타입)
    var accountNumber: Int
    // 수수료
    let fees: Float = 25.00
    
    // 초기화 메서드(생성자)
    // number: 계좌번호, balance: 초기 잔액을 매개변수로 받습니다
    init(number: Int, balance: Float) {
        // self는 현재 인스턴스를 가리킵니다
        // 매개변수의 값을 인스턴스 변수에 할당합니다
        self.accountNumber = number
        self.accountBalance = balance
    }
    
    func displayBalance() {
        print("Account number is \(accountNumber)")
        print("Your balance is \(balanceLessFees)")
    }
    
    // 전체 잔액에서 수수료를 뺀 금액을 출력하는 computed property
    var balanceLessFees: Float {
        // get 키워드는 읽기를 위한 메서드 정의
        get {
            return accountBalance - fees
        }
    }
    
    // 클래스 메서드 (인스턴스 생성 없이 호출 가능)
    // class func 은 상속 후 재정의(오버라이드)가능 합니다.
    class func getMaxBalance() -> Float {
        return 100000.00
    }
}

var account1 = BankAccount(number: 12312312, balance: 400.54)
account1.displayBalance()
print(BankAccount.getMaxBalance())


class MyClass1 {
    let title: String
    
    // lazy 지연해서 생성하도록 하는 키워드
    // 즉시실행함수(클로저)로 변수를 초기화하는 코드
    lazy var myProperty: String = {
        var result = resourceIntensiveTask()
        result = processData(data: result)
        return result
    }()
    
    // 오래 걸리는 함수 예시
    func resourceIntensiveTask() -> String {
        return "Hello World!"
    }
    
    // 오래 걸리는 작업에 대한 예시 함수
    func processData(data: String) -> String {
        return self.title + "!"
    }
    
    init(title: String) {
        self.title = title
    }
}

// 프로토콜
protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}

class MyClass: MessageBuilder {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        "Hello " + name
    }
}

// 상속, 재정의, super 키워드
class SavingsAccount: BankAccount {
    var interestRate: Float = 0.0
    
    init(number: Int, balance: Float, rate: Float) {
        self.interestRate = rate
        super.init(number: number, balance: balance)
    }
    
    func calculateInterest() -> Float {
        return interestRate * accountBalance
    }
    
    override func displayBalance() {
        super.displayBalance()
        print("현재 이자율: \(interestRate)")
    }
}
let savings1 = SavingsAccount(number: 12312312, balance: 400.54, rate: 0.05)
print(savings1.calculateInterest())
savings1.displayBalance()

extension Double {
    var squared: Double {
        return self * self
    }
    
    var cubed: Double {
        return self * self * self
    }
}

let squaredNum: Double = 3
print(squaredNum.squared)
print(squaredNum.cubed)
