import Cocoa

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Bark bark bark")
    }
    init() {
        super.init(legs: 4)
    }
}

class Cat: Animal {
    var isTame: Bool
    func speak() {
        print("Meow Meow Meow")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    override func speak() {
        print("Bark Bark Bark Bark")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Bark Bark Bark Bark Podly")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meow Meow Meow")
    }
    init() {
        super.init(isTame: true)
    }
}

class Lion: Cat {
    override func speak() {
        print("Meow Meow Meow like Lion")
    }
    init() {
        super.init(isTame: false)
    }
}

let kitty = Lion()

kitty.speak()
