import Cocoa

struct Car {
    let brand: String
    let model: String
    let year: Int
    let color: String
    let seatsCount: Int
    private var currentGear: Int
    
    init(brand: String, model: String, year: Int, color: String, seatsCount: Int) {
        self.brand = brand
        self.model = model
        self.year = year
        self.color = color
        self.seatsCount = seatsCount
        currentGear = 1
    }
    
    mutating func upGear() {
        if currentGear < 10 {
            currentGear += 1
            print("Your gear \(currentGear)")
        } else {
            print("You can't pick up a gear. Your gear has reached maximum.")
        }
    }
    
    mutating func downGear() {
        if currentGear > 1 {
            currentGear -= 1
            print("Your gear \(currentGear)")
        } else {
            print("You can't pick up a gear. Your gear has reached minimum.")
        }
    }
    
}

var car = Car(brand: "Mercedes", model: "C300", year: 2020, color: "Black", seatsCount: 3)

car.upGear()
car.upGear()
car.upGear()
car.upGear()
car.upGear()
car.upGear()
car.upGear()
car.upGear()
car.upGear()
car.upGear()
car.downGear()
car.downGear()
car.downGear()
car.downGear()
car.downGear()
car.downGear()
car.downGear()
car.downGear()
car.downGear()
car.downGear()

