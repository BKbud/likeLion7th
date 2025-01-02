import Foundation

//runOptional()
//runFunction()
//runClass()
//runStruct()
//runEnum()
//runClosure()
//runProtocol()
//runTypeAlias()
//runPropertyObserver()
//runIfElse()

enum CompassPoint {
    case north
    case south
    case east
    case west
}

func lookTowards(_ direction: CompassPoint) {
    switch direction {
    case .north:
        print("북쪽으로는 구불구불한 길이 있습니다")
    case .south:
        print("남쪽에는 프랜싱 포니 선술집이 있습니다")
    case .east:
        print("동쪽에는 대장간이 있습니다")
    case .west:
        print("서쪽에는 마을 광장이 있습니다")
    }
}

lookTowards(.south)

enum Item {
    case key
    case lockedDoor
    case openDoor
    case bluntKnife
    case sharpeningStone
    case sharpKnife
}

func combine(_ firstItem: Item, with secondItem: Item) -> Item? {
    switch (firstItem, secondItem) {
    case (.key, .lockedDoor):
        print("문을 열었습니다!")
        return .openDoor
    case (.bluntKnife, .sharpeningStone):
        print("칼이 날카로워졌습니다.")
        return .sharpKnife
    default:
        print("\(firstItem)과 \(secondItem)은 결합할 수 없습니다.")
        return nil
    }
}

let door = combine(.key, with: .lockedDoor)
let oilAndWater = combine(.bluntKnife, with: .lockedDoor)

// swift문 중복 확인
let num = 10
switch num {
case ..<11:
    print("under 10")
case ..<21:
    print("under 20")
default:
    print("out of range")
}

//=====for while try catch guard=====

// For Loop

let ledZeppelin = ["Robert", "Jimmy", "John", "John Paul"]

// array for loop
for musician in ledZeppelin {
    print(musician)
}

for value in 1...12 {
    print("5 x \(value) = \(value * 5)")
}

// tuple for loop
let zeppelinByInstrument = ["vocals": "Robert",
                            "lead guitar": "Jimmy",
                            "drums": "John",
                            "bass guitar": "John Paul"]

for (key, value) in zeppelinByInstrument {
    print("\(value)가 \(key)를 연주합니다.")
}

//ledZeppelin.forEach { musician in print(musician) }
ledZeppelin.forEach { print($0) }

zeppelinByInstrument.forEach { (key, value) in print("\(value)가 \(key)를 연주합니다.") }

// While Loop

enum CoinFlip: Int {
    case heads
    case tails
    
    static func flipCoin() -> CoinFlip {
        return CoinFlip(rawValue: Int.random(in: 0...1))!
    }
}

func howManyHeadsInARow() -> Int {
    var numberOfHeadsInARow = 0
    var currentFlip: CoinFlip = CoinFlip.flipCoin()
    print("currentFlip.rawValue: \(currentFlip.rawValue)")
    while currentFlip == .heads {
        numberOfHeadsInARow += 1
        currentFlip = CoinFlip.flipCoin()
    }
    
    return numberOfHeadsInARow
}

let noOfHeads = howManyHeadsInARow()
print(noOfHeads)
