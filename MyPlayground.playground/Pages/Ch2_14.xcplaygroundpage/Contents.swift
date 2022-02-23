import Swift

// *** 클래스 ***
//
// 1. 클래스란?
// - 클래스는 참조(reference) 타입이다
// - 타입이름은 대문자 카멜 케이스(Upper Camel Case)를 사용해 정의
// - Swift의 클래스는 다중 상속이 되지 않음
//
//
// 2. 클래스 문법
// - 정의 : "class" 키워드 사용
// class 이름
// {
//      구현부
// }
//
// - 프로퍼티 및 메소드 구현
class Sample
{
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메소드
    func instanceMethod()
    {
        print("instance method")
    }
    
    
    
    
    // 타입 메소드
    // 상속 시 재정의 불가 타입 메소드 - static
    static func typeMethod()
    {
        print("type method - static")
    }
    
    
    // 상속 시 재정의 가능 타입 메소드 - class
    class func classMethod()
    {
        print("type method - class")
    }
}
//
// - 클래스 사용
// 인스턴스 생성 - 참조 정보 수정 가능
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200


// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없다
// mutableReference.immutableProperty = 200
// -> 컴파일 오류 발생

// 인스턴스 생성
let immutableReference: Sample = Sample()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 인스턴스 프로퍼티의 값 변경이 가능하다
immutableReference.mutableProperty = 200

// 다만 참조 정보를 변경할 수는 없다
// immutableReference = mutableReference
// -> 컴파일 오류 발생

// 참조 타입이라도 불변 인스턴스는 인스턴스 생성 후에 수정할 수 없다
// immutableReference.immutableProperty = 200
// -> 컴파일 오류 발생

// 타입 프로퍼티 및 메소드
Sample.typeProperty = 300
Sample.typeMethod()       // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메소드를 사용할 수 없다
// 즉, 둘 다 컴파일 오류 발생
// mutableReference.typeProperty = 400
// mutableReference.typeMethod()
//
//
// ====== 예제) 학생 클래스 만들어보기
class Student
{
    // 가변 프로퍼티
    var name: String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용 가능!!!
    var `class`: String = "Swift"
    
    // 타입 메소드
    class func selfIntroduce()
    {
        print("학생 타입입니다")
    }
    
    // 인스턴스 메소드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항
    func selfIntroduce()
    {
        print("저는 \(self.class)반 \(name)입니다")
    }
}




// 타입 메소드 사용
Student.selfIntroduce()

// 인스턴스 생성
var jjudy: Student = Student()
jjudy.name = "쭈디"
jjudy.class = "스위프트"
jjudy.selfIntroduce()

// 인스턴스 생성
let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce()




// 생각해보기!!
// '사람'을 나타내는 클래스를 만들어보자
// - Hint 1 : 사람이 가질 수 있는 속성을 프로퍼티로, 사람이 할 수 있는 행동을 메소드로 구현할 수 있다.
// - Hint 2 : 이름 짓기 규칙을 다시 한 번 살펴보도록 하자!
class Person
{
    var name: String = "unknown"
    var age: Int = 0
    var from: String = "지역"
    
    func selfIntroduce()
    {
        print("안녕하세요, 저는 \(from)에서 온 \(age)세 \(name)입니다")
    }
}

var jjudy2: Person = Person()
jjudy2.name = "쭈디"
jjudy2.age = 24
jjudy2.from = "천안"
jjudy2.selfIntroduce()

