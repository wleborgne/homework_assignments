# Implements basic Tablet functionality
class Tablet
  attr_reader :brand, :os, :os_version

  DEFAULT_APPS = { 'Phone' => false, 'Messages' => false,
                   'Contacts' => false, 'Calendar' => false }

  # Initialize state with supplied parameters,
  # and apps as the default apps
  def initialize(brand, os, version)
    @brand = brand
    @os = os
    @os_version = version
    reset_apps
  end

  # App management methods

  # Currently installed apps
  def apps
    @apps.keys
  end

  # Install a new app
  def install_app(app_name)
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
end
