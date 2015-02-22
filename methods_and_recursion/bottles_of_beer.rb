#!/usr/bin/env ruby

def bottles(number)
  current_bottle = "#{number} bottles"
  next_bottle = "#{number - 1} bottles"
  take_one = 'Take one down and pass it around'

  if number == 0
    current_bottle = 'No more bottles'
    next_bottle = '99 bottles'
    take_one = 'Go to the store and buy some more'
  elsif number == 1
    current_bottle = '1 bottle'
    next_bottle = 'no more bottles'
  end

  puts "#{current_bottle} of beer on the wall, #{current_bottle} of beer."
  puts "#{take_one}, #{next_bottle} of beer on the wall.\n\n"

  bottles(number - 1) if number > 0
end

# How many bottles to start with?
number_of_bottles = 99

bottles(number_of_bottles)
