#!/usr/bin/env ruby

# class CashRegister
# Implements a simple cash register
class CashRegister
  attr_reader :total

  # Initial total is zero
  def initialize
    @total = 0.0
  end

  # Add purchase amount to total
  def purchase(purchase_amount)
    @total += purchase_amount
  end

  # Receive payment and calculate new total.
  # If payment is at least equal to total, return
  # message with amount of change.
  # Otherwise, return message with remaining total.
  def pay(payment)
    if payment >= @total
      change = payment - @total
      @total = 0
      "Your change is #{format_money(change)}"
    else
      @total -= payment
      "Your new total is #{format_money(@total)}"
    end
  end

  private

  # Internal method to format values as dollar values
  def format_money(number)
    "$#{format('%.2f', number)}"
  end
end
