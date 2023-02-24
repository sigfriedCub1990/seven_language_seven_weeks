val movies = <movies>
  <movie>2001: A space oddysey</movie>
  <movie>Dr. Strangelove or: How I stopped worrying and loved the bomb</movie>
  <short>Big Buck Bunny</short>
  <short>Geri's Game</short>
</movies>

(movies \ "_").foreach { movie =>
  movie match {
    case <movie>{movieName}</movie> => println(movieName)
    case <short>{shortName}</short> => println(s"$shortName (short)")
  }
}
