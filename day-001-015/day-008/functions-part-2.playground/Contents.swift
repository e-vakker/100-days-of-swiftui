import Cocoa

// How to provide default values for parameters.

// Sample
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.capacity)
characters.removeAll()
print(characters.capacity)


characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.capacity)
characters.removeAll(keepingCapacity: true)
print(characters.capacity)
