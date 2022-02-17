import Swift

// *** 함수 고급 ***

// 1. 매개변수 기본 값
// 매개변수에 기본적으로 전달될 값을 미리 지정해 둘 수 있다
// 기본값을 갖는 매개변수는 매개변수 목록 중 뒤쪽에 위치하는 것이 좋다
//
// func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 배개변수2타입 = 매개변수 기본값 ...) -> 반환타입{
// 함수 구현부
// return 반환값
//}
func greeting(friend: String, me: String = "jjudy")
{
    print("Hello \(friend)! I'm \(me)")
}
//
// 매개변수 기본값을 가지는 매개변수는 호출시 생략할 수 있다고 한다
greeting(friend:"hana")
greeting(friend:"john", me: "쭈디") // 이렇게 옵션을 넣으면 기본값 대신 옵션이!


// 2. 전달인자 레이블(Argument Label)
// 함수를 호출할 때 함수 사용자의 입장에서 매개변수의 역할을 좀 더 명확하게 표현하고자 할 때 사용
// 전달인자 레이블은 변경해서 동일한 이름의 함수를 중복으로 생성할 수 있다
// func 함수이름(전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입 ...) -> 반환타입{
// 함수 구현부
// return
// }
//
func greeting(to friend: String, from me: String)
{
    print("Hello \(friend)! I'm \(me)")
}
//
// 함수를 호출할 때에는 전달인자 레이블을 사용해야 한다
greeting(to: "hana", from: "jjudy")


// 3. 가변 매개변수 ==========================
// 전달 받은 값의 개수를 알기 어려울 때 사용한다
// 가변 매개변수는 함수당 하나만 가질 수 있다
// 기본값이 있는 매개변수와 같이 가변 매개변수 역시 매개변수 목록 중 뒤쪽에 위치하는 것이 좋음
//
// func 함수이름(매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입{
// 함수 구현부
// return
// }
//
func sayHelloToFriends(me: String, friends: String...) -> String
{
    return "Hello \(friends)! I'm \(me)!"
}
//
print(sayHelloToFriends(me: "jjudy", friends: "hana", "eric", "wing"))
print(sayHelloToFriends(me: "jjudy"))


// 4. 데이터 타입으로서의 함수 =======================
// 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이므로 스위프트의 함수는 일급객체이다
// 그래서 함수를 변수, 상수 등에 할당이 가능하고 매개변수를 통해 전달할 수도 있다
// 즉, 각 함수는 매개변수 타입과 반환 타입으로 구성된 하나의 타입으로 사용(정의)할 수 있다는 뜻이다
// 함수의 타입 표현 : 반환 타입을 생략할 수 없다
//
//(매개변수1타입, 매개변수2타입 ...) -> 반환타입
//
var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "jjudy")
//
someFunction = greeting(friend:me:)
someFunction("eric", "jjudy")
//
// someFunction = sayHelloToFriends(me: friends:)
// 타입이 다른 함수는 할당할 수 없음
//
func runAnother(function: (String, String) -> Void)
{
    function("jenny", "mike")
}
//
runAnother(function: greeting(friend:me:))
runAnother(function: someFunction)
