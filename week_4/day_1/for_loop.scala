def forLoop {
  println("for using Java-style iteration")
  for(i <- 0 until args.length) {
    println(args(i))
  }
}

def rubyForLoop {
  println("for using Ruby-style iteration")
  args.foreach { arg => 
    println(arg)
  }
}

forLoop
rubyForLoop
