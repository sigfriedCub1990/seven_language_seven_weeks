module Cylinder where

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = 
    let sideArea = 2 * pi * r * h
        topArea  = pi * r ^2
    in sideArea + 2 * topArea

cylinderVolume :: (RealFloat a) => a -> a -> a
cylinderVolume r h =
    pi * r ^2 * h
