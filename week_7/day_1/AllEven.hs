module AllEven where
   allEven :: [Integer] -> [Integer]
   allEven [] = []
   allEven (h:t) = if even h then h:allEven t else allEven t

   {- Using a List Comprehension -}
   allEvenLC :: [Integer] -> [Integer]
   allEvenLC l = [n | n <- l, even n ]

   {- Using a filter Higher Order function -}
   allEvenFilter :: [Integer] -> [Integer]
   allEvenFilter l = filter even l
