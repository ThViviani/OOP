import UIKit

protocol FlyBehavior {
    func fly()
}

protocol QuackBehavior {
    func quack()
}

class Duck{
    
    private var flBehavior: FlyBehavior?
    private var quBehavior: QuackBehavior?
    
    init(flyBehavior: FlyBehavior?, quackBehavior: QuackBehavior?) {
        flBehavior = flyBehavior ?? nil
        quBehavior = quackBehavior ?? nil
    }
    
    func swim() {
        print("swiming...")
    }
    
    func display() {
        print("Duck!")
    }
    
    func performFly() {
        if let fl = flBehavior {
            fl.fly()
        }
    }
    
    func performQuack() {
        if let qk = quBehavior {
            qk.quack()
        }
    }
}

class NoFly: FlyBehavior {
    func fly() {
        print("I can't fly!")
    }
}

class SimpleFly: FlyBehavior {
    func fly() {
        print("Fly!")
    }
}

class LoudlyQuack: QuackBehavior {
    func quack() {
        print("Quack!")
    }
}

class NoQuack: QuackBehavior {
    func quack() {
        print("...")
    }
}

class RedDuck: Duck {
    override func display() {
        print("I'm red Duck!")
    }
}

let redDuck = RedDuck(flyBehavior: NoFly(), quackBehavior: NoQuack())
redDuck.performFly()
redDuck.performQuack()
redDuck.swim()
redDuck.display()

print()

let duck = Duck(flyBehavior: SimpleFly(), quackBehavior: LoudlyQuack())
duck.performQuack()
duck.performFly()
duck.display()

