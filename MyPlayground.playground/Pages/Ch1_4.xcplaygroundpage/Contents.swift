import Swift

// Swift의 기본 데이터 타입
// Bool
// Int, UInt
// Float, Double
// Character, String


// 1. Bool ========================
// true와 false만을 값으로 가지는 타입

var someBool: Bool = true
someBool = false
// someBool = 0 // 컴파일 오류
// someBool = 1 // 컴파일 오류 -> c와 다르게 숫자로 표현 못하는 듯!


// 2. Int, UInt ===================
// Int : 정수 타입, 기본적으로 64비트 정수형
// UInt : 양의 정수 타입, 기본적으로 64비트 양의 정수형

var someInt: Int = -100
// someInt = 100.1 -> 컴파일 오류, 정수형이니까!

var someUInt: UInt = 100
// someUInt = -100 -> 컴파일 오류, 양의 정수형이니까!
// someUInt = someInt -> 컴파일 오류, 둘의 데이터 타입이 다름


// 3. Float, Double ===============
// Float : 실수 타입. 32비트 부동소수형
// Double : 실수 타입. 64비트 부동소수형

var someFloat: Float = 3.14
someFloat = 3

var someDouble: Double = 3.14
someDouble = 3
// someDouble = someFloat -> 컴파일 오류, 둘의 데이터 타입이 다름


// 4. Character, String ===========
// Character : 문자 타입, 유니코드 사용, 큰 따옴표 ("") 사용 -> c와 다르게 둘 다 ""를 사용하는 듯
// String : 문자열 타입, 유니코드 사용, 큰 따옴표 ("") 사용

var someCharacter: Character = "🥰"
someCharacter = "가"
someCharacter = "A"
// someCharacter = "하하하" -> 컴파일 오류, 한 글자만 담을 수 있으니까!
print(someCharacter)

var someString: String = "하하하😄"
someString = someString + "웃으면 복이와요"
print(someString)
//someString = someCharacter -> 컴파일 오류, 둘의 데이터 타입이 다름



