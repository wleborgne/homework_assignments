#!/usr/bin/env ruby

# Implements a rudimentary Tablet object
class Tablet
  attr_reader :brand, :os, :os_version, :volume, :brightness

  # Initialize state with provided brand, os and os_version
  # Initialize volume, brightness and charge at 50%
  # NOTE: No validation is done on parameters, so it is possible
  # to create an Apple Android 4.0 tablet
  def initialize(brand, os, os_version)
    @brand = brand
    @os = os
    @os_version = os_version.to_f
    @volume = 50
    @brightness = 50
    @charge = 50
  end

  # Volume methods

  # Reduce volume by reduction%, defaulting to 1%
  # If given value results in volume <= 0,
  # mute tablet
  def volume_down(reduction = 1)
    if (@volume - reduction) <= 0
      mute
    else
      @volume -= reduction
    end
  end

  # Increase volume by increase%, defaulting to 1%
  # If given increase results in volume >= 100%,
  # set to 100
  def volume_up(increase = 1)
    if (@volume + increase) >= 100
      @volume = 100
    else
      @volume += increase
    end
  end

  # Immediately reduce volume to 0
  def mute
    @volume = 0
  end

  # Screen brightness methods

  # Reduce brightness by reduction%, defaulting to 1%
  # If given value results in volume <= 10,
  # set brightness to 10
  # Minimum brightness is never zero
  def brightness_down(reduction = 1)
    if (@brightness - reduction) <= 10
      @brightness = 10
    else
      @brightness -= reduction
    end
  end

  # Increase brightness by increase%, defaulting to 1%
  # If given increase results in volume >= 100%,
  # set to 100
  def brightness_up(increase = 1)
    if (@brightness + increase) >= 100
      @brightness = 100
    else
      @brightness += increase
    end
  end

  # Charging methods

  # To start charging tablet,
  # @charging flag is set to true, and
  # current time is saved
  def start_charging
    @charging = true
    @last_charge_started = Time.new
  end

  # To stop charging, check if we are currently
  # charging.  If so,
  # @charging flag is set to false, and time
  # since last charge started is calculated.
  # Charge increases by 1% for each second of
  # charging.
  def stop_charging
    return unless @charging # Rubocop prefers unless here
    @charging = false
    charge_time = Time.new - @last_charge_started

    if (@charge + charge_time) >= 100
      @charge = 100
    else
      @charge += charge_time.to_i
    end
  end

  # To check on the current charge level,
  # if we're currently charging, we'll
  # stop then restart charging to get current
  # charge level and reset charge timer
  # If we're not currently charging, just return
  # the current charge value
  def charge
    if @charging
      stop_charging
      start_charging
      @charge
    else
      @charge
    end
  end

  # Upgrade the OS
  # If the version passed to the upgrade method is
  # less than the current version, a failure message
  # will be returned.
  def upgrade_os(new_version)
    if new_version.to_f > @os_version
      @os_version = new_version
      "Upgrade to #{@os} v#{os_version} complete."
    elsif new_version.to_f == @os_version
      'Software is up to date.'
    else
      "Upgrade failed. Cannot install older versions of #{@os}"
    end
  end
end
