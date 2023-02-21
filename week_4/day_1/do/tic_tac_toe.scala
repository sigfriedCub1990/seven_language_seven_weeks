class Board(
  var board: Seq[Seq[Char]]
) {

  def hasWon(): (Char, Boolean) = {
    val positionMovements = Map(
      (0, 0) -> Seq(
        Seq((1,0), (2, 0)), 
        Seq((1, 1), (2, 2)), 
        Seq((0, 1), (0, 2))
      ),
      (0, 1) -> Seq(
        Seq((1, 0), (2, 0))
      ),
      (0, 2) -> Seq(
        Seq((1, -1), (2, -2)), 
        Seq((1, 0), (2, 0))
      ),
      (1, 2) -> Seq(
        Seq((0, -1), (0, -2))
      ),
    )

    var won = false
    var player = '_'

    for(((x, y), moves) <- positionMovements) {
      for(move <- moves) {
        var (firstMoveX, firstMoveY) = move(0)
        var (secondMoveX, secondMoveY) = move(1)

        var firstPosition = board(x)(y)
        var secondPosition = board(x + firstMoveX)(y + firstMoveY) 
        var thirdPosition = board(x + secondMoveX)(y + secondMoveY)


        // TODO: Why this doesn't work?
        // if (firstPosition == secondPosition && secondPosition == thirdPosition) true else false
        // if (won) player = board(x)(y)
        if (firstPosition == secondPosition && secondPosition == thirdPosition) {
          won = true
          player = board(x)(y)
        }
      }
    }

    (player, won)
  }

  def printBoard() {
    for (col <- board) {
      for (row <- col) {
        print(s"$row ")
      }
      println()
    }
  }
}

val game = new Board(board=Seq(
  Seq('X', 'O', 'X'),
  Seq('O', 'O', 'X'),
  Seq('X', 'O', 'O')
))

println(game.hasWon)
