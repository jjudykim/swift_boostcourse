import Swift

// *** 상속 ***
//
// 1. 스위프트 상속 ====================
// - 상속은 클래스, 프로토콜 등에서 가능하다
// - 열거형, 구조체는 상속이 불가능하다
// - 스위프트의 클래스는 단일상속으로, 다중상속을 지원하지 않는다
// - 이번 파트에서는 클래스의 상속에 대해 알아보도록 하자!!



// 2. 문법 ==========================
// class 이름: 상속받을클래스이름
// {
//     // 구현부
// }



// 3. 사용 ==========================
// - final 키워드를 사용하면 재정의(override)
// - static 키워드를 사용해 타입 메소드를 만들면 재정의가 불가능하다
// - class 키워드를 사용해 타입 메소드를 만들면 재정의가 가능하다
// - class 앞에 final을 붙이면 static 키워드를 사용한 것과 동일하게 동작한다
// - override 키워드를 사용해 부모 클래스의 메소드를 재정의할 수 있다

// 기반 클래스 Person
class Person
{
    var name: String = ""
    
    func selfIntroduce()
    {
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용해 재정의를 방지할 수 있다
    final func sayHello()
    {
        print("hello")
    }
    
    // 타입 메소드
    // 재정의 불가 타입 메소드 - static
    static func typeMethod()
    {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메소드 - class
    class func classMethod()
    {
        print("type method - class")
    }
    
    // 재정의 가능한 class 메소드라도 final 키워드를 사용하면 재정의할 수 없다
    // 메소드 앞의 'static'과 'final class'는 똑같은 역할을 한다
    final class func finalClassMethod()
    {
        print("type method - final class")
    }
}

// Person을 상속받는 Student
class Student: Person
{
    var major: String = ""
    
    override func selfIntroduce()
    {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classMethod()
    {
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메소드는 재정의할 수 없다
    // override static func typeMethod() {}
    
    // final 키워드를 사용한 메소드, 프로퍼티는 재정의할 수 없다
    // override func sayHello() {}
    // override class func finalClassMethod() {}
}



// 4. 구동 확인 ===============================
let jjudy: Person = Person()
let hana: Student = Student()

jjudy.name = "jjudy"
hana.name = "hana"
hana.major = "Swift"

jjudy.selfIntroduce()

hana.selfIntroduce()

Person.classMethod()

Person.typeMethod()

Person.finalClassMethod()

Student.classMethod()

Student.typeMethod()

Student.finalClassMethod()
