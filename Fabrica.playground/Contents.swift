import UIKit


class Pizza {
    var name: String
    var dough: String
    var sauce: String
    var toppings: Array<String>

    func prepare() {
        print("Preparing " + name)
        print("Tossing dough...")
        print("Adding sauce...")
        print("Adding toppings: ")
        for topping in toppings {
            print("\(topping)")
        }
    }

    func bake() {
        print("Bake for 25 mitutes at 350")
    }

    func cut() {
        print("Cutting th pizza into diagonal slices")
    }

    func box() {
        print("Place pizza in official PizzaStore box")
    }
    
    init() {
        self.name = ""
        self.dough = ""
        self.sauce = ""
        self.toppings = []
    }
}

protocol PizzaStore {
    func createPizza(_ type: String) -> Pizza?
}

extension PizzaStore {
    func orderPizza(_ type: String) -> Pizza? {
        let pizza = createPizza(type)
        
        pizza?.prepare()
        pizza?.bake()
        pizza?.cut()
        pizza?.box()
        return pizza
    }
}

class NewYorkPizzaStore: PizzaStore {
    func createPizza(_ type: String) -> Pizza? {
        switch type {
            case "cheese":
                return NewYorkStyleCheesePizza()
            default:
                return nil
        }
    }
}

class ChicagoPizzaStore: PizzaStore {
    func createPizza(_ type: String) -> Pizza? {
        switch type {
            case "cheese":
                return ChicagoStyleCheesePizza()
            default:
                return nil
        }
    }
}

class NewYorkStyleCheesePizza: Pizza {
    override init() {
        super.init()
        self.name = "NY style Sauce and Cheese Pizza"
        self.dough = "Thin Crust Dough"
        self.sauce = "Marinara Sauce"
        self.toppings.append("Grated Reggiano Cheese")
    }
}

class ChicagoStyleCheesePizza: Pizza {
    override init() {
        super.init()
        self.name = "Chicago Style Deep Dish Cheese Pizza"
        self.dough = "Extra thick Crust Dough"
        self.sauce = "Plum Tomato Sauce"
        self.toppings.append("Shredded Mozzarella Cheese")
    }
    
    override func cut() {
        print("Cutting the pizza into square slices")
    }
}


let nyPizzaFabrica: NewYorkPizzaStore = NewYorkPizzaStore()
let chPizzaFabrica: ChicagoPizzaStore = ChicagoPizzaStore()

var pizza = nyPizzaFabrica.orderPizza("cheese")
print("Vlad ordered a \(pizza!.name)")

pizza = chPizzaFabrica.orderPizza("cheese")
print("Danil ordered a \(pizza!.name)")

