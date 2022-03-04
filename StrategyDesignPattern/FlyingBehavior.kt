interface FlyBehavior {
    fun fly()
}

class FlyWithWings : FlyBehavior {

    override fun fly() {
        print("Flying...")
        println()
    }

}

class FlyNoWay : FlyBehavior {

    override fun fly() {
        print("...")
        println()
    }

}