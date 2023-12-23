import math


def recursive_maximum(list, max=-math.inf):
    if len(list) == 0:
        raise Exception("Empty list")

    if len(list) == 1:
        if list[0] > max:
            return list[0]
        else:
            return max
    else:
        first = list.pop(0)
        if first > max:
            return recursive_maximum(list, first)
        else:
            return recursive_maximum(list, max)


def iterative_maximum(list):
    max = -math.inf
    for el in list:
        if el > max:
            max = el
    return max


assert recursive_maximum([50]) == 50
assert recursive_maximum([50, 30]) == 50
assert recursive_maximum([30, 50]) == 50
input1 = [1, 10, 50, 30]
input2 = [1, 10, 50, 30]
assert recursive_maximum(input1) == iterative_maximum(input2)
