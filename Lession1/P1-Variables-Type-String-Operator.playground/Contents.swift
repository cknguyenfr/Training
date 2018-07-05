//: Playground - noun: a place where people can play
//1.1
let maximumOfPlayer = 10
//Because maximumOfPlayer is a constant and is declared by "let"
//so maximumOfPlayer can only assign only one and use in many places
//
//maximumOfPlayer = 20 >> error
var currentPlayer : Int?
print("aa: \(String(describing: currentPlayer))")
print("================================================")
//================================================

//1.2 Tuple
//The simple declaration of tuple
let httpNotFoundError = (404, "NOT FOUND")
let (errorCode, errorDes) = (404, "NOT FOUND")
let someone = (name: "Kane", age: 24)
print("the error code: \(httpNotFoundError.0) and its description: \(httpNotFoundError.1)")
print("the error code: \(errorCode) and its description: \(errorDes)")
print("someone's name: \(someone.name) and age: \(someone.age) years old")
print("================================================")
//================================================

//1.3 Optional
//a simple Optional with default value
var optionValue : Int? = 100
print("value: \(optionValue ?? 1)")
optionValue = nil
//when to use ! and ?
let nonOptionalValue : String!
nonOptionalValue = "this is non optional value"
print(nonOptionalValue)
//because of result of max function is optional
var maxOfArray : Any?
var arrayInt = [1, 2, 3]
maxOfArray = arrayInt.max()
print("value = \(maxOfArray)")
arrayInt.removeAll()
maxOfArray = arrayInt.max()
print("value after remove all = \(maxOfArray)")
print("================================================")
//================================================
