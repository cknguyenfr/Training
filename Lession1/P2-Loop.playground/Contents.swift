//2.1
//If let
var codeResultFromApi : Int?
print("Before assign value for variable: ")
if let code = codeResultFromApi, code == 101 {
    print("code result from api: \(code)")
}else{
    print("code error")
}
print("After assign value for variable: ")

codeResultFromApi = 101
if let code = codeResultFromApi, code == 101 {
    print("code result from api: \(code)")
}else{
    print("code error")
}
//
//Guard let
let givenName = "Can", middleName : String? = "Khac", familyName = "Nguyen"
var displayName: String {
    guard let middleName = middleName else {
        return givenName + " " + familyName
    }
    return givenName + " " + middleName + " " + familyName
}
print("Display name : \(displayName)")
print("================================================")
//================================================

//2.2 Loop
//Loop in range
for x in 0...2{
    print("index: \(x)")
}
//Loop in array
let names = ["Son", "Dong", "Hai", "Long", "Vuong", "Nguyen", "Hung", "Truong"]
for name in names[1...4]{
    print("name: \(name)")
}
//Loop .forEach
names.forEach { (name) in
    print("each name: \(name)")
}
//2.3 while loop
var i = 0
while(true){
    print("i: \(i)")
    i += 1
    if i == 3{
        break
    }
}
print("================================================")
//================================================
