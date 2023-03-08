(ns types.core
  "Example Lein app"
  (:require [clojure.repl :as repl])
  (:require [clojure.string :as str]))
;; How :require works
;; https://clojure.org/guides/learn/namespaces

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(defn big
  "Returns true if str's length is bigger than n."
  [str n]
  (> (count str) n))

(big "ruben" 3)

(str \h \e \l \l \o)

(def m {:one 1, :two 2})
(get m :three "not found")

(defn plotx [shape x _]
  (println shape x))

; (defn plot [shape coords]
;   (plotx shape (first coords) (second coords)))

(defn plot [shape coords]
  (apply plotx shape coords))

(plot "Square" [3 5])

(let [x 1
      y 2]
  (+ x y))

(defn messenger [msg]
  (let [a 7
        b 5
        c (str/capitalize msg)]
    (println a b c)
  ) ;; end of let scope
) ;; end of function
(messenger "hello, world!")

(defn greet []
  (println "Hello"))
(greet)

; (def greet
;   (fn [] (println "Hello, redefined."))
; )
; (greet)

; (def greet
;   #((println "Hello, again."))
; )
(greet)

(defn greeting
  ([]         (greeting "World!"))
  ([msg]      (str "Hello, " msg))
  ([msg, who] (str msg who))
)

(assert (= "Hello, World!" (greeting)))
(assert (= "Hello, Clojure!" (greeting "Clojure!")))
(assert (= "Good morning, Clojure!" (greeting "Good morning, " "Clojure!")))

(defn def-identity [x] x)
(assert (= "ruben" (def-identity "ruben")))

;; This is, of course, the identity function

(defn always-thing [& _] 100)
(assert (= 100 (always-thing '(1 2 3))))
(assert (= 100 (always-thing "one" "two" "three")))

(defn make-thingy [x]
  (fn [& _] x))
;; This is the function constantly

;; Tests
(let [n (rand-int Integer/MAX_VALUE)
      f (make-thingy n)]
  (assert (= n (f)))
  (assert (= n (f 123)))
  (assert (= n (apply f 123 (range)))))

(repl/source constantly)
(repl/source identity)

;; There must be an idiomatic way
;; of doing this
;; And it's this one
(defn triplicate [n f]
  (repeatedly n f)
)
(triplicate 3 (fn [] (println "nothing special")))

(dotimes [i 3] (println i))
; (defn triplicate [f]
;   (f)
;   (f)
;   (f))
; (triplicate (fn [msg] (println msg)))

(defn cos-pi
  "Takes nothing, returns cos(PI)"
  []
  (Math/cos Math/PI))
(assert (= -1.0 (cos-pi)))

(defn square [x] (* x x))
(defn sin-cos [x]
  (+ (square (Math/sin x)) (square (Math/cos x))))

(Math/pow (Math/sin 45) 2)

(assert (= 1 (sin-cos 4)))

(defn http-get [url]
  (slurp url))
(assert (.contains (http-get "https://www.w3.org") "html"))
