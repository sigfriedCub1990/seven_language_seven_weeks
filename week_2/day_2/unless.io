unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)

unless(1 == 2, write("One is not two \n"), write("One is two\n"))

// westley princessButtercup unless(trueLove, "it's false" println, "it's true" println)

// 1. westley sends `princessButtercup unless(trueLove, "it's false" println, "it's true" println)`.
// 2. Io takes the message and the context and puts it on the stack.
// 3. `princessButtercup` evaluates the message, walking up the prototype untils `unless` is found.
// 4. Execution of `unless` starts. First, it executes `call sender doMessage(call message argAt(0))`, this 
//      evaluates to `westley trueLove`.
// 5. Message is not false so the third block is executed.
// NOTES on #4:
// 1. `doMessage` executes an arbitrary message, this results in trueLove, 
// 2. `call sender` evaluates to westley
// 3. this results in `westley trueLove` as stated above.
