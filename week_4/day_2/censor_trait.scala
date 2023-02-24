trait Censor {
  val censored = Map(
    "shoot" -> "pucky",
    "darn" -> "beans",
  )

  def censorWords(words: List[String]): List[String] = {
    def censor(word: String) = if (censored.get(word) != None) censored(word) else word
    words.map(censor)
  }
}

class Post(val words: List[String]) extends Censor {
  val text = censorWords(words)
}

val words = List("a", "whole", "bunch", "of", "shoot", "darn", "words!")
val p = new Post(words)
println(p.text)
