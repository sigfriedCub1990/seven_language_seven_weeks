-module(doctor_supervisor).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link(doctor_supervisor, []).

init(_Args) ->
    SupFlags = #{strategy => one_for_one, intensity => 1, period => 5},
    ChildSpecs = [#{
        id => doctor,
        start => {doctor, loop, []},
        restart => permanent,
        shutdown => brutal_kill,
        modules => [doctor]
    }],
    {ok, {SupFlags, ChildSpecs}}.
