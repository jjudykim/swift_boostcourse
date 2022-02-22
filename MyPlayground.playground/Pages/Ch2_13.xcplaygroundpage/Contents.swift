import Swift

// *** 구조체 ***
//
// 1. 구조체란?
// - 스위프트 대부분 타입은 구조체로 이루어져 있다
// - 구조체는 값(value) 타입이다 -> 엥?
// - 타입이름은 대문자 카멜케이스(Upper Camel Case)를 사용!
//
// 2. 구조체 문법
// - 구조체 정의: "struct" 키워드 사용
// struct 이름
// {
//     구현부
// }
//
// - 구조체 프로퍼티 및 메소드 구현
struct Sample
{
    // 가변 프로퍼티(값 변경 가능)
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티(값 변경 불가능)
    let immutalbeProperty: Int = 100
    
    // 타입 프로퍼티(static 키워드 사용 : 타입 자체가 사용하는 프로퍼티)
    static var typeProperty: Int = 100
    
    // 인스턴스 메소드 (인스턴스가 사용하는 메소드)
    func instanceMethod()
    {
        print("instance method")
    }
    
    // 타입 메소드 (static 키워드 사용 : 타입 자체가 사용하는 메소드)
    static func typeMethod()
    {
        print("type method")
    }
}
//
// - 구조체 사용
// 가변 인스턴스 생성
var mutable: Sample = Sample()

mutable.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후에 수정할 수 없다
// 즉 아래의 경우는 컴파일 오류 발생
// mutable.immutableProperty = 200

// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 가변 프로퍼티라도 인스턴스 생성 후에 수정 불가능
// 즉 아래의 경우는 둘 다 컴파일 오류 발생
// immutable.mutableProperty = 200
// immutable.immutableProperty = 200


// 타입 프로퍼티 및 메소드
Sample.typeProperty = 300
Sample.typeMethod() // type method


// 인스턴스에서는 타입 프로퍼티나 타입 메소드를 사용할 수 없음
// 즉 아래의 경우는 둘 다 컴파일 오류 발생
// mutable.typeProperty = 400
// mutable.typeMethod()



// ===== 예제로 학생 구조체 만들어보기!
struct Student
{
    var name: String = "unknown"    // 가변 프로퍼티
    var `class`: String = "Swift"   // 기존에 있는 키워드도 `(' 아님 주의....)를 사용해서 이름으로 사용할 수 있다!!
    static func selfIntroduce()
    {
        print("학생 타입입니다")
    }
    
    
    // 인스턴스 메소드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항이다!
    func selfIntroduce()
    {
        print("저는 \(self.class)반 \(name)입니다")
    }
}


// 타입 메소드 사용
Student.selfIntroduce() // 학생 타입입니다

// 가변 인스턴스 생성
var jjudy: Student = Student()
jjudy.name = "쭈디"
jjudy.class = "스위프트"
jjudy.selfIntroduce() // 저는 스위프트반 쭈디입니다

// 불변 인스턴스 생성
let jina: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
// jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 unknwon 입니다
