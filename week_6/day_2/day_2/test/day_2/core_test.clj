(ns day-2.core-test
  (:require [clojure.test :refer :all]
            [day-2.core :refer :all]))

(deftest size-test 
  (testing "size function(first version)"
    (is (= 3 (size [1 2 3])))))

(deftest size-recur-test
  (testing "size function(second version)"
    (is (= 3 (size_recur [1 2 3])))))

(deftest fibonacciy-test
  (testing "factorial of 5"
    (is (= '(1 1 2 3 5) (fibo 5)))))

(deftest factorial-test
  (testing "factorial of 5"
    (is (= 120 (factorial 5)))))


