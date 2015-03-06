#!/usr/bin/env ruby

def bottles(number)
  puts first_half(number)
  puts second_half(number - 1)

  bottles(number - 1) if number > 0
end

def first_half(number)
  this_bottle = "#{number} bottles"
  this_bottle.chop! if number == 1
  this_bottle = 'no more bottles' if number == 0
  "#{this_bottle.capitalize} of beer on the wall, #{this_bottle} of beer."
end

def second_half(number)
  next_bottle = "#{number} bottles"
  next_bottle.chop! if number == 1
  if number >= 0
    take_one = 'Take one down and pass it around'
    next_bottle = 'no more bottles' if number == 0
  else
    take_one = 'Go to the store and buy some more'
    next_bottle = '99 bottles'
  end
  "#{take_one}, #{next_bottle} of beer on the wall.\n\n"
end

# How many bottles to start with?
number_of_bottles = 99

bottles(number_of_bottles)
