object Main extends App {
  def sum(xs: List[Int]): Int = xs match {
    case Nil => 0
    case x :: tail => x + sum(tail)
  }

  def sumIter(ints: List[Int]) = {
    var sum = 0
    for(num <- ints) {
      sum += num
    }
    sum
  }

  val list = (1 to 1000000).toList

  // println(s"Recursive method: ${sum(list)}") // This overflows!
  println(s"Iterative method: ${sumIter(list)}")
}
