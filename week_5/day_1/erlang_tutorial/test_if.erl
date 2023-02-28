-module(test_if).
-export([if_test/2]).

if_test(A, B) ->
    if 
        A == 5 ->
            io:format("A == 5~n", []),
            a_equals_5;
        B == 6 ->
            io:format("B == 6~n", []),
            b_equals_6;
        A == 2, B == 3 ->   % This is a logical AND
            io:format("A == 2, B == 3~n", []), 
            a_equals_6_and_b_equals_3;
        A == 1 ; B == 7 ->  % This is a logical OR
            io:format("A == 1 ; B == 7~n", []),
            a_equals_1_or_b_equals_7
    end.
