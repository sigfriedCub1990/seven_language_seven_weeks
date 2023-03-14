module Fibonacci where
    fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
    fibTuple (x, y, 0) = (x, y, 0)
    fibTuple (x, y, index) = fibTuple(y, x + y, index - 1)

    fibResult :: (Integer, Integer, Integer) -> Integer
    fibResult (x, _, _) = x

    fib :: Integer -> Integer
    fib x = fibResult (fibTuple (0, 1, x))

    fibNextPair :: (Integer, Integer) -> (Integer, Integer)
    fibNextPair (x, y) = (y, x + y)

    fibNthPair :: Integer -> (Integer, Integer)
    fibNthPair 1 = (1, 1)
    fibNthPair x = fibNextPair (fibNthPair (x -1))

    fibWithComposition :: Integer -> Integer
    fibWithComposition = fst . fibNthPair
