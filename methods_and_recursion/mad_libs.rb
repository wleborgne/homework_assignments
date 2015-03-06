#!/usr/bin/env ruby

# Prints a prompt based on the parameter
# and receives a response from the user
def give_me(prompt)
  puts "Give me #{prompt}:"
  gets.chomp
end

# Array to hold prompt strings
prompts = ['an adjective', 'another adjective', 'a noun',
           'another noun', 'a plural noun', 'a game',
           'another plural noun', 'a verb ending in \'ing\'',
           'another verb ending in \'ing\'', 'another plural noun',
           'another verb ending in \'ing\'', 'another noun',
           'a plant', 'a part of the body', 'a place',
           'another verb ending in \'ing\'', 'another adjective',
           'a number', 'another plural noun']

# Array to hold responses
responses = []

prompts.each { |prompt| responses << give_me(prompt) }

puts "
Here is your madlib:
A vacation is when you take a trip to some #{responses.shift} place
with your #{responses.shift} family. Usually you go to some place
that is near a/an #{responses.shift} or up on a/an #{responses.shift}.
A good vacation place is one where you can ride #{responses.shift}
or play #{responses.shift} or go hunting for #{responses.shift}. I like
to spend my time #{responses.shift} or #{responses.shift}.
When parents go on a vacation, they spend their time eating
three #{responses.shift} a day, and fathers play golf, and mothers
sit around #{responses.shift}. Last summer, my little brother
fell in a/an #{responses.shift} and got poison #{responses.shift} all
over his #{responses.shift}. My family is going to go to (the)
#{responses.shift}, and I will practice #{responses.shift}. Parents
need vacations more than kids because parents are always very
#{responses.shift} and because they have to work #{responses.shift}
hours every day all year making enough #{responses.shift} to pay
for the vacation."
