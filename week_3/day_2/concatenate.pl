% Step 1, Lists are equal, that means they "unify" in Prolog terms
% concatenate([], List, List).

% Step 2 concatenate first element from L1 to the front of L2
% concatenate([Head|[]], List, [Head|List]).

% Step 3 Rules to concatenate two or three elements
% concatenate([Head1|[Head2|[]]], List, [Head1, Head2|List]).
% concatenate([Head1|[Head2|[Head3|[]]]], List, [Head1, Head2, Head3|List]).

% Step 4, generalization
concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :-
    concatenate(Tail1, List, Tail2).
