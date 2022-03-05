import Swift

// *** 프로퍼티 감시자 ***
//
// 1. 프로퍼티 감시자 ================================
// - 프로퍼티 감시자를 사용하면 프로퍼티의 값이 변경될 때 원하는 동작을 수행할 수 있다
// - 값이 변경되기 직전에 willSet블럭이, 값이 변경된 직후에 didSet 블럭이 호출된다
// - 둘 중 필요한 하나만 구현해줘도 무관하다!!
// - willSet 블럭에서는 암시적 매개변수 "newValue"를, didSet 블럭에서는 "oldValue"를 사용할 수 있다
// - 프로퍼티 감시자는 연산 프로퍼티에는 사용할 수 없다
// - 프로퍼티 감시자는 함수, 메소드, 클로저, 타입 등의 지역/전역 변수에 모두 사용 가능하다



// 2. 정의 및 사용 ==================================
struct Money
{
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100
    {
        willSet(newRate)
        {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate)
        {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }
    
    
    // 프로퍼티 감시자 사용
    var dollar: Double = 0
    {
        // willSet의 암시적 매개변수 이름 newValue
        willSet
        {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        didSet
        {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }
    
    
    // 연산 프로퍼티
    var won: Double
    {
        get
        {
            return dollar * currencyRate
        }
        set
        {
            dollar = newValue / currencyRate
        }
        
        /*
        willSet // 컴파일 오류!
        {
            // 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없다
        }
        */
    }
}

var moneyInMyPocket: Money = Money()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket.currencyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다

// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다

print(moneyInMyPocket.won)
// 11500.0
