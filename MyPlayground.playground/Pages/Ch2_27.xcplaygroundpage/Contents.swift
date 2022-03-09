import Swift

// *** 익스텐션 ***
//
// 1. 익스텐션(Extension)
// - 익스텐션은 스위프트의 강력한 기능중 하나로, 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능이다
// - 기능을 추가하려는 타입의 구현된 소스 코드를 알지 못하거나 볼 수 없다 해도, 타입만 알고 있다면 그 타입의 기능을 확장할 수도 있다
//
// << 스위프트의 익스텐션이 타입에 추가할 수 있는 기능>>
// - 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
// - 타입 메소드 / 인스턴스 메소드
// - 이니셜라이저
// - 서브스크립트
// - 중첩 타입
// - 특정 프로토콜을 준수할 수 있도록 기능 추가
//
// - 익스텐션은 타입에 새로운 기능을 추가할 수 있지만, 기존에 존재하는 기능을 재정의할 수는 없다
//
// << 클래스의 상속과 익스텐션 비교 >>
// 이 둘은 비슷해보이지만 실제 성격이 많이 다르다
// 클래스의 상속 : 클래스 타입에서만 가능, 특정 타입을 물려 받아 하나의 새로운 타입을 정의하고 추가 기능을 구현하는 수직 확장, 기존 기능 재정의 가능
// 익스텐션 : 구조체, 클래스, 프로토콜 등에 적용 가능, 기존의 타입에 기능을 추가하는 수평 확장, 기존 기능 재정의 불가능
// -> 상황과 용도에 맞게 상속과 익스텐션을 선택해 사용하기!!
// =============================================================
//                상속                익스텐션
// =============================================================
//    확장       수직 확장              수평 확장
//    사용      클래스 타입    클래스, 구조체, 프로토콜, 제네릭 등 모든 타입
//   재정의         가능                불가능
// =============================================================
//
// << 익스텐션 활용 >>
// 익스텐션을 사용하는 대신 원래 타입을 정의한 소스에 기능을 추가하는 방법도 있다
// 그러나 외부 라이브러리 / 프레임워크를 가져다 썼다면 원본 소스를 수정하지 못한다
// 이처럼 외부에서 가져온 타입에 내가 원하는 기능을 추가하고자 할 때 익스텐션을 사용한다
// 따로 상속을 받지 않아도 되며, 구조체와 열거형에도 기능을 추가할 수 있으므로 익스텐션은 매우 편리한 기능이다
// 익스텐션은 모든 타입(구조체, 열거형, 클래스, 프로토콜, 제네릭 타입)에 적용할 수 있다
// 즉, 익스텐션을 통해 모든 타입에 연산 프로퍼티, 메서드, 이니셜라이저, 서브스크립트, 중첩 데이터 타입 등을 추가할 수 있다
// 더불어 익스텐션은 프로토콜과 함께 사용하면 굉장히 강력한 기능을 .. 선사한다.. 고 한다!
// 이 부분과 관련해 프로토콜 중심 프로그래밍(Protocol Oriented Programming)에 대해 더 알아보쟈!



// 2. 정의 ======================================================
// - extension 키워드를 사용하여 정의한다
// extension 확장할_타입_이름 {
//     // 타입에 추가될 새로운 기능 구현
// }
//
// - 익스텐션은 기존에 존재하는 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장할 수도 있다
// - 이런 경우에는 클래스나 구조체에서 사용하던 것과 똑같은 방법으로 포로토콜 이름을 나열한다
// extension 확장할_타입_이름: 프로토콜1, 프로토콜2, 프로토콜3 ... {
//     // 프로토콜 요구사항
// }
//
// 스위프트 라이브러리를 살펴보면 실제로 익스텐션이 굉장히 많이 사용되고 있음을 알 수 있다
// Double 타입에는 수많은 프로퍼티와 메소드, 이니셜라이저가 정의되어 있으며 수많은 프로토콜을 채택하고 있을 것이라고 예상되지만....
// -> 실제로 Double 타입의 정의를 살펴보면 모든 것이 다 정의되어 있지는 않다!!
// 그럼 Double 타입이 채택하고 준수해야 하는 수많은 프로토콜은?
// -> 익스텐션에 채택하고 준수하도록 정의되어 있음!!
// 이렇게 Double 외에도 다른 타입들의 정의와 익스텐션을 찾아보면 더 많은 예를 볼 수 있을 것이에용



// 3. 구현 =======================================================
// << 연산 프로퍼티 추가 >>
// - 아래 익스텐션은 Int 타입에 두 개의 연산 프로퍼티를 추가한 것이다
// - Int 타입의 인스턴스가 홀수인지 짝수인지 판별해 Bool 타입으로 알려주는 연산 프로퍼티다
// - 익스텐션으로 Int 타입에 추가해준 연산 프로퍼티는 Int 타입의 어떤 인스턴스에도 사용이 가능하다
// - 인스턴스 연산 프로퍼티를 추가할 수도 있으며, static 키워드를 사용해 타입 연산 프로퍼티도 추가할 수 있다
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true
print(1.isOdd) // true
print(2.isOdd) // false

var number: Int = 3
print(number.isEven)
print(number.isOdd)

number = 2
print(number.isEven)
print(number.isOdd)

// << 메서드 추가 >>
// - 메서드 익스텐션을 통해 Int 타입에 인스턴스 메서드인 multiply(by:) 메소드를 추가했다!
// - 여러 기능을 여러 익스텐션 블록으로 나눠 구현해도 전혀 문제가 없다
// - 관련된 기능별로 하나의 익스텐션 블록에 묶어주는 것도 좋다
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}

print(3.multiply(by: 2))
print(4.multiply(by: 5))

number = 3
print(number.multiply(by: 2))
print(number.multiply(by: 3))

// << 이니셜라이저 추가 >>
// - 인스턴스를 초기화(이니셜라이즈)할 때 인스턴스 초기화에 필요한 다양한 데이터를 전달받을 수 있도록 여러 종류의 이니셜라이저를 만들 수 있다
// - 타입의 정의부에 이니셜라이저를 추가하지 않더라도 익스텐션을 통해 이니셜라이저를 추가할 수 있다
// - 익스텐션으로 클래스 타입에 편의 이니셜라이저는 추가할 수 있지만, 지정 이니셜라이저는 추가할 수 없다
// - 지정 이니셜라이저와 디이니셜라이저는 반드시 클래스 타입의 구현부에 위치해야 한다 (값 타입은 상관없다)
extension String {
    init(int: Int) {
        self = "\(int)"
    }
    
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFormInt: String = String(int: 100)

// 익스텐션을 활용하면 다양하고 강력한 기능을 구현할 수 있지만, 해당 타입에 적합한 익스텐션을 구현하도록 주의해야 한다

// 0309 Ch2_24~27 복습완료
