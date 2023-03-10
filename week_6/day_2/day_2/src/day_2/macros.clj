(ns day-2.macros
  (:require [clojure.repl :refer :all]))

(defmacro unless [test body-false body-true]
             (list 'if (list 'not test) body-false body-true))



; (macroexpand '(unless condition body))

; (clojure.repl/source when)
; (defmacro when
;   "Evaluates test. If logical true, evaluates body in an implicit do."
;   {:added "1.0"}
;   [test & body]
;   (list 'if test (cons 'do body)))

; Three ideas to find penultimate
; 1. Recurse until list has two elements and returns first
; 2. Return element in size(list) - 2 (Doesn't work with lists)
; 3. Tail recursion using loop/recur
; 4. Use the nth function

; This doesn't work for Lists!
(defn penultimate [l]
  (get l (- (count l) 2)))

(defn penultimate-rec [l]
  (if (= 2 (count l))
        (first l)
        (penultimate-rec (rest l))))

(nth [ 1 2 3 ] 1)

(assert (= 4 (penultimate-rec [1 2 4 5])))
(assert (= 4 (penultimate-rec '( 1 2 4 5 ))))
(assert (= [1 2] (penultimate-rec [[1 1] [1 2] [1 3]])))

; Ideas
; 1. Recurse with counter, index to find and rest of the list
; 2. Recurse using tail-recursion(let's try this)

(defn my_nth_implementation [l n]
  "Finds the nth element in a sequence."
  (loop [lis l, curr 0]
    (if (= n curr)
      (first lis)
      (recur (rest lis) (inc curr)))
    ))
(my_nth_implementation (list 1 3 2 4) 2)

(assert (= 2 (my_nth_implementation (list 1 3 2 4) 2)))
(assert (= 2 (my_nth_implementation [1 3 2 4 ] 2)))
(assert (= [2 2] (my_nth_implementation [[1 1] [ 3 3 ] [2 2] [4 4]] 2)))
