(ns day-2.unless-test
  (:require [clojure.test :refer :all]
            [day-2.macros :refer :all]))

(deftest unless-false-test
  (testing "returns string if test is false"
   (is (= "that's false" (unless false "that's false" "it's not true")))))

(deftest unless-true-test
  (testing "returns nil if test is true"
   (is (= "this is the truth!" (unless true "that's false" "this is the truth!")))))

(deftest unless-test-expression-test
  (testing "returns '1 is not equal 2' if test is true"
   (is (= "1 is not equal 2" (unless (= 1 2) "1 is not equal 2" "weird arithmetics")))))
