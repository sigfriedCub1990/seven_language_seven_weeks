(ns day-2.records-protocols)

(defprotocol Vehicle
  "Vehicle specification."
  (start-engine [_] "Starts vehicle's engine.")
  (stop-engine [_] "Stops vehicle's engine.")
  (accelerate [_ amount] "Accelerates the vehicle by X amount.")
  (deaccelerate [_ amount] "Deaccelerates the vehicle by X amount.")
 )

(defrecord Car [brand color max-speed number-of-wheels on velocity]
 Vehicle
 Object
 (start-engine [_] (Car. brand color max-speed number-of-wheels true 0))
 (stop-engine [_] (Car. brand color max-speed number-of-wheels false 0))
 (accelerate [this amount] (if amount
  (Car. brand color max-speed number-of-wheels true (+ amount (:velocity this)))
  (Car. brand color max-speed number-of-wheels true (+ 10 (:velocity this)))))
 (deaccelerate [this amount](if amount
  (Car. brand color max-speed number-of-wheels true (- amount (:velocity this)))
  (Car. brand color max-speed number-of-wheels true (- 10 (:velocity this)))))
 (toString [this] (str "[" (brand color max-speed number-of-wheels on this) "]"))
)
