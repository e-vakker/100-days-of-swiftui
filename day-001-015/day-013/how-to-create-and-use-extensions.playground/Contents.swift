import Cocoa

var quote = "   The truth is rarely pure and never simple   "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

/*
 Let’s break that down…
 
 We start with the extension keyword, which tells Swift we want to add functionality to an existing type.
 Which type? Well, that comes next: we want to add functionality to String.
 Now we open a brace, and all the code until the final closing brace is there to be added to strings.
 We’re adding a new method called trimmed(), which returns a new string.
 Inside there we call the same method as before: trimmingCharacters(in:), sending back its result.
 Notice how we can use self here – that automatically refers to the current string. This is possible because we’re currently in a string extension.
 */

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let trimmed2 = quote.trimmed()

// Well, the truth is that we could have written a function like this:
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed3 = trim(quote)

/*
 However, the extension has a number of benefits over the global function, including:
 
 When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
 Writing global functions makes your code rather messy – they are hard to organise and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending.
 Because your extension methods are a full part of the original type, they get full access to the type’s internal data. That means they can use properties and methods marked with private access control, for example.
 */

/*
 For example, earlier we wrote a trimmed() method that returns a new string with whitespace and newlines removed, but if we wanted to modify the string directly we could add this to the extension:
 */
extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

quote.trim()

/*
 Notice how the method has slightly different naming now: when we return a new value we used trimmed(), but when we modified the string directly we used trim(). This is intentional, and is part of Swift’s design guidelines: if you’re returning a new value rather than changing it in place, you should use word endings like ed or ing, like reversed().
 */

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)
/*
 If Swift were to keep the memberwise initializer in this instance, it would skip our logic for calculating the approximate reading time.
 
 However, sometimes you want both – you want the ability to use a custom initializer, but also retain Swift’s automatic memberwise initializer. In this situation it’s worth knowing exactly what Swift is doing: if we implement a custom initializer inside our struct, then Swift disables the automatic memberwise initializer.
 
 That extra little detail might give you a hint on what’s coming next: if we implement a custom initializer inside an extension, then Swift won’t disable the automatic memberwise initializer. This makes sense if you think about it: if adding a new initializer inside an extension also disabled the default initializer, one small change from us could break all sorts of other Swift code.
 
 So, if we wanted our Book struct to have the default memberwise initializer as well as our custom initializer, we’d place the custom one in an extension, like this:
 */

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

let lotr2 = Book(title: "Lord of the Rings", pageCount: 1178)







