open class Duck(fl: FlyBehavior, qb: QuackBehavior) {

    private var flyBehavior : FlyBehavior = fl
    private var quackBehavior : QuackBehavior = qb

    fun swim() {
        println("swimming...")
    }
    open fun display(name : String = String()) {
        print(name)
    }
    fun performFly() {
        flyBehavior.fly()
    }
    fun performQuack() {
        quackBehavior.quack()
    }

    @JvmName("setFlyBehavior1")
    fun setFlyBehavior(fl : FlyBehavior) {
        flyBehavior = fl
    }
}

class ReadHeadDuck(fl: FlyBehavior = FlyNoWay(), qb: QuackBehavior = MuteQuack()) : Duck(fl, qb) {

    override fun display(name: String) {
        super.display("Read Head Duck: ")
    }

}

class MallardDuck(fl: FlyBehavior = FlyNoWay(), qb: QuackBehavior = MuteQuack()) : Duck(fl, qb) {

    override fun display(name: String) {
        print("Mallard Duck: ")
    }

}

fun main() {

    val readHeadDuck = ReadHeadDuck(FlyWithWings(), Quack())
    val mallardDuck = MallardDuck(qb = Quack())

    readHeadDuck.display()
    readHeadDuck.performFly()
    readHeadDuck.performQuack()
    readHeadDuck.setFlyBehavior(FlyNoWay())
    readHeadDuck.performFly()

    mallardDuck.display()
    mallardDuck.performFly()
    mallardDuck.performQuack()
    mallardDuck.setFlyBehavior(FlyWithWings())
    mallardDuck.performFly()

}