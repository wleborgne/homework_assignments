#!/usr/bin/env ruby

# Create array with numbers from 1 to 10
numbers = (1..10).to_a

# Output the array elements separated by '...'
puts numbers.join('...') + '...'

# Output a countdown using the array
puts "T-#{numbers.reverse.join(', ')}...  BLASTOFF!"

# Output the last element
puts "The last element is #{numbers.last}"

# Output the first element
puts "The first element is #{numbers.first}"

# Output the third element
puts "The third element is #{numbers[2]}"

# Output the element with an index of 3
index = 3
puts "The element with an index of #{index} is #{numbers[index]}"

# Output the second from last element
puts "The second from last element is #{numbers[-2]}"

# Output the first 4 elements
puts "The first four elements are '#{numbers.first(4).join(', ')}'"

# Remove some elements from the array
# slice! returns a new array, but I've decided
# to discard it as it's not needed
numbers.slice!(4, 3)
puts "If we delete 5, 6 and 7 from the array,\
 we're left with [#{numbers.join(',')}]"

# Add a value to the beginning of the array
numbers.insert(0, 5)
puts "If we add 5 at the beginning of the array,\
 we're left with [#{numbers.join(',')}]"

# Add a value to the end of the array
numbers.push(6)
puts "If we add 6 at the end of the array,\
 we're left with [#{numbers.join(',')}]"

# Select a portion of the array
greater_than_8 = numbers.select { |number| number > 8 }
puts "Only the elements [#{greater_than_8.join(', ')}] are > 8."

# Clear the array
numbers.clear
puts "If we remove all the elements,\
 then the length of the array is #{numbers.length}"
