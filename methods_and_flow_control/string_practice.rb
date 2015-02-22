#!/usr/bin/env ruby

# Create practice string variable
practice_string = 'this is a string to practice with'

# Display the original string
puts practice_string

# Display the string capitalized
puts practice_string.capitalize

# Display the string in all uppercase
puts practice_string.upcase

# Display the string with added single quotes around the word string
# and capitalized
puts practice_string.capitalize.sub('string', "'string'")

# Display a statement about the length of the string
puts "The string '#{practice_string}' has #{practice_string.length} characters"

# Display the string reversed
puts practice_string.reverse

# Repeat a portion of the string followed by an exclamation point
# Find the index of the first letter of 'practice', and take a slice from that
# point up to and including the following space; repeat 3 times, remove the
# trailing space and add the exclamation point
puts((practice_string.slice(practice_string.index('p'), 9) * 3).chop + '!')
