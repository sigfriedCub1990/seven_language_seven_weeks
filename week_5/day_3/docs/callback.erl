-module(callback).
-export([start/0]).
-export([alloc/0, free/1]).
-export([init/0, handle_call/2, handle_cast/2]).

channels() ->
   {_Allocated = [], _Free = lists:seq(1,100)}.

alloc({Allocated, [H|T] = _Free}) ->
   {H, {[H|Allocated], T}}.

free(Ch, {Alloc, Free} = Channels) ->
   case lists:member(Ch, Alloc) of
      true ->
         {lists:delete(Ch, Alloc), [Ch|Free]};
      false ->
         Channels
   end.

start() ->
    server:start(callback).

alloc() ->
    server:call(callback, alloc).

free(Ch) ->
    server:cast(callback, {free, Ch}).

init() ->
    channels().

handle_call(alloc, Chs) ->
    alloc(Chs).

handle_cast({free, Ch}, Chs) ->
    free(Ch, Chs).
