interface QuackBehavior {
    fun quack()
}

class Quack : QuackBehavior {

    override fun quack() {
        print("Quack!Quack!Quack!\n")
    }

}

class MuteQuack : QuackBehavior {

    override fun quack() {
        println()
    }

}