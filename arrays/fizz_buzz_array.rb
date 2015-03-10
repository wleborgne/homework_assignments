#!/usr/bin/env ruby

# Array with values from 1 to 100
numbers = (1..100).to_a

# Map the numbers to a new array based on
# the result of the fizzbuzz algorithm
fizzbuzz_output = numbers.map do |number|
  # Start with a blank string
  fizzbuzz = ''

  # If number is divisible by 3, add 'Fizz'
  # If number is divisible by 5, add 'Buzz'
  # If divisible by both, the result will be 'FizzBuzz'
  fizzbuzz += 'Fizz' if number % 3 == 0
  fizzbuzz += 'Buzz' if number % 5 == 0

  # If the fizzbuzz string has anything added, return the string
  # Otherwise, return the number
  if fizzbuzz.length > 0
    fizzbuzz
  else
    number
  end
end

puts fizzbuzz_output
