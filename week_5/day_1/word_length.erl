-module(word_length).
-export([word_length/1]).

word_length([]) -> 0;
word_length([_ | Rest]) ->
    1 + word_length(Rest).
