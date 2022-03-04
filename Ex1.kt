fun main() {

    var duck = Duck()
    var red_duck = ReadheadDuck()
    var marrlad_duck = MarlladDuck()

    duck.display()
    duck.quack()
    duck.swim()

    red_duck.display()
    red_duck.quack()
    red_duck.swim()

    marrlad_duck.display()
    marrlad_duck.quack()
    marrlad_duck.swim()

}

open class Duck() {

    fun quack() {
        println("QUACK!QUACK!QUACK!")
    }

    fun swim() {
        println("swimming...")
    }

    open fun display() {
        println("It's Duck")
    }
}

class ReadheadDuck() : Duck() {

    override fun display() {
        println("It's ReadheadDuck!")
    }
}

class MarlladDuck() : Duck() {

    override fun display() {
        println("It's MarlladDuck!")
    }

}