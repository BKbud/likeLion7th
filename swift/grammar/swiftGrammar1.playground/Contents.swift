
let phrase: String = "the quick brown fox jumps over the lazy dog"
let numberOfFoxes: Int = 1
let numberOfAnimals: Int = 2
let averageCharacterPerWord: Float = (3+5+5+3+5+4+3+4+3) / 9

print(averageCharacterPerWord)

// 상수는 수정 불가
//phrase = "Hello"

var anoatherPhrase: String = phrase
anoatherPhrase = "the quick brown fox jumps over the lazy"
print(phrase)
print(anoatherPhrase)

// 타입 추론 (type inference): swift 컴파일러는 타입을 지정하지 않으면 자동으로 타입을 추론하여 지정하는 기능을 제공한다.
var phraseInfo = "The phrase" + "has: "
//phraseInfo = 1 -> 타입 추론으로 생성되었기 때문에 다른 타입의 값을 가질 수 없다.

// 문자열 보간법(String interpolation) = "\(some value)"
phraseInfo += "\(numberOfFoxes) foxes"

var i = 1
i += 1
print(i)

print("Number of characters: \(phrase.count)")

// string literal
let multilineExplanation = """
Why is the following phrase often used?
"The quick brown fox jumps over the lazy dog"
This phrase contains every letter in the alphabet.
"""

let phraseAreEqual = phrase == anoatherPhrase
print(phraseAreEqual)

let phraseHas43Characters = phrase.count == 40 + 3
print(phraseHas43Characters)

let phraseHasMoreThan43Characters = phrase.count > 40 + 3
print(phraseHasMoreThan43Characters)
