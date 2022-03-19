import UIKit

protocol Beverage {
    var description: String { get set }
    func getDescription() -> String
    func cost() -> Double
}

protocol CondimentDecorator: Beverage {
    func getDescription() -> String
}

class Expresso: Beverage {
    var description: String
    
    init() {
        self.description = "Expresso"
    }
    
    func getDescription() -> String {
        return description
    }
    
    func cost() -> Double {
        return 1.99
    }
}

class Milk: CondimentDecorator {
    private var bevarage: Beverage
    var description: String
    
    init(with bevarage: Beverage) {
        self.description = "Milk"
        self.bevarage = bevarage
    }
    
    func getDescription() -> String {
        return bevarage.getDescription() + " with " + self.description
    }
    
    func cost() -> Double { return bevarage.cost() + 0.5 }
}

class Whip: CondimentDecorator {
    private var bevarage: Beverage
    var description: String
    
    init(with bevarage: Beverage) {
        self.description = "Whip"
        self.bevarage = bevarage
    }
    
    func getDescription() -> String {
        return bevarage.getDescription() + " with " + self.description
    }
    
    func cost() -> Double { return bevarage.cost() + 0.33 }
}


var bevarage = Whip(with: Milk(with: Expresso()))
bevarage.cost()
bevarage.getDescription()



