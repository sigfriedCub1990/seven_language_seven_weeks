module DrunkenMonad where
    data Position t = Position t deriving (Show)

    stagger (Position d) = Position (d + 2)
    crawl (Position d) = Position (d + 1)

    -- Wraps a function into the container.
    rtn x = x -- This is, effectively, the Identity function.

    -- Bind function, this unwraps the function.
    -- We'll use this to chain functions together.
    x >>== f = f x

    treasureMap pos = pos >>==
                      stagger >>==
                      stagger >>==
                      crawl >>==
                      rtn
