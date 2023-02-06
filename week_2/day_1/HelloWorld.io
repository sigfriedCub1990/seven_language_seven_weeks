Person := Object clone
Person think := method("I think, therefore I am")
Person name ::= ""

descartes := Person clone
descartes setName("Rene Descartes")
"#{descartes name} said: '#{descartes think}.'" interpolate println
