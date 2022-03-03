import Swift

// *** 클로저 고급 - 다양한 클로저 표현 ***
//
// 클로저는 아래 규칙을 통해 다양한 모습으로 표현될 수 있다
// 1. 후행 클로저 : 함수의 매개변수 마지막으로 전달되는 클로저는 후행클로저(trailing closure)로 함수 밖에 구현할 수 있다
// 2. 반환타입 생략 : 컴파일러가 클로저의 타입을 유추할 수 있는 경우 매개변수, 반환 타입을 생략할 수 있다
// 3. 단축 인자 이름 : 전달인자의 이름이 굳이 필요없고, 컴파일러가 타입을 유추 가능하면 축약된 전달인자 이름($0, $1, $2...)을 사용할 수 있다
// 4. 암시적 반환 표현 : 반환 값이 있는 경우, 암시적으로 클로저의 맨 마지막 줄은 return 키워드를 생략하더라도 반환 값으로 취급한다



// 기본 클로저 표현
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}
// -> 클로저를 매개변수로 갖는 함수 calculated(a:b:method:)와 결과값을 저장할 변수 result 선언

var result: Int

// 1. 후행 클로저
// : 클로저가 함수의 마지막 전달인자일때, 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있다
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}
print(result)


// 2. 
