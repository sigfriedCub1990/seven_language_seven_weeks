(ns day-2.compass)

(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c]))

(def directions [:north :east :south :west])
(defn turn
  [base amount]
  (rem (+ base amount) (count directions)))

(defrecord SimpleCompass [bearing whatever]
 Compass
 Object
 (direction [_] (directions bearing))
 (left [_] (SimpleCompass. (turn bearing 3)))
 (right [_] (SimpleCompass. (turn bearing 1)))
 (toString [this] (str "[" (direction this) "]")))

(def c (SimpleCompass. 0 "whatever"))
(print c)
