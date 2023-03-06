-module(doctor_as_supervisor).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({global, doc_supervisor}, doctor_as_supervisor, []).

init(_Args) ->
    SupFlags = #{strategy => one_for_one, intensity => 1, period => 5},
    ChildSpecs = [#{id => translator,
                    start => {translate_events, start_link, []},
                    restart => permanent,
                    modules => dynamic
                }],
    {ok, {SupFlags, ChildSpecs}}.
