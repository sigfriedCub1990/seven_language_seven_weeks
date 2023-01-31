#!/usr/bin/ruby

def main
  guessed = false
  num = rand(1..10)
  until guessed
    puts 'Type a number:'
    guess = gets.to_i
    if guess == num
      guessed = true
      puts 'You won!'
    elsif guess > num
      puts 'Too high'
    else
      puts 'Too low'
    end
  end
end

main
