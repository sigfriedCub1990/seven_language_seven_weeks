-- isPrime :: RealFrac -> RealFrac -> Bool
-- isPrime n 2
--     | even  = False
--     | odd   = True
-- isPrime n
--     | n ``

dividedBy :: Int -> Int -> Bool
dividedBy a b
    | a `mod` b == 0 = True
    | otherwise      = False

divisibleBy :: Int -> [Int]
divisibleBy x =
    filter isDivisible [2..squareRoot]
    where squareRoot  = ceiling (sqrt x)
          isDivisible = dividedBy x
