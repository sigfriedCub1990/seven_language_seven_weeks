(ns day-2.records-protocols-test
  (:require [clojure.test :refer :all]
            [day-2.records-protocols :refer :all]))

(deftest creates-instance-test
  (testing "Car is created correctly"
    (def c (->Car "mitsubishi lancer" "black" 120 4 false 0))
    (is (= "mitsubishi lancer" (:brand c)))))


(deftest engine-test
  (def c (->Car "mitsubishi lancer" "black" 120 4 false 0))
  (testing "Turn engine on"
    (is (= true (:on (start-engine c)))))
  (testing "Turn engine off"
    (is (= false (:on (stop-engine c))))))

(deftest acceleration-test
  (def c (->Car "mitsubishi lancer" "black" 120 4 false 0))
  (testing "Increment current velocity by 20"
    (is (= 20 (:velocity (accelerate c 20)))))
  (testing "Decrement current velocity by 10"
    (is (= 10 (:velocity (deaccelerate c 10))))))
