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
    @total = amount - @total
  end
end
