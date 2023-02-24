object Main extends App {
  val list = List("ruben", "eva", "salvador")

  val firstAttempt = list.foldLeft(0)(_ + _.size)
  println(s"First attempt gave: ${firstAttempt}")

  // Or
  def sumLengths(acc: Int, name: String): Int = acc + name.size
  // Scala can also infer the return type correctly
  // val sumLengths(acc: Int, name: String) = acc + name.size
  val secondAttempt = list.foldLeft(0)(sumLengths)
  println(s"Second attempt gave: ${secondAttempt}")
}
