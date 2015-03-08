# Implements basic Tablet functionality
class Tablet
  attr_reader :brand, :os, :os_version

  def initialize(brand, os, version)
    @brand = brand
    @os = os
    @os_version = version
  end
end
