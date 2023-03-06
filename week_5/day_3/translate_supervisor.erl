-module(translate_supervisor).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring new Translator process.~n"),
            register(translator, spawn_link(fun translate:loop/0)),
            loop();
        {'EXIT', From, Reason} ->
            io:format("The translator ~p died with reason ~p.", [From, Reason]),
                io:format("Restarting...~n"),
                self() !new,
                loop()
    end.
