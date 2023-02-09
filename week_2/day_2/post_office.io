postOffice := Object clone

// `call` gives metadata about a message
postOffice packageSender := method(call sender)

mailer := Object clone
// Define a slot with a function `deliver` (sender), this function 
// sends a `packageSender` message to `postOffice`(target)
mailer deliver := method(postOffice packageSender)

mailer deliver
// ===> Object_0xbabffaf
// deliver      = method(...)
// `deliver` is the object that sent the 
// message

postOffice messageTarget := method(call target)
postOffice messageTarget
// Print metadata about postOffice because it's the
// target of the message

// Get message arguments
postOffice messageArgs := method(call message arguments)
postOffice messageArgs("uno", "dos", "tres")
// ===> list("uno", "dos", "tres")

// Get message name
postOffice messageName := method(call message name)
postOffice messageName
// ===> messageName
