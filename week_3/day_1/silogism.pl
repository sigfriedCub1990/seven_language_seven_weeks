is_something(men, mortal).
is_something(socrates, men).

is_mortal(X) :- is_something(X, men).
