#!/usr/bin/env ruby

# Starting value of 1
number = 1

# Go until 100
while number <= 100

  # Start with a blank string
  fizzbuzz = ''

  # If number is divisible by 3, add 'Fizz'
  # If number is divisible by 5, add 'Buzz'
  # If divisible by both, the result will be 'FizzBuzz'
  fizzbuzz += 'Fizz' if number % 3 == 0
  fizzbuzz += 'Buzz' if number % 5 == 0

  # If the fizzbuzz string has anything added, display the string
  # Otherwise, display the number
  if fizzbuzz.length > 0
    puts fizzbuzz
  else
    puts number
  end

  # Increment the number
  number += 1
end
