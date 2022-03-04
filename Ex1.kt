import fly_behavior.*
import quack_behavior.*

open class Duck {

    protected var flyBehavior : FlyBehavior = FlyNoWay()
    protected var quackBehavior : QuackBehavior = MuteQuack()

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

class ReadHeadDuck : Duck() {

    init {
        flyBehavior = FlyNoWay()
        quackBehavior = Quack()
    }

    override fun display(name: String) {
        super.display("Read Head Duck: ")
    }

}

class MallardDuck : Duck() {

    init {
        flyBehavior = FlyWithWings()
        quackBehavior = Quack()
    }

    override fun display(name: String) {
        print("Mallard Duck: ")
    }

}

class DecoyDuck : Duck() {

    init {
        flyBehavior = FlyWithWings()
        quackBehavior = MuteQuack()
    }

    override fun display(name: String) {
        super.display("Decoy Duck: ")
    }

}

fun main() {

    val readHeadDuck = ReadHeadDuck()
    val mallardDuck = MallardDuck()
    val decoyDuck = DecoyDuck()

    readHeadDuck.display()
    readHeadDuck.performFly()
    readHeadDuck.performQuack()
    readHeadDuck.setFlyBehavior(FlyWithWings())
    readHeadDuck.performFly()

    mallardDuck.display()
    mallardDuck.performFly()
    mallardDuck.performQuack()
    mallardDuck.setFlyBehavior(FlyNoWay())
    mallardDuck.performFly()

    decoyDuck.display()
    decoyDuck.performFly()
    decoyDuck.performQuack()
    decoyDuck.setFlyBehavior(FlyNoWay())
    decoyDuck.performFly()

}