import Swift

// *** assert/guard ***
//
// 1. Assertion ==========================
// # assert 문은 특정 조건을 체크하고, 조건이 성립되지 않으면 메세지를 출력하게 할 수 있다
// # 실제 배포된 앱 성능에는 영향을 끼치지 않는다는 특징이 있다!
// - assert(_:_:file:line:) 함수를 사용한다
// - 체크할 조건문 / 조건 미충족시 메세지 / 메세지 출력할 파일 / 출력할 메세지 라인 수
// - 첫번째 인자인 조건문만 넣어서 체크할 수 있다! (나머지 인자값은 디폴트 설정이 되어있기 때문)
// - assert 함수는 디버깅 모드에서만 작동한다
// - 배포하는 애플리케이션에서는 제외된다
// - 예상했던 조건의 검증을 위해 사용한다
var someInt: Int = 0

// 검증 조건과 실패시 나타날 문구를 작성해 준다
assert(someInt == 0, "someInt != 0")
// 검증 조건에 부합하므로 지나간다

someInt = 1
// assert(someInt == 0) // 동작 중지, 검증 실패
// assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패
// Assertion failed: someInt != 0 출력

func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
    print("당신의 나이는 \(age!)세 입니다")
}

functionWithAssert(age: 50)
// functionWithAssert(age: -1) // 동작 중지, 검증 실패
// functionWithAssert(age: nil) // 동작 중지, 검증 실패

// -> assert(_:_:file:line:)와 같은 역할을 하지만 실제 배포 환경에서도 동작하는 "precondition(_:_:file:line:) 함수"도 있으니 같이 살펴보기!




// 2. guard(빠른 종료 - Early Exit) =========================
// - guard를 사용해 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료한다
// - guard문은 조건들을 걸러낼 때 사용하는데, if와 다른 점은 조건식에 이 함수가 수행하는데 필요하는 조건을 그대로 적는다는 점이다
// - 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작한다
// - guard의 else 블럭 내부에는 특정 코드블럭을 종료하는 지시어(return, break 등)가 꼭 있어야 한다
// - "타입 캐스팅, 옵셔널"과도 자주 사용된다
// - 그 외에도 단순 조건 판단 후 빠르게 종료할 때도 용이하다
func functionWithGuard(age: Int?) {
    guard let unwrappedAge = age,
          unwrappedAge < 130,
          unwrappedAge >= 0 else {
              print("나이값 입력이 잘못되었습니다")
              return
          }
    print("당신의 나이는 \(unwrappedAge)세 입니다")
}
//
//
var count = 1

while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    
    print("\(name): \(age)")
}

someFunction(info: ["name": "jenny", "age": "10"])
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "jjudy", "age": 10]) // jjudy: 10




// 추가 ==================================
// if let과 guard를 이용한 옵셔널 바인딩 비교
// 1) if let 옵셔널 바인딩
if let unwrapped: Int = someValue {
    // do something
    unwrapped = 3
}
// unwrapped = 5
// if 구문 외부에서는 unwrapped 사용이 불가능하다
//
//
// 2) guard 옵셔널 바인딩
// guard 구문 이후에도 unwrapped 사용 가능하다
guard let unwrapped: Int = someValue else {
    return
}
unwrapped = 3
