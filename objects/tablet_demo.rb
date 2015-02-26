#!/usr/bin/env ruby
require_relative './tablet.rb'

my_tablet = Tablet.new('Apple', 'iOS', 7.1)

puts "I am a tablet from #{my_tablet.brand},\
 running #{my_tablet.os} version #{my_tablet.os_version}."

# Volume methods demo
puts "Current volume: #{my_tablet.volume}%"
my_tablet.mute
puts "Volume after muting: #{my_tablet.volume}%"

puts 'Call volume_up 25 times.'
25.times { my_tablet.volume_up }
puts "Current volume: #{my_tablet.volume}%"

# Screen brightness methods demo
puts "Current screen brightness: #{my_tablet.brightness}%"
puts 'Call brightness_down 30 times.'
30.times { my_tablet.brightness_down }
puts "New screen brightness: #{my_tablet.brightness}%"

# Charging methods demo
puts "Current charge level: #{my_tablet.charge}%"
puts 'Call start_charging and wait 20 seconds.'
my_tablet.start_charging
sleep(20)
my_tablet.stop_charging
puts "After calling stop_charging, charge level is #{my_tablet.charge}%"

# OS upgrade method demo
puts "Current OS is #{my_tablet.os} v#{my_tablet.os_version}."
puts 'Upgrading to same OS version:'
puts my_tablet.upgrade_os(my_tablet.os_version)
puts 'Attempt upgrade to earlier version:'
puts my_tablet.upgrade_os(2.0)
puts 'Attempt upgrade to very future version:'
puts my_tablet.upgrade_os(11.0)
