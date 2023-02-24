package example

import scala.io._
import akka.actor._
import net.ruippeixotog.scalascraper.browser.JsoupBrowser
import net.ruippeixotog.scalascraper.dsl.DSL._
import net.ruippeixotog.scalascraper.dsl.DSL.Extract._
import net.ruippeixotog.scalascraper.dsl.DSL.Parse._
import net.ruippeixotog.scalascraper.model._

object PageLoader {
  def getPageSize(url: String) = Source.fromURL(url).mkString.length
  def getLinksCount(url: String) = {
    val browser = JsoupBrowser()
    val doc = browser.get(url)
    val links = doc >> elementList("a")
    links.size
  }
}

object ActorMessages {
  case class Dispatch(url: String)
  case class Fetch(url: String)
  case class CountLinks(url: String)
  case class Count(url: String)
  case class Response(url: String, size: Int)
  case class CountResponse(url: String, linksCount: Int)
}

class MainActor() extends Actor {
  import ActorMessages._
  import context._

  val fetcher = actorOf(Props[Fetcher](), name="childFetcher")
  val linkCounter = actorOf(Props[LinkCounter](), name="childLinkCounter")

  def receive = {
    case Dispatch(url: String) => fetcher ! Fetch(url)
    case CountLinks(url: String) => linkCounter ! Count(url)
    case Response(url: String, size: Int) => {
      println(s"Size of $url is: $size")
    }
    case CountResponse(url: String, links: Int) => {
      println(s"$url has $links links")
    }
  }
}

class Fetcher extends Actor {
  import ActorMessages._
  def receive = {
    case Fetch(url: String) => {
      sender() ! Response(url, PageLoader.getPageSize(url))
    }
  }
}

class LinkCounter extends Actor {
  import ActorMessages._
  def receive = {
    case Count(url: String) => {
      sender() ! CountResponse(url, PageLoader.getLinksCount(url))
    }
  }
}

object Main {
  val urls = List(
    "https://avito.ru",
    "https://github.com",
    "https://ya.ru",
    "https://docs.scala-lang.org",
    "https://doc.akka.io"
  )

  def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println(s"Method took ${(end - start)/1000000000.0} seconds.")
  }

  def getPageSizeSequentially() = {
    for(url <- urls) {
      println(s"Size for $url: ${PageLoader.getPageSize(url)}")
    }
  }

  def createActor: ActorSystem => Int => ActorRef = system => n => system.actorOf(Props[MainActor](), s"main$n")

  def getPageSizeConcurrently() = {
    val system = ActorSystem("sizer")
    val createActorWithSystem = createActor(system)

    val actors = (1 to urls.size).map(createActorWithSystem)

    val actorUrls = urls.zip(actors)

    for((url, actor) <- actorUrls) {
      actor ! ActorMessages.Dispatch(url)
      actor ! ActorMessages.CountLinks(url)
    }
  }


  def main(args: Array[String]): Unit = {
    // println("Sequential run: ")
    // timeMethod { getPageSizeSequentially }

    // println("Concurrent run:")
    getPageSizeConcurrently
  }
}
