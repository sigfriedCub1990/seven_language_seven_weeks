module Density where

-- https://en.wikipedia.org/wiki/Density
densityTell :: (RealFloat a) => a -> String
densityTell density
    | density < 1.2 = "Wow! You're going for a ride in the sky!"
    | density <= 1000.0 = "Have fun swimming, but watch out for sharks!"
    | otherwise = "If it's sink or swim, you're going to sink."

densityTell' :: (RealFloat a) => a -> a -> String 
densityTell' mass volume
    | mass / volume < 1.2 = "Wow! You're going for a ride in the sky!"
    | mass / volume <= 1000.0 = "Have fun swimming, but watch out for sharks!"
    | otherwise = "If it's sink or swim, you're going to sink."

densityTell'' :: (RealFloat a) => a -> a -> String 
densityTell'' mass volume
    | density < air = "Wow! You're going for a ride in the sky!"
    | density <= water = "Have fun swimming, but watch out for sharks!"
    | otherwise = "If it's sink or swim, you're going to sink."
    where density = mass / volume
          air = 1.2
          water = 1000.0

calcDensities :: (RealFloat a) => [(a, a)] -> [a]
calcDensities densities = [density m v | (m, v) <- densities]
    where density mass volume = mass / volume


-- with let bindings
calcDensities' :: (RealFloat a) => [(a, a)] -> [a]
calcDensities' densities = [density | (m, v) <- densities, let density = m / v, density < 1.2]
