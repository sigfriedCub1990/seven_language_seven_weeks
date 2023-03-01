-module(find).
-export([find/2, ho_find/2]).

find(_, []) -> false; % Like list:search
find(Term, [Head|Tail]) ->
    {Key, Value} = Head,
    if Key == Term ->
           Value;
    true ->
           find(Term, Tail)
    end.

% Higher-order find
ho_find(_, []) -> false;
ho_find(F, [Head|Tail]) ->
    {Found, Value} = F(Head),
    if Found == true ->
           Value;
    true ->
           ho_find(F, Tail)
    end.
