-module(simple_server).
-export([start/0]).
-export([alloc/0, free/1]).
-export([init/0]).

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
    spawn(simple_server, init, []).

alloc() ->
    simple_server ! {self(), alloc},
    receive
        {simple_server, Res} ->
            Res
    end.

free(Ch) ->
    simple_server ! {free, Ch},
    ok.

init() ->
    register(simple_server, self()),
    Chs = channels(),
    loop(Chs).

loop(Chs) ->
    receive
        {From, alloc} ->
            {Ch, Chs2} = alloc(Chs),
            From ! {simple_server, Ch},
            loop(Chs2);
        {free, Ch} ->
            Chs2 = free(Ch, Chs),
            loop(Chs2)
    end.
