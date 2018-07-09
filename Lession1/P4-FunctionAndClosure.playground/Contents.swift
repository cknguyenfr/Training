//4. Function
//void function
func greet(person: String){
    print("Hello \(person)")
}
//function with no label of arguments
func checkPositive(_ number: Int) -> Bool{
    return number > 0
}
//function with label of arguments
func checkNegative(number: Int) -> Bool{
    return number < 0
}
checkPositive(9)
checkNegative(number: 9)
//function use tuple to return compund value
let numbers = [9, 12, 24, 11, 96]
func findMaxMin(numbers: [Int]) -> (max: Int, min: Int){
    if numbers.count == 0{
        return (0, 0)
    }
    var maximum = numbers[0]
    var minimum = numbers[0]
    for val in numbers{
        if val > maximum{
            maximum = val
        }else if val < minimum{
            minimum = val
        }
    }
    return (maximum, minimum)
}
print("Maximum of numbers is \(findMaxMin(numbers: numbers).max) == Minimum of numbers is \(findMaxMin(numbers: numbers).min)")

