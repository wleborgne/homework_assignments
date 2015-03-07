# Implements a simple cash register
class CashRegister
  attr_reader :total

  def initialize
    @total = 0.0
  end

  def purchase(amount)
    @total += amount
  end

  def pay(amount)
    change = amount - @total
    @total = 0.0
    "Your change is $#{format('%.2f', change)}"
  end
end
