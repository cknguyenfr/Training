class Person{
    var id : Int;
    var name : String;
    var dateOfBirth : String;
    
    init(id: Int, name: String, dateOfBirth: String) {
        self.dateOfBirth = dateOfBirth
        self.name = name
        self.id = id
    }
    
    func talk(){
        print("Person (\(name)) is talking")
    }
}
class Staff: Person {
    var salary : Float
    
    init(id: Int, name: String, dateOfBirth: String, salary: Float) {
        self.salary = salary
        super.init(id: id, name: name, dateOfBirth: dateOfBirth)
    }
    override func talk() {
        print("Staff (\(name)) is talking")
    }
}

