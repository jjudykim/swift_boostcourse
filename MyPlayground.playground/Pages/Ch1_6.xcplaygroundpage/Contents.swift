import Swift

// *** 컬렉션 타입 ***
// Array : 순서가 있는 리스트 컬렉션
// Dictionary : '키'와 '값'의 쌍으로 이루어진 컬렉션
// Set : 순서가 없고, 멤버가 유일한 컬렉션

// 1. Array =========================
// 멤버가 순서(인덱스)를 가진 리스트 형태의 컬렉션 타입
// 여러가지 리터럴 문법을 활용할 수 있어 표현 방법이 다양함

// 1) 선언 및 생성
var integers: Array<Int> = Array<Int>()

// 이와 동일한 표현
// var integers: Array<Int> = [Int]()
// var integers: Array<Int> = []
// var integers: [Int] = Array<Int>()
// var integers: [Int] = [Int]()
// var integers: [Int] = []
// var integers = [Int]()

// 2) Array 활용
integers.append(1)
integers.append(100)
// integers.append(101.1) -> 컴파일 오류! Int 타입이 아니기 때문에 Array에 추가할 수 없음
print(integers)

// 멤버 포함 여부 확인
print(integers.contains(100)) // true
print(integers.contains(99)) // false

// 멤버 교체
integers[0] = 99

// 멤버 삭제
integers.remove(at:0)
integers.removeLast()
integers.removeAll()

// 멤버 수 확인
print(integers.count)

// integers[0] -> 인덱스를 벗어나 접근하려고 하면 오류 발생!


// 3) 불변 Array : let을 사용해 Array 선언
let immutableArray = [1, 2, 3]
// -> 수정이 불가능한 Array이기 때문에 멤버를 추가하거나 삭제할 수 없음!
// immutableArray.append(4)
// immutableArray.removeAll()



// 2. Dictionary =================================
// '키'와 '값'의 쌍으로 이루어진 컬렉션 타입
// Array와 비슷하게 여러가지 리터럴 문법을 활용할 수 있어 표현 방법이 다양하다

// 1) Dictionary의 선언과 생성
// Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()

// 위와 동일한 표현
// var anyDictionary: Dictionary <String, Any> = Dictionary<String, Any>()
// var anyDictionary: Dictionary <String, Any> = [:]
// var anyDictionary: [String: Any] = Dictionary<String, Any>()
// var anyDictionary: [String: Any] = [String: Any]()
// var anyDictionary: [String: Any] = [:]
// var anyDictionary = [String: Any]()


// 2) Dictionary 활용
// 키에 해당하는 값 할당
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

print(anyDictionary)

// 키에 해당하는 값 변경
anyDictionary["someKey"] = "dictionary"
print(anyDictionary)

// 키에 해당하는 값 제거
anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil
print(anyDictionary)


// 3) 불변 Dictionary : let을 사용해 Dictionary 선언
let emptyDictionary: [String: String] = [:]
let initalizedDictionary: [String: String] = ["name": "yagom", "gender": "male"]

// -> 불변 Dictionary이므로 값 변경 불가
// emptyDictionary["key"] = "value" -> 오류!!

// 키에 해당하는 값을 다른 변수나 상수에 할당하고자 할 때 -> 옵셔널과 타입 캐스팅 파트에서!

// let someValue: String = initalizedDictionary["name"]
// -> "name"이라는 키에 해당하는 값이 없을 수 있으므로 String 타입의 값이 나올 것이라는 보장이 없어 컴파일 오류 발생



// 3. Set ================================
// 중복되지 않는 멤버가 순서없이 존재하는 컬렉션
// Array, Dictionary와 다르게 축약형이 존재하지 않음

// 1) Set 생성 및 선언
var integerSet: Set<Int> = Set<Int>()

// insert : 새로운 멤버 입력
// 동일한 값은 여러번 insert해도 한번만 저장된다
integerSet.insert(1)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(100)

print(integerSet) // {100, 99, 1}

// contains: 멤버 포함 여부 확인
print(integerSet.contains(1)) // true
print(integerSet.contains(2)) // false

// remove: 멤버 삭제
integerSet.remove(99) // {100, 1}
integerSet.removeFirst() // {1}

// count: 멤버 개수
integerSet.count // 1


// 2) Set의 활용
// 멤버의 유일성이 보장되기 때문에 집합 연산에 활용하면 유용하다
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)
print(union) // [2, 4, 5, 6, 7, 3, 1]

// 합집합 오름차순 정렬
let sortedUnion: [Int] = union.sorted()
print(sortedUnion) // [1, 2, 3, 4, 5, 6, 7]

// 교집합
let intersection: Set<Int> = setA.intersection(setB)
print(intersection) // [5, 3, 4]

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting) // [2, 1]


// 생각해보기
// 다음과 같은 경우에는 각각 어떤 컬렉션 타입을, 상수/변수 선언 중 어떤 것을 사용하면 유용할까?
//
// 1. 영어의 알파벳 소문자를 모아두는 컬렉션
// -> set, 상수
let lowerAlphabet: Set<Character> = ["a", "b", "c", "d", "e", "y", "z"]
dump(lowerAlphabet)
//
// 2. 책의 제목과 저자 정리를 위한 컬렉션
// -> Dictionary, 변수
var bookInfo: [String:String] = ["책1": "저자1", "책2": "저자2"]
dump(bookInfo)
//
// 3. Boostcamp iOS 수강생 명부 작성을 위한 컬렉션
// -> Array, 변수
var boostcampStudent: Array<String> = ["김주향", "쭈디", "jjudy"]
dump(boostcampStudent)
