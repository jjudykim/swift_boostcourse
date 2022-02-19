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
/*
enum Optional<Wrapped>: ExpressibleByNilLiteral {
         case none
         case some(Wrapped)
}
*/

// let optionalValue: Optional<Int> = nil
// let optionalValue: Int? =nil

