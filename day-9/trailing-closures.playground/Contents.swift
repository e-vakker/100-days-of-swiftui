import Cocoa

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstTeam)

let captainFirstTeam2 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

print(captainFirstTeam2)

let reverseTeam = team.sorted {
    return $0 > $1
}

let reverseTeam2 = team.sorted {$0 > $1 }

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


// Closure as a parameter
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}
// Best way for call closure
animate(duration: 3) {
    print("Fade out the image")
}

