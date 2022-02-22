import Swift

// *** 옵셔널 추출 ***
//
// 1. 옵셔널 추출이란?
// : 옵셔널에 들어있는 값을 사용하기 위해 꺼내오는 것
//
//
// 2. 옵셔널 방식
// - 옵셔널 바인딩
// 1) nil 체크함과 동시에 안전하게 값을 추출!
// 2) 옵셔널 안에 값이 들어있는지 확인 -> 값이 있으면 꺼내온다!
// 3) if-let 방식 사용

func printName(_ name: String)
{
    print(name)
}

var myName: String? = nil

// 아래의 경우에는 전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생
// printName(myName)

if let name: String = myName
{
    printName(name)
} else
{
    print("myName == nil")
}


var yourName: String! = nil

if let name: String = yourName
{
    printName(name)
} else
{
    print("yourName == nil")
}
// name 상수는 if-let 구문 내에서만 사용가능하다
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
// printName(name)


// ,를 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있다
// 모든 옵셔널에 값이 있을 때만 동작한다
myName = "yagom"
yourName = nil

if let name = myName, let friend = yourName
{
    print("\(name) and \(friend)")
}
else
{
    print("my name or friend's name is nill")
}
// yourName이 nil이기 때문에 실행되지 않는다

yourName = "hana"

if let name = myName, let friend = yourName
{
    print("\(name) and \(friend)")
}
