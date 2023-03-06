-module(translate_events).
-behaviour(gen_event).
-export([start_link/0, init/1, handle_event/2, terminate/2, handle_call/2]).

% To test this do as the following:
%
% 1. Fire up the REPL (erl)
% 2. Compile both translate_events and doctor_as_supervisor. c(translate_events). c(doctor_as_supervisor)
% 3. Start doctor_as_supervisor with doctor_as_supervisor:start_link().
% 4. Look for the PID of the child process of doctor_as_supervisor.
% 5. Kill the PID from step 4 with exit(PID, kill) https://www.erlang.org/doc/man/erlang.html#exit-2.
% 6. Message Starting translator... should be display in the REPL.

start_link() ->
    % must be used if the server is part
    % of a Supervision Tree
    io:format('Starting translator...~n'),
    gen_event:start_link({global, translator}).

init(_Args) ->
    {ok, []}.

handle_event(Term, State) ->
    case Term of
      "casa" ->
        io:format("house~n"),
        {ok, State};
      "blanca" ->
        io:format("white~n"),
        {ok, State};
      "die" ->
        io:format("oh no~n"),
        exit({translate, die, at, erlang:time()});
      _ ->
        io:format("I don't understand~n"),
        {ok, State}
    end.

handle_call(_Request, _State) ->
    {ok, [], []}.

terminate(_Args, _State) ->
    ok.
