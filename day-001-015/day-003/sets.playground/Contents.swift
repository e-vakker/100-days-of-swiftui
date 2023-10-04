import Cocoa

//Set it's a type where you can't store duplicate items and they don't store items in a particular order.

let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson", "Samuel L Jackson", "Samuel L Jackson", "Samuel L Jackson"])

print(people)


var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")
people2.insert("Brad Pitt")
people2.insert("Brad Pitt")
people2.insert("Brad Pitt")
people2.insert("Brad Pitt")

print(people2)


var sortedArray = people2.sorted()

people2.contains("Brad Pitt")
