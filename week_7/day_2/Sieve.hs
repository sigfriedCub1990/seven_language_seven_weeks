-- Two ideas for Primes
-- 1. Simple compute if a number is prime.
-- 2. Use the Sieve of Erathostenes, it should be faster.
module Sieve where
    primes :: [Integer]
    primes = computePrimes 2
    computePrimes start = start:(filter notMultiple [start..])
                where notMultiple x y = y `mod` x != 0
