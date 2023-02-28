-module(print_message).
-export([print_message/1]).

print_message({ error, Message }) ->
    io:format("error: ~s~n", [Message]);
print_message({ success }) ->
    io:format("success~n", []).
