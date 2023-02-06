# Self study Io language

## Reference
- [Io guide](https://iolanguage.org/guide/guide.html) 

## Answer
* Evaluate 1 + 1 and then 1 + "One". Is `Io` strongly typed or weakly typed? Support your answer with code.

```sh
> 1 + 1
==>2

> 1 + '1' yields an error, suggesting that Io has a strongly typed system
```

- Is 0 `true` or `false`? What about the empty string? Is `nil` true or false? Support your answer with code.
  There's sanity in the language, `0` is `true`, empty strings are `true` and `nil` is `false`.

```sh
> 0 and true
> true

> "" and true
> true

> nil and true
> false
```

- How can you tell what slots a prototype supports?
  We can use `slotNames` method and also `slotSummary`. The former provides a nice rèsumè of the Object's slots.

- What is the difference between = (equals), := (colon equals) and ::= (colon colon equals)? When would you use each one?
|----------|---------------------------------------------------------------|
| Operator | Action                                                        |
|----------|---------------------------------------------------------------|
| =        | Assing value to slot if it exists, otherwise raises exception |
| :=       | Creates slot, assigns value                                   |
| ::=      | Creates slot, creates setter, assigns value                   |
|----------|---------------------------------------------------------------|
