module LazyFib where
    lazyFib x y = x:(lazyFib y (x + y)) -- This generates an infinite sequence

    fib = lazyFib 1 1 -- This "triggers" the sequence

    fibNth x = head (drop (x - 1) (take (x) fib)) -- Take N elements, drop N - 1 and you have the result in the first position
