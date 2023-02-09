// Exercise #8
attempts := 0
won := false
randomNumber := Random value(1, 100) floor
guess := -1

while(won not and attempts != 10,
    "Guess the number between 1-100" println
    guess = CLI lineReader readLine asNumber
    if(guess == randomNumber, 
    won = true
    "You won!" println
    , 
    attempts = attempts + 1
    range := randomNumber - guess
    if(range abs <= 10, "Hot, hot!" println, "Cold, cold" println)
    )
)

if(attempts == 10 and won not,
    "Sorry, maybe next time. The number was #{randomNumber}" interpolate println
)
