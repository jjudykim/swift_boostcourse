import Swift
import Security

// *** 옵셔널 ***
//
// <옵셔널이 필요한 이유?>
// -> nil의 가능성을 명시적으로 표현
// - nil 가능성을 문서화 하지 않아도 코드만으로 충분히 표현 가능 -> 문서/주석 작성 시간 절약
// - 전달받은 값이 옵셔널이 아니라면 nil 체크를 하지 않더라도 안심하고 사용 -> 효율적 코딩, 예외 상황 최소화하는 안전한 코딩
//
// 1. 옵셔널이란?
// - 값이 있을 수도, 없을 수도 있음을 표현
// - nil이 할당될 수 있는지 없는지를 표현
//
func someFunction(someOptionalParam: Int?)
{
    //...
}
// -> someOptionalParm에 nil이 할당 될 수 있다 O
//
func someFunction(someParam: Int)
{
    //...
}
// -> someOptionalParam에 nil이 할당될 수 없다 X
//
someFunction(someOptionalParam: nil)
// someFunction(someParam: nil) -> 오류 발생! nil 할당될 수 없음


// 2. 옵셔널 문법과 선언
// - 옵셔널 문법 = enum + generics
// - 옵셔널 선언

/* 내부적으로 이렇게 선언이 되어있다고 하는 듯..
enum Optional<Wrapped>: ExpressibleByNilLiteral {
         case none
         case some(Wrapped)
}
*/

let optionalValue: Optional<Int> = nil
let optionalValue2: Int? = nil


// - 옵셔널 표현
// 1) 느낌표(!)를 이용한 암시적 추출 옵셔널
// Implicitly Unwrapped Optional
var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none:   // 값이 없는 경우
    print("This Optional variable is nil")
case .some(let value):   // 어떤 값이 들어온 경우!
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1


// 2) 물음표(?)를 이용한 옵셔널 - 일반적인 옵셔널
// Optional
var optionalValue3: Int? = 100

switch optionalValue3 {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// nil 할당 가능
optionalValue3 = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1
