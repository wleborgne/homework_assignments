#!/usr/bin/env ruby

# Set variables to base values
seconds_per_minute = 60
minutes_per_hour = 60
hours_per_day = 24
days_per_week = 7
weeks_per_year = 52

# Print base values to screen
puts "There are #{seconds_per_minute} seconds in a minute"
puts "There are #{minutes_per_hour} minutes in an hour"
puts "There are #{hours_per_day} hours in a day"
puts "There are #{days_per_week} days in a week"

# Derive values from base values:
# seconds in an hour, day, week, and year
seconds_per_hour = seconds_per_minute * minutes_per_hour
seconds_per_day = seconds_per_hour * hours_per_day
seconds_per_week = seconds_per_day * days_per_week
seconds_per_year = seconds_per_week * weeks_per_year

# Print the derived values to the screen
puts 'That means there are:'
puts "  #{seconds_per_hour} seconds in an hour,"
puts "  #{seconds_per_day} seconds in an day,"
puts "  #{seconds_per_week} seconds in a week"

# More calculations:
# seconds in 20 and 100 years
twenty_years = 20
one_hundred_years = 100
seconds_in_20_years = twenty_years * seconds_per_year
seconds_in_100_years = one_hundred_years * seconds_per_year

# Print the 20 and 100 year statements
print "That means when you turn #{twenty_years},"
puts " you've been alive for #{seconds_in_20_years} seconds,"
print "and if you make it to #{one_hundred_years},"
puts " you will have lived #{seconds_in_100_years} seconds. Make them count!"
