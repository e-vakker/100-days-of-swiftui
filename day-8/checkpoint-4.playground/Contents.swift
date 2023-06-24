import Cocoa

enum LimitSquareRootsErrors: Error {
    case outOfBounds, noRoot
}

func squareRoot (_ number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw LimitSquareRootsErrors.outOfBounds
    }
    
    var searchSquareRoot = 1
    
    while searchSquareRoot * searchSquareRoot != number {
        searchSquareRoot += 1
        if searchSquareRoot >= 100 {
            throw LimitSquareRootsErrors.noRoot
        }
    }
    return searchSquareRoot
}

let testNumber = 10
do {
    let result = try squareRoot(testNumber)
    print(result)
} catch LimitSquareRootsErrors.outOfBounds {
    print(LimitSquareRootsErrors.outOfBounds.self)
} catch LimitSquareRootsErrors.noRoot {
    print(LimitSquareRootsErrors.noRoot.self)
} catch {
    print("Error")
}

