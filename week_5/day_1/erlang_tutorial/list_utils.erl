-module(list_utils).
-export([list_max/1, reverse_list/1, reverse/1]).

list_max([Head | Tail]) ->
    list_max(Tail, Head).

list_max([], Res) ->
    Res;
list_max([Head | Tail], Result_so_far) when Head > Result_so_far ->
    list_max(Tail, Head);
list_max([_ | Tail], Result_so_far) ->
    list_max(Tail, Result_so_far).

% [Head | Tail] = [london, rome, paris].
%
% Head = london.
% Tail = [rome, paris]
% 
% Head = rome.
% Tail = [paris].
%
% Head = paris.
% Tail = [].

% My implementation
reverse_list([Head | Tail]) ->
    reverse_list(Tail, [Head]).

reverse_list([], Last) ->
    Last;
reverse_list([Head | Tail], ReversedList) ->
    Acc = [Head | ReversedList],
    reverse_list(Tail, Acc).
% [1,2,3]
% 
% reverse_list([ H | T ], 1) ->
% Acc = [2 | 1],
% reverse_list([3], [2 | 1]).
%
% reverse_list([ H | T], [])


% Tutorial implementation
reverse(List) ->
    reverse(List, []).

reverse([Head | Rest], Reversed_List) ->
    reverse(Rest, [Head | Reversed_List]);
reverse([], Reversed_List) ->
    Reversed_List.
