-module(double).
-export([double_all/1]).

double_all([]) -> [];
double_all([Head|Tail]) -> [Head*2|double_all(Tail)].
