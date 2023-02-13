slower := Object clone
slower start := method(wait(2); writeln("slowly"))

faster := Object clone
faster start := method(wait(1); writeln("quicky"))

// wait(3) at the end is need because when we do
// slower @@start; faster @@start those calls run
// on different threads! AND control is returned to
// the main program, which, if wait(3) is not present
// will terminate before we can see the messages.
slower @@start; faster @@start; wait(3)

// @ returns a Future
// @@ returns nil and starts the message in its own thread
