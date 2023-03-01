# Do

- Consider a list of keyword-value tuples, such as [{erlang, "a functional language"}, {ruby, "an OO language"}]. Write a function that accepts the list and a keyword and returns the associated value for the keyword.
  - Notice that `Erlang` provides data structures such as `map`, `dict`, `orddict` and others. My first instinct would be to use one of those to store the relationship between `key` and `value`, e.g. erlang => "a functional language". But, for the sake of the exercise...
  - [Find and Higher-Order find](./find.erl)
- Consider a shopping list that looks like [{ item, quantity, price }, ...]. Write a list comprehension that builds a list of items of the form [{ item, total_price }, ...], where `total_price` is `quantity*price`.
  - [Products total](./comprehension.erl)

**Bonus**

- Take a tic-tac-toe board as the input and return `winner`, `tac` if there are no more possible moves, or `no_winner` if no player has won yet.
