-module(length).
-export([list_length/1]).

% There is a better way of writing this
% using tail recursion.
list_length([]) ->
    0;

list_length([_ | Tail]) ->
    1 + list_length(Tail).
