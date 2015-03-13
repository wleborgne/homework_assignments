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
    if amount >= @total
      change = amount - @total
      @total = 0.0
      "Your change is $#{format('%.2f', change)}"
    else
      @total -= amount
      "Your new total is $#{format('%.2f', @total)}"
    end
  end
end
