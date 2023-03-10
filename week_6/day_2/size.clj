(defn size [v]
  (if (empty? v)
    0
    (inc (size (rest v)))))

(size [1 2 3])

(defn size_recur [v]
  (loop [] v, c 0)
  (if (empty? c)
          (recur (rest 1) (inc c))))
