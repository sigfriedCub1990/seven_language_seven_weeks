fibo :: Integer -> Integer
fibo 1 = 1
fibo 2 = 1
fibo n =
    fibo (n - 1) + fibo (n - 2)
