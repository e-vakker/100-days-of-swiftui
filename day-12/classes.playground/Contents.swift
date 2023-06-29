import Cocoa

//How to create your own classes

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


//How to make one class inherit from another

class Employee {
    let hours: Int
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
    
    init(hours: Int) {
        self.hours = hours
    }
}
// if you know for sure that your class should not support inheritance, you can mark it as final. This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()
robert.printSummary()

// How to add initializers for classes

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)


//How to copy classes

//In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

class User {
    var username = "Anonymous"
    //    If you want to create a unique copy of a class instance – sometimes called a deep copy – you need to handle creating a new instance and copy across all your data safely.
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }

}

var user1 = User()

var user3 = User()
user3.username = "Not Taylor"

var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)
print(user3.username)

// How to create a deinitializer for a class


var users:[User2] = []

class User2 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User2(id: i)
    users.append(user)
    print("User \(user.id): I'm in control!")
}
print("Loop is finished")
users.removeAll()

print("Array is clear")

// How to work with variables inside classes

class User3 {
    var name = "Paul"
}

var user = User3()
user.name = "Taylor"
user = User3()
print(user.name)
//So, we end up with four options:
//
//Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
//Constant instance, variable property – a signpost that always points to the same user, but their name can change.
//Variable instance, constant property – a signpost that can point to different users, but their names never change.
//Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.
