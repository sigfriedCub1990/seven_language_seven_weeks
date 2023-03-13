(ns day-3.core-test
  (:require [clojure.test :refer :all]
            [day-3.core :refer :all]))

(deftest cache-test
  (testing "Cache creation test"
    (def cache (create))
    (put cache :one 1)
    (is (= 1 (get cache :one)))))
