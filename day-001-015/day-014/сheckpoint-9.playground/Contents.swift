import Cocoa

let testArray: [Int]? = nil

func randomNumber(numbers:[Int]?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}

randomNumber(numbers: testArray)
