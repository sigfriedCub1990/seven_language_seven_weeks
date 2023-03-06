-module(translate).
-export([loop/0, translate/2]).

loop() ->
    receive
        "casa" ->
            io:format("house", []),
            loop();
        "blanca" ->
            io:format("white", []),
            loop();
        "kill" ->
            exit({ translate, die, at, erlang:time() });
        _ ->
            io:format("I don't understand", []),
            loop()
end.

translate(To, Word) ->
    To ! {self(), Word},
    receive
        Translation -> Translation
    end.
