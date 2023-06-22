import Cocoa

var beatles = ["John", "Paul", "George", "Ringo"] // Strings
let numbers = [4, 8, 15, 16, 23, 42] // Ints
var temperatures = [25.3, 28.2, 26.4] // Doubles

var temperatures2: [Double] = [25, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")


beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

//temperatures.append("Chris") Not allowed.

let firstBeatle = beatles[0]
let firstNumber = numbers[0]
//let notAllowed = firstBeatle + firstNumber Not allowed.

// 3 ways to initialize arrays
var scores = Array<Int>()

var scores2: [Int] = []

var scores3 = [Int]()

scores.append(23)
scores.append(56)

scores2.append(64)
scores2.append(89)

scores3.append(24)
scores3.append(98)

print(scores)
print(scores2)
print(scores3)


var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]

print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)


