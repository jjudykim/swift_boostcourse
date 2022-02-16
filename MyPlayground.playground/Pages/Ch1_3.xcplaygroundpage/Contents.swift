import Swift


// 1. 상수와 변수 선언 ====================
// 상수 선언 키워드 let
// 변수 선언 키워드 var

// 상수의 선언
// let 이름: 타입 = 값
let constant: String = "차후에 변경이 불가능한 변수 let"

// 변수의 선언
// var 이름 : 타입 = 값
var variable: String = "차후에 변경이 가능한 변수 var"

variable = "변수는 이렇게 차후에 다른 값을 할당할 수 있지만"
//constant = "상수는 차후에 값을 변경할 수 없다" -> 오류 발생


// 2. 상수를 선언 한 후 나중에 할당하기 =============
let sum: Int
let inputA: Int = 100
let inputB: Int = 200

// 선언 후 첫 할당
sum = inputA + inputB

// sum의 값을 바꿔본다면?
// sum = 1 -> 오류 발생

// 변수도 차후에 할당하는 것이 가능하다
var nickName: String

nickName = "jjudy"

// 변수는 차후에 다시 다른 값을 할당해도 문제 없음!
nickName = "쭈디"



// 생각해보기 ====================
// 다음과 같은 경우에 각 값은 상수와 변수 중 어느 것으로 선언하는 것이 더 좋을까?
// 1. name = "yagom" -> let
// 2. numberToAdd = 5 -> var
// 3. pi = 3.141592 -> let
// 4. maxItemCount = 1000 -> var
