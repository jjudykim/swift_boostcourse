import Swift

// *** 클래스 vs 구조체/열거형 ***
//
// 클래스는 참조타입이지만, 열거형과 구조체는 값 타입이라는 것이 가장 큰 차이이다
// 클래스는 상속이 가능하지만, 열거형과 구조체는 상속이 불가능합니다

// 1. 값 타입과 참조 타입 비교 =========================
// 값 타입(Value Type) : 데이터를 전달할 때 값을 복사하여 전달한다
// 참조 타입(Reference Type) : 데이터를 전달할 때 값의 메모리 위치를 전달한다
//
struct ValueType
{
    var property = 1
}
//
class ReferenceType
{
    var property = 1
}
//
// 구조체의 경우
// 첫 번째 구조체 인스턴스
let firstStructInstance = ValueType()
//
// 두 번째 구조체 인스턴스에 첫 번째 인스턴스 값 복사
var secondStructInstance = firstStructInstance
//
// 두 번째 구조체 인스턴스 프로퍼티 값 수정
secondStructInstance.property = 2
//
// 두 번째 구조체 인스턴스는 첫 번째 구조체를 똑같이 복사한 별도의 인스턴스이기 때문에
// 두 번째 구조체 인스턴스의 프로퍼티 값을 변경해도
// 첫 번째 구조체 인스턴스의 프로퍼티 값에는 영향이 없음
print("first struct insatnce property : \(firstStructInstance.property)") // 1
print("first struct instance property : \(secondStructInstance.property)") // 2
// 즉, 구조체는 주소를 공유하는 것이 아니라 값만을 전달하는 형태이다!!
//
// 클래스의 경우
// 클래스 인스턴스 생성 후 첫 번째 참조 생성
let firstClassReference = ReferenceType()

// 두 번째 참조 변수에 첫 번째 참조 할당
let secondClassReference = firstClassReference
secondClassReference.property = 2
//
// 두 번째 클래스 참조는 첫 번째 클래스 인스턴스를 참조하기 때문에
// 두 번째 참조를 통해 인스턴스의 프로퍼티 값을 변경하면
// 첫 번째 클래스 인스턴스의 프로퍼티 값을 변경하게 된다
print("first class reference property : \(firstClassReference.property)") // 2
print("second class reference property : \(secondClassReference.property)") // 2



// 2. 값 타입을 사용하는 경우 ==========================
// - 연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶은 경우
// - 다른 객체 또는 함수 등으로 전달될 때 참조가 아니라 복사(값 복사) 할 경우
// - 자신을 상속할 필요가 없거나, 다른 타입을 상속 받을 필요가 없는 경우



// 3. 스위프트에서의 사용 ==============================
// - 스위프트의 기본 데이터 타입은 모두 구조체로 구현되어 있다
// - 스위프트는 구조체와 열거형 사용을 선호한다(신기... 클래스보다??)
// - Apple 프레임워크는 대부분 클래스를 사용한다
// - 구조체/클래스 선택과 사용은 개발자의 몫이다
