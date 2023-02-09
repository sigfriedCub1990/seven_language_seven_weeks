// Exercise #1
fibonacci := method(n, 
    if(n == 1 or n == 2,
    return 1, 
    fibonacci(n - 1) + fibonacci(n - 2)
))
fibonacci(4) println

// TODO: Do the same with for loop
