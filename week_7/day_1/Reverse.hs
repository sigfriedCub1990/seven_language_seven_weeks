module Reverse where

    reverse' :: [a] -> [a]
    reverse' (head:[]) = [head]
    -- NOTE:
    -- This is O.K for small lists only,
    -- doing reverse' [1..1000000] is SUPER SLOW!
    -- while Haskell's implementation is fairly quick.
    reverse' (head:tail) = my_reverse tail ++ [head]

    -- Haskell's reverse implementation
    h_reverse l = reverse l
