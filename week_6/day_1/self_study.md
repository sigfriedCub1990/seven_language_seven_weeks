# Find

- Examples using Clojure sequences
- The formal definition of a Clojure function
- A script for quicly invoking the repl in you environment

```bash
$ lein repl
```

# Do

- Implement a function called `(big st n)` that returns true if a string `st` is longer that `n` characters.

```clojure
    (defn big [st n]
        (> (count st) n)
    )
```

- Write a function called `(colletion-type col)` that returns `:list`, `:map`, or `:vector` based on the type of collection `col`.
