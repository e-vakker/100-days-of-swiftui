import Cocoa

enum Weekday {
    case monday
    case thuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}


var day = Weekday.friday
day = .sunday

print(day.self)

enum Month {
    case january, february, march, april, may, june, july, august, september, october, november, december
}

var month: Month = .february

print(month.self)
