package example

import akka.actor.{ Actor, ActorRef, ActorSystem, Props }
import language.postfixOps
import scala.concurrent.duration._

case object Poke
case object Feed

class Kid extends Actor {
  def receive = {
    case Poke => {
      println("Ow...")
      println("Quit it...")
    }
    case Feed => {
      println("Gurgle...")
      println("Burp...")
    }
  }
}

object Hello {
  def main(args: Array[String]): Unit = {
    val system = ActorSystem("simpsons")
    val bart = system.actorOf(Props[Kid](), "bart")
    val lisa = system.actorOf(Props[Kid](), "lisa")

    bart! Poke
    lisa! Poke
    bart! Feed
    lisa! Feed
  }
}
