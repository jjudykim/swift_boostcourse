import Swift
import Foundation

// *** 반복문 ***
//
// for-in
// while
// repeat-while
//
// 1. for-in 구문
// - 기존 언어의 for-each 구문과 유사함
// - Dictionary의 경우 이터레이션 아이템으로 튜플이 들어옴 (apple 문서의 튜플 부분 참조)
// - for-in 구문 기본 형태
// for item in items {
// 실행 구문
// }
//
var integers = [1, 2, 3]
let people = ["jjudy": 10, "eric": 15, "mike": 12]

for integer in integers
{
    print(integer)
}
//
for (name, age) in people
{
    print("\(name): \(age)")
}
// -> Dictionary의 item은 key와 value로 구성된 튜플 타입이다!


// 2. while 구문
// - while 구문의 기본 형태
// while 조건 {
// 실행구문
// }
//
while integers.count > 1
{
    integers.removeLast()
}


// 3. repeat-while 구문
// - 기존 언어의 do-while 구문과 형태/동작이 유사함
// - repeat-while 구문의 기본 형태
// repeat {
// 실행구문
// } while 조건
//
repeat
{
    integers.removeLast()
} while integers.count > 0
