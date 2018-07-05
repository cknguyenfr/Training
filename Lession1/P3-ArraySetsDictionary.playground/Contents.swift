//3 Array-Sets-Dictionary
//array can have the same value
let arrayAnimals = ["Dog", "Chicken", "Duck", "Snake", "Eagle", "Taigaa", "Eagle", "Duck"]
//sets can not have the same value
//Although, defining the same value Duck in setsAnimalHaveWings
//But the actual print result only have 3 value distinc
let setsAnimalsHaveWings : Set<String> = ["Chicken", "Duck", "Eagle", "Duck"]
let setsAnimalsRandom : Set<String> = ["Chicken", "Dog", "Duck"]
for animal in setsAnimalsHaveWings{
    print("animal(\(setsAnimalsHaveWings.count))-set-\(animal)")
}
//Specify operation with sets
let intersectionResult = setsAnimalsRandom.intersection(setsAnimalsHaveWings)
for animal in intersectionResult{
    print("animal-intersection-\(animal)")
}

//Dictionary
//Following the print-result, dictionary do not have specified order
let sampleDic = [
    "one" : 1,
    "two" : 2,
    "three" : 3,
    "four" : 4
]
for key in sampleDic.keys{
    print("Dictionary with key(\(key)) has value(\(sampleDic[key]!))")
}


