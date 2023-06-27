import Cocoa

//How to limit access to internal data using access control?

struct BankAccount {
    // You get read but cannot set a new value
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 2000)
account.withdraw(amount: 1342)
print(account.funds)



//Swift provides us with several options, but when you’re learning you’ll only need a handful:
//
//Use private for “don’t let anything outside the struct use this.”
//                    Use fileprivate for “don’t let anything outside the current file use this.”
//                    Use public for “let anyone, anywhere use this.”


//Static properties and methods

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version
AppData.saveFilename


struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

Employee.example
