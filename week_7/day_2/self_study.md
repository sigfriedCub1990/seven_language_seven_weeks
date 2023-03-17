# Find

- Functions that you can use on lists, strings or tuples.
- A way to sort lists. [sort](https://hackage.haskell.org/package/base-4.18.0.0/docs/Data-List.html#v:sort)
  ```haskell
      import Data.List (sort)
      sort [3, 2, 1] -- yields [1, 2, 3]
  ```

# Do

- Write a sort that takes a list and returns a sorted list.
- Wirte a sort that takes a list and a function that compares its two arguments and then returns the sorted list.
- Write a Haskell function to convert a string to a number. The string should be in the form of $2,345,678.99 and can possible have leading zeros.
- Write a function that takes an arguments x and returns a lazy sequence that has every third number, starting from x. Then, write a function that inclues every fifth number, beginning with y. Combine these functions through composition to return every eight number, beginning with x + y.
- Use a partially applied function to define a function that will return half of a number and another that will append \n to the end of any string.

# Extra

- Write a function to determine the greatest common denominator of two integers.
- Create a lazy sequence of prime numbers (Sieve of Erathostenes).
- Break a long string into individual lines at proper word boundaries.
- Add line numbers to the previous exercise.
- To the above exercise, add functions to left, right and fully justify the text with spaces (making both margins straight).
