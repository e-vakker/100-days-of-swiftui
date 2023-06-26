import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)


struct Employee2 {
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken: Int = 0
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer2 = Employee2(name: "Sterling Archer")
archer2.vacationTaken += 2
print(archer2.vacationRemaining)
archer2.vacationTaken += 2
print(archer2.vacationRemaining)
archer2.vacationRemaining = 20
print(archer2.vacationRemaining)
print(archer2.vacationAllocated)
archer2.vacationTaken += 10
print(archer2.vacationRemaining)
print(archer2.vacationAllocated)
archer2.vacationRemaining = 100

// Property observes
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


// Custom initializers

struct Player {
    let name: String
    var score: Int
    
    func printScore() {
        print("\(name) reached \(score) score!")
    }
    
    init(name: String) {
        self.name = name
        score = Int.random(in: 1...1000)
    }
}

var player = Player(name: "Adrian")
player.printScore()


