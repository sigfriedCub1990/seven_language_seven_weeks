module Max where
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

-- Beauty
maximum2 :: (Ord a) => [a] -> a
maximum2 [x] = x
maximum2 (x:xs) = max x (maximum2 xs)
