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


// - 강제추출
// : 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼냄!
// -> 만약 값이 없을 경우(nil) 런타임 오류가 발생하기 때문에 추천하지 않음
var myName2: String? = "yagom"
var yourName2: String! = nil
printName(myName2!)

myName2 = nil
// print(myName2!)
// 강제 추출시 값이 없기 때문에 런타임 오류 발생

yourName = nil
// printName(yourName)
// nil 값이 전달되기 때문에 런타임 오류 발생


// 정말 꼭 필요한 경우에 한하여, 내가 책임질 수 있는 상ㄹ황이 아니라면 옵셔널 강제추출을 사용하지 말기~~~!!
