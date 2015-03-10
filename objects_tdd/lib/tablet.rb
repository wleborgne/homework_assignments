# Implements basic Tablet functionality
class Tablet
  attr_reader :brand, :os, :os_version, :volume, :brightness, :charging

  DEFAULT_APPS = { 'Phone' => false, 'Messages' => false,
                   'Contacts' => false, 'Calendar' => false }

  # Initialize state with supplied parameters,
  # and apps as the default apps
  def initialize(brand, os, version)
    @brand = brand
    @os = os
    @os_version = version
    @volume = 50
    @brightness = 50
    @charge = 50
    @charging = false
    reset_apps
  end

  # App management methods

  # Currently installed apps
  def apps
    @apps.keys
  end

  # Install a new app
  def install_app(app_name)
    return if @apps.key?(app_name)
    @apps[app_name] = true
  end

  # Uninstall app if is not a default app
  def uninstall_app(app_name)
    @apps.delete(app_name) if @apps[app_name]
  end

  # Reset apps to default
  def reset_apps
    @apps = Hash.new(false)
    @apps.merge!(DEFAULT_APPS)
  end

  # Volume management

  # Mute volume
  def mute
    @volume = 0
  end

  # Reduce volume
  def volume_down(amount = 1)
    mute if (@volume -= amount) < 0
  end

  # Raise volume
  def volume_up(amount = 1)
    @volume = 100 if (@volume += amount) > 100
  end

  # Screen brightness management

  # Increase brightness
  def brightness_up(amount = 1)
    @brightness = 100 if (@brightness += amount) > 100
  end

  # Decrease brightness
  def brightness_down(amount = 1)
    @brightness = 10 if (@brightness -= amount) < 10
  end

  # OS upgrade
  def upgrade_os(new_version)
    if new_version > @os_version
      @os_version = new_version
      "Upgrade to #{@os} v#{@os_version} complete."
    elsif @os_version == new_version
      'Software is up to date.'
    else
      "Upgrade failed. Cannot install older versions of #{@os}"
    end
  end

  # Charging methods

  # Report charge level
  def charge
    if @charging
      stop_charging
      start_charging
      @charge
    else
      @charge
    end
  end

  # Begin charging device
  def start_charging
    @charge_started = Time.now
    @charging = true
  end

  # Stop charging and return current charge level
  def stop_charging
    @charge unless @charging
    @charging = false
    charge_time = (Time.now - @charge_started).to_i
    @charge = 100 if (@charge += charge_time) > 100
  end
end
