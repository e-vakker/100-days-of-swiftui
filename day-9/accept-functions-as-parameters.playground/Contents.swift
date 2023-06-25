import Cocoa

func randomArray(size: Int, generator: () -> Int) -> [Int] {
    var array: [Int] = []
    for _ in 0..<size {
        let newNumber = generator()
        array.append(newNumber)
    }
    return array
}

let array = randomArray(size: 50) {
    Int.random(in: 0...20)
}

print(array)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

