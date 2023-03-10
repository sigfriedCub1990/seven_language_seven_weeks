(ns day-2.core)

(defn size [v]
  (if (empty? v)
    0
    (inc (size (rest v)))))

; With tail recursion
(defn size_recur [v]
    (loop [l v, c 0]
      (if (empty? l)
        c
        (recur (rest l) (inc c)))))

; Lazy sequences
(defn fib-pair [[a b]] [b, (+ a b)])
(defn fibo [n]
  (take n
    (map
     first
     (iterate fib-pair [1 1]))))

(defn factorial [n] (apply * (take n (iterate inc 1))))
