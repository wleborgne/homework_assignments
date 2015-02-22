#!/usr/bin/env ruby

def bottles(current_number, next_number = current_number - 1)
  this_bottle = "#{current_number} bottles"
  this_bottle.chop! if current_number == 1
  next_bottle = "#{next_number} bottles"
  next_bottle.chop! if next_number == 1
  take_one = 'Take one down and pass it around'

  if current_number == 0
    this_bottle = 'no more bottles'
    next_bottle = '99 bottles'
    take_one = 'Go to the store and buy some more'
  end

  puts "#{this_bottle.capitalize} of beer on the wall, #{this_bottle} of beer."
  puts "#{take_one}, #{next_bottle} of beer on the wall.\n\n"

  bottles(next_number, next_number - 1) if current_number > 0
end

# How many bottles to start with?
number_of_bottles = 99

bottles(number_of_bottles)
