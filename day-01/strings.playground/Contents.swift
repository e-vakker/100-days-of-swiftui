import Cocoa

var test = "Hello, playground"
var test2 = "Hello \"World\""
var newLine = "\n"

var actor = "Denzel"

var multiLine = """
    Welcome to the swift
    Welcome
Welcome
"""

var image = "image.png"

print(test, test2, newLine, multiLine)


let nameLength = actor.count

actor = actor.uppercased()

print(actor, nameLength)

let isHaveImage = image.hasSuffix(".png")
