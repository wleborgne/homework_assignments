#!/usr/bin/env ruby

# class CashRegister
# Implements a simple cash register
class CashRegister

  # Initial total is zero
  def initialize
    @total = 0.0
  end

  # Return total as a formatted string
  def total
    format_money(@total)
  end
  # Add purchase amount to total
  def purchase(purchase_amount)
    @total += purchase_amount
    format_money(@total)
  end

  # Receive payment and calculate new total.
  # If payment is at least equal to total, return
  # message with amount of change.
  # Otherwise, return message with remaining total.
  def pay(payment)
    if payment >= @total
      change = payment - @total
      @total = 0.0
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

if __FILE__ == $PROGRAM_NAME

  # Scenario 1
  # Single purchase, single payment > total
  puts 'Example scenario #1'
  register = CashRegister.new
  puts "Total = #{register.total}"
  puts "Purchase = #{register.purchase(3.78)}"
  puts "Total = #{register.total}"
  puts "After payment: #{register.pay(5.00)}"
  puts "Total = #{register.total}"

  # Scenario 2
  # Multiple purchases, multiple payments
  # The new instance is probably unnecessary
  puts 'Example Scenario #2'
  register = CashRegister.new
  puts "Total = #{register.total}"
  puts "Purchase = #{register.purchase(3.78)}"
  puts "Purchase = #{register.purchase(5.22)}"
  puts "Total = #{register.total}"
  puts "After payment: #{register.pay(5.00)}"
  puts "Total = #{register.total}"
  puts "After payment: #{register.pay(5.00)}"
  puts "Total = #{register.total}"
end
