import Cocoa

let employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee["name"]!) // Force Unwrapped
print(employee["job"]!) // Force Unwrapped
print(employee["location"]!) // Force Unwrapped

print(employee["name"] ?? "Unknown")
print(employee["job", default: "Unknown"])
print(employee["location"] ?? "Unknown")

print(employee.count)
print(employee.keys)
print(employee.values)


let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

print(archEnemies)

archEnemies.removeAll()

print(archEnemies)
