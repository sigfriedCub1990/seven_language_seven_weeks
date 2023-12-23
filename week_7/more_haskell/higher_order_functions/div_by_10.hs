module DivBy10 where

divBy10 :: (Floating a) => a -> a
divBy10 = (/10)

isUpperAlphaNum :: Char -> Bool
isUpperAlphaNum = (`elem` ['A'..'Z'])

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
-- flip' f = g
--     where g x y = f y x
flip' f y x = f x y


map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x       = x : filter' p xs
    | otherwise = filter p xs

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [1_000_000, 99_999..])
    where p x = x `mod` 3829 == 0

-- Take all odd squares < 10_000
oddSumSquares :: Integer
-- oddSumSquares = sum (takeWhile (<10_000) (filter odd (map (^2) [1..])))
-- With composition
-- oddSumSquares = sum . takeWhile (<10_000) . filter odd . map (^2) $ [1..]
-- Readable composition
oddSumSquares =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<10_000) oddSquares
    in sum belowLimit

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

-- Function application
-- let fApplication = map ($ 3) [(4+), (10*), (2^), sqrt]
