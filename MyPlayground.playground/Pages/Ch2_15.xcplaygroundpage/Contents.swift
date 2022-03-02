import Swift

// *** 열거형 ***
// 1. 열거형
// Swift 열거형은 다른 언어의 열거형과 많이 다르다!
// -> 강력한 기능을 지니고 있으니 잘 알아두고 사용하도록 하자
// - 유사한 종류의 여러 값을 한 곳에 모아서 정의한 것이다 (요일, 월, 계절 등)
// - enum 자체가 하나의 데이터 타입으로, 대문자 카멜케이스를 사용해 이름을 정의한다
// - 각 case는 소문자 카멜케이스로 정의한다
// - 각 case는 그 자체가 고유의 값이다(각 case에 자동으로 정수값이 할당되지 않는다)
// - 각 case는 한 줄에 개별로도, 한 줄에 여러개도 정의할 수 있다
//
// enum 이름
// {
//  case 이름
//  case 이름2
//  case 이름3, 이름4, 이름5
//  //...
// }
//
// 예제
enum BoostCamp
{
    case iosCamp
    case androidCamp
    case webCamp
}
//


// 2. 열거형 사용
// - 타입이 명확할 경우, 열거형의 이름을 생략할 수 있다
// - switch 구문에서 사용하기 좋다
enum Weekday
{
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용해도 된다
var day: Weekday = Weekday.mon

//타입이 명확하다면 .케이스 처럼 표현해도 무방하다
day = .tue

print(day)

// switch의 비교값에 열거형 타입이 위치할 때
// 모든 열거형 케이스를 포함한다면 default를 작성할 필요가 없다
switch day
{
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}
