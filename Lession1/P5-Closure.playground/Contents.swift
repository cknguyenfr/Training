
//5.Closure
//Escape closure
var totalOfNumber : (Int, Int) -> Int = {$0 + $1}
print("Total of 6 and 9 is \(totalOfNumber(6,9))")
//Example about concise of Closure
//Base on: https://viblo.asia/p/funtion-tien-hoa-tro-thanh-closure-va-cai-ket-bat-ngo-gGJ59YMJ5X2
//Source: Truong Minh Thang
//Origin function
func greater(first: Double, last: Double) -> Bool {
    return first > last
}
//Closure fully
var greaterClosure: (Double,Double) -> Bool = ({(first, last) -> Bool in
    return first > last
})
//Closure shorten return type
var graterClosureShortenReturnType : (Double,Double) -> Bool = ({(first, last) in
    return first > last
})
//Closure shorten parameter
var graterClosureShortenParameter : (Double,Double) -> Bool = ({
    return $0 > $1
})
//Closure shorten return
var graterClosureShortenReturn : (Double,Double) -> Bool = ({
    $0 > $1
})
//@escaping
func handleDataFromServer(completionHandler: @escaping (_ data: String) -> Void){
    //sthing from server
    completionHandler("result")
}

