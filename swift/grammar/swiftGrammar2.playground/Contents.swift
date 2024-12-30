import Foundation
// parameter label:
//    함수를 호출할 때 즉, 전달 인자를 작성할 때 주어지는 힌트. 매개변수의 의미를 확실히 전할 수 있다. (아래의 forRating, ofPossibleTotal)
//    함수에서 사용되는 변수 이름은 rating, total
//    alias: 파라미터의 이름을 숨기고 싶을 때 사용 (API를 제작할 때 등)
func normalizedStarRating(forRating rating: Float, ofPossibleTotal total: Float) -> (Int, String) {
    let fraction = rating / total
    let ratingOutOf5 = fraction * 5
    let roundedRating = round(ratingOutOf5) // round(): 반올림 함수
    let numberOfStars = Int(roundedRating)
    let ratingString = "\(numberOfStars) Star Movie"
    return (numberOfStars, ratingString) // Tuple (Int, String)
}

let ratingAndDisplayString = normalizedStarRating(forRating: 5, ofPossibleTotal: 10)
let ratingNumber = ratingAndDisplayString.0
let ratingString = ratingAndDisplayString.1
print("Rating: \(ratingNumber), Rating String: \(ratingString)")

// 배열
// 실질적인 값을 가진 값 타입
var moviesToWatch: Array<String> = Array()
moviesToWatch.append("Star Wars")
moviesToWatch.append("The Lion King")
moviesToWatch.append("The Incredibles")

print(moviesToWatch[0])
print(moviesToWatch[1])
print(moviesToWatch[2])
print(moviesToWatch.count)

// 배열 요소 삽입
moviesToWatch.insert("The Avengers", at: 1)
print(moviesToWatch[1])

let removedItem = moviesToWatch.remove(at: 2)
print(removedItem)
print(moviesToWatch[2])
print(moviesToWatch)
print(moviesToWatch.count)

let firstMovieToWatch = moviesToWatch.first
print(firstMovieToWatch ?? "No movie")

let lastMovieToWatch = moviesToWatch.last

print(lastMovieToWatch as Any) //Any 타입을 주어 임시적으로 warning을 없앰
// Any 라는건 어떤 타입이라도 받겠다라는 타입인데 스위프트는 강타입(?) 언어라 만약에 Any 로 질러놓은 다음 그 Any 가 처리할수 없는 일을 시키면 프로그램이 꺼져버린다. 사용시 주의

// Array<String> == [String]
let spyMovieSuggestions: [String] = ["The Bourne Identity", "Casino Royale", "Mission Impossible"]
moviesToWatch += spyMovieSuggestions
print(moviesToWatch)
print(moviesToWatch.count)

var starWarsTrilogy = Array<String>(repeating: "Star Wars: ", count: 3)
starWarsTrilogy[0] = starWarsTrilogy[0] + "A New Hope"
starWarsTrilogy[1] += "The Empire Strikes Back"
starWarsTrilogy[2] += "The Return of the Jedi"
print(starWarsTrilogy)

// 특정 범위 요소 교체
moviesToWatch.replaceSubrange(2...4, with: starWarsTrilogy)
print(moviesToWatch)

// 불변(immutable) 배열 NSArray
let moviesToWatchCopy = moviesToWatch
// moviesToWatchCopy.append("The Force Awakens")
// -> warning: Cannot use mutating member on immutable value: 'moviesToWatchCopy' is a 'let' constant
print(moviesToWatchCopy)

//가변(mutable) 배열 NSMutableArray
var moviesToWatchCopy2 = moviesToWatchCopy
moviesToWatchCopy2.append("The Force Awakens")
print(moviesToWatchCopy2)

// 집합(Set)
let fibonacciArray: Array<Int> = [1, 1, 2, 3, 5, 8, 14, 21, 34]
var fibonacciSet: Set<Int> = Set(fibonacciArray)
print(fibonacciSet)
print(fibonacciArray.count)
print(fibonacciSet.count)

// 집합 요소 삽입, 제거
fibonacciSet.insert(35)
print(fibonacciSet)
print(fibonacciSet.contains(35))
fibonacciSet.remove(35)
print(fibonacciSet)

let evenNumbers = Set<Int>(arrayLiteral: 2, 4, 6, 8, 10)
let oddNumbers: Set<Int> = [1, 3, 5, 7, 9]
let squareNumbers: Set<Int> = [1, 4, 9]
let triangularNumbers: Set<Int> = [1, 3, 6, 10]
// 합집합
let evenOrTriangularNumbers = evenNumbers.union(triangularNumbers)
// 2, 4, 6, 8, 10, 1, 3, 순서 없음
print(evenOrTriangularNumbers.count) // 7
// 교집합
let oddAndSquareNumbers = oddNumbers.intersection(squareNumbers)
// 1, 9, 순서 없음
print(oddAndSquareNumbers.count) // 2
// 대칭 차집합
let squareOrTriangularNotBoth = squareNumbers.symmetricDifference(triangularNumbers)
// 4, 9, 3, 6, 10, 순서 없음
print(squareOrTriangularNotBoth.count) // 5
// 집합 뺄셈
let squareNotOdd = squareNumbers.subtracting(oddNumbers) // 4
print(squareNotOdd.count) // 1

