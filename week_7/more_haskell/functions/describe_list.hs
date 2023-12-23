module DescribeList where

describeList :: [a] -> String
describeList xs = "The list is " ++  case xs of []     -> "empty."
                                                [x]    -> "a singleton list."
                                                xs     -> "a longer list."

describeList' :: [a] -> String
describeList' xs = "The list is " ++  what xs
    where what []  = "empty list."
          what [x] = "singleton list."
          what xs  = "a longer list."
