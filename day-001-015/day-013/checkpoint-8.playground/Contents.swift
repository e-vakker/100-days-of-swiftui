import Cocoa

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get }
    
    func summary()
}

extension Building {
    func summary() {
        print("Rooms: \(rooms)\nCost: $\(cost.formatted())\nEstate agent: \(estateAgent)")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

var house = House(rooms: 4, cost: 352452, estateAgent: "Bob Smith")
let office = Office(rooms: 24, cost: 325325235, estateAgent: "Joanna Miller")
house.summary()
office.summary()

house.cost = 380000
house.summary()
