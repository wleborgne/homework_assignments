#!/usr/bin/env ruby

def bottles(number)
  this_bottle = "#{number} bottles"
  this_bottle.chop! if number == 1
  next_bottle = "#{number - 1} bottles"
  next_bottle.chop! if number - 1 == 1
  take_one = 'Take one down and pass it around'

  if number == 0
    this_bottle = 'no more bottles'
    next_bottle = '99 bottles'
    take_one = 'Go to the store and buy some more'
  end

  puts "#{this_bottle.capitalize} of beer on the wall, #{this_bottle} of beer."
  puts "#{take_one}, #{next_bottle} of beer on the wall.\n\n"

  bottles(number - 1) if number > 0
end

# How many bottles to start with?
number_of_bottles = 99

bottles(number_of_bottles)
