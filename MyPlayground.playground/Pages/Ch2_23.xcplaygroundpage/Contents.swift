import Swift

// *** 옵셔널 체이닝과 nil 병합 연산자 ***
//
// 1. 옵셔널 체이닝 ======================
// - 옵셔널 체이닝은 옵셔널의 내부의 내부의 내부로 옵셔널이 연결되어 있을 때 유용하게 활용할 수 있다
// - 매번 nil 확인을 하지 않고 최종적으로 원하는 값이 있는지 없는지 확인할 수 있다
// 예제 클래스 (사람 클래스, 사람이 사는 집 클래스)
// 사람 클래스
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

// 사람이 사는 집 클래스
class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

// 옵셔널 체이닝 사용
let jjudy: Person? = Person(name: "jjudy")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로 결과 타입도 옵셔널이다
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

guardJob(owner: jjudy)
//

// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: jjudy)
// 우리집 경비원은 직업이 없어요


print(jjudy?.home?.guard?.job) // nil
jjudy?.home = apart
print(jjudy?.home) // Optional(Apartment)
print(jjudy?.home?.guard) // nil

// 경비원 할당
jjudy?.home?.guard = superman

print(jjudy?.home?.guard)
print(jjudy?.home?.guard?.name)
print(jjudy?.home?.guard?.job)

jjudy?.home?.guard?.job = "경비원"
                    
                    
                    
                    
// 2. nil 병합 연산자 ========================
// - 중위 연산자 ??
// - Optional ?? Value
// - 옵셔널 값이 nil일 경우, 우측의 값을 반환한다
// - 띄어쓰기에 주의해야 한다
var guardJob: String

guardJob = jjudy?.home?.guard?.job ?? "슈퍼맨"
print(guardJob)
                                
jjudy?.home?.guard?.job = nil

guardJob = jjudy?.home?.guard?.job ?? "슈퍼맨"
print(guardJob)
