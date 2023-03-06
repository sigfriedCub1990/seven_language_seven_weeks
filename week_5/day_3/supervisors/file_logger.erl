-module(file_logger).
-behaviour(gen_event).

-export([init/1, handle_event/2, terminate/2]).

% In order to test this do the following:
% 1. Open REPL(erl)
% 2. Compile this with c(file_logger).
% 3. Start event manager https://www.erlang.org/doc/design_principles/events.html#starting-an-event-manager
% 4. Add handler, in this case gen_event:add_handler(e, file_logger, ['logs.txt'])
% 5. Notify gen_event:notify(e, "Oh no, something broke.")
% 6. Check logs.txt for the text

init(File) ->
    {ok, Fd} = file:open(File, write),
    {ok, Fd}.

handle_event(ErrorMsg, Fd) ->
    io:format(Fd, "***Error*** ~p~n", [ErrorMsg]),
    {ok, Fd}.

terminate(_Args, Fd) ->
    file:close(Fd).
