module FactorialWithGuard where
    factorialWithGuard :: Integer -> Integer
    factorialWithGuard n
        | n > 1 = n * factorialWithGuard (n - 1)
        | otherwise = 1
