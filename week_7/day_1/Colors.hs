module Colors where
    colors :: [String] -> [(String, String)]
    colors l = [(a, b) | a <- l, b <- l, a /= b, a > b]
