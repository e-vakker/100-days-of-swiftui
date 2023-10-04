import Cocoa

var number: Int?

number = 3

func returnValue(_ number: Int?) -> Int? {
    guard let number else {
        print("Error")
        return nil
    }
    return number
}

returnValue(number)
