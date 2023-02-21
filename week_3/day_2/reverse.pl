reverse_list(List, List).
reverse_list([Head|TailA], [TailB|Head]) :- reverse_list(TailA, TailB).
