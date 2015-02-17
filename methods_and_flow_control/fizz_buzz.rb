#!/usr/bin/env ruby

number = 1

while number <= 100
  fizzbuzz = ''

  fizzbuzz += 'Fizz' if number % 3 == 0
  fizzbuzz += 'Buzz' if number % 5 == 0

  if fizzbuzz.length > 0
    puts fizzbuzz
  else
    puts number
  end

  number += 1
end
