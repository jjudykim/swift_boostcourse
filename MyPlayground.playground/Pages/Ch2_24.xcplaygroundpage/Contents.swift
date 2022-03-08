import Swift

// *** 타입 캐스팅 ***
//
// 1. 스위프트 타입 캐스팅 =======================
// - 인스턴스의 타입을 확인하는 용도
// - 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도
// - is, as를 사용한다




// 2. 예제 클래스 ==============================
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다! 신난다 잇힝~")
    }
}

// 인스턴스 생성
var jjudy: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()


// 타입 확인해보기
// - is를 사용해 타입을 확인하기
var result: Bool

result = jjudy is Person
result = jjudy is Student
result = jjudy is UniversityStudent

result = hana is Person
result = hana is Student
result = hana is UniversityStudent

result = jason is Person
result = jason is Student
result = jason is UniversityStudent

if jjudy is UniversityStudent {
    print("jjudy는 대학생입니다")
} else if jjudy is Student {
    print("jjudy는 학생입니다")
} else if jjudy is Person {
    print("jjudy는 사람입니다")
}

switch hana {
case is Person:
    print("hana는 사람입니다")
case is Student:
    print("hana는 학생입니다")
case is UniversityStudent:
    print("hana는 대학생입니다")
default:
    print("hana는 사람도, 학생도, 대학생도 아닙니다")
}

switch hana {
case is UniversityStudent:
    print("hana는 대학생입니다")
case is Student:
    print("hana는 학생입니다")
case is Person:
    print("hana는 사람입니다")
default:
    print("hana는 사람도, 학생도, 대학생도 아닙니다")
}




// 3. 업 캐스팅(Up Casting) ==========================
// - as를 사용해 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입 정보를 전환해준다
// - Any 혹은 AnyObject로도 타입 정보를 변환할 수 있다
// - 암시적으로 처리되므로 꼭 필요한 경우가 아니라면 생략해도 무방하다

// UniversityStudent 인스턴스를 생성해 Person 행세를 할 수 있도록 업캐스팅!
var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
// var jina: UniversityStudent = Person() as UniversityStudent       // 컴파일 오류

// UniversityStudent 인스턴스를 생성해 Any 행세를 할 수 있도록 업캐스팅
var jina: Any = Person() // as Any 생략 가능




// 4. 다운 캐스팅(Down Casting) ========================
// : as? 또는 as!를 사용해 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입 정보를 전환해준다
//
// @ 조건부 다운 캐스팅
// - as?를 사용한다
// - 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 "nil을 반환"하기 때문에 "결과의 타입이 옵셔널 타입"이다
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent // UniversityStudent를 UniversityStudent로 다운 캐스팅
optionalCasted = jenny as? UniversityStudent // Student를 UniversityStudent로 다운 캐스팅? -> 불가능, 즉 nil
optionalCasted = jina as? UniversityStudent // Person을 UniversityStudent로 다운 캐스팅? -> 불가능, 즉 nil
optionalCasted = jina as? Student // Person을 Student로 다운 캐스팅? -> 불가능, 즉 nil


// @ 강제 다운 캐스팅
// - as!를 사용한다
// - 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 런타임 오류가 발생한다
// - 캐스팅에 성공하면 옵셔널이 아닌 일반 타입을 반환한다
var forcedCasted: Student

forcedCasted = mike as! UniversityStudent // UniversityStudent를 UniversityStudent로 강제 다운 캐스팅
// forcedCasted = jenny as! UniversityStudent // Student를 UniversityStudent로 강제 다운 캐스팅이 되지 않으므로 런타임 오류
// forcedCasted = jina as! UniversityStudent // Person을 UniversityStudent로 강제 다운 캐스팅이 되지 않으므로 런타임 오류
// forcedCasted = jina as! Student // Person을 Student로 강제 다운 캐스팅이 되지 않으므로 런타임 오류




// 5. 활용 ================================
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT() // 멤버쉽 트레이닝을 갑니다! 신난다 잇힝~
    case is Student:
        (someone as! Student).goToSchool() // 등교를 합니다
    case is Person:
        (someone as! Person).breath() // 숨을 쉽니다
    }
}

doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다! 신난다 잇힝~
doSomethingWithSwitch(someone: mike) // 멤버쉽 트레이닝을 갑니다! 신난다 잇힝~
doSomethingWithSwitch(someone: jenny) // 등교를 합니다
doSomethingWithSwitch(someone: jjudy) // 숨을 쉽니다

func doSomething(someone: Person) {
    if let universityStudent = someone as? universityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다! 신난다 잇힝~
doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다! 신난다 잇힝~
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: jjudy) // 숨을 쉽니다
