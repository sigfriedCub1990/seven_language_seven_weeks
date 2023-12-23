module Replicate where

-- Num is not a subclass of Ord, hence we must 
-- specify that in the type signature.
replicate' :: (Num n, Ord n) => n -> x -> [x]
replicate' n x
    | n <= 0    = []
    | otherwise = x:replicate' (n - 1) x
