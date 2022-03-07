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
