-module(doctor).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(revolver, spawn_link(fun roulette:loop/0)),
            loop();
        {'EXIT', From, Reason} ->
            io:format("The shooter ~p died with reason ~p.", [From, Reason]),
                io:format("Restarting...~n"),
                self() !new,
                loop();
        die -> % kill the doctor process
            io:format("Doctor is going to die.~n"),
            exit({self(), die, at, erlang:time()}) 
    end.
