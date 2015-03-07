require 'rspec'
require_relative '../../lib/cash_register'

describe CashRegister do
  it 'should be a CashRegister' do
    expect(subject).to be_a(CashRegister)
  end

  context 'has a #total method' do
    it 'returns 0.0 for a new CashRegister' do
      expect(subject.total).to eq(0.0)
    end
  end

  describe 'has a #purchase method' do
    it 'takes a floating point value and adds it to the total' do
      expect(subject.total).to eq(0.0)
      purchase_amount = 3.14
      subject.purchase(purchase_amount)
      expect(subject.total).to eq(purchase_amount)
    end
  end

  describe 'has a #pay method that takes a floating point value' do
    context 'for amounts greater than the current total' do
      it 'returns a string indicating the amount of change' do
        expect(subject.total).to eq(0.0)
        purchase_amount = 3.14
        payment_amount = 5.00
        expected_change = payment_amount - purchase_amount
        expected_string = "Your change is $#{format('%.2f', expected_change)}"
        subject.purchase(purchase_amount)
        expect(subject.pay(payment_amount)).to eq(expected_string)
        expect(subject.total).to eq(0.0)
      end
    end

    context 'for amounts less than the current total' do
      it 'returns a string indicating the updated total' do
        expect(subject.total).to eq(0.0)
        purchase_amount = 2.50
        payment_amount = 1.00
        new_total = purchase_amount - payment_amount
        expected_string = "Your new total is $#{format('%.2f', new_total)}"
        subject.purchase(purchase_amount)
        expect(subject.pay(payment_amount)).to eq(expected_string)
        expect(subject.total).to eq(new_total)
      end
    end

    context 'for amounts equal to the current total' do
      it 'returns a string indicating no change is due' do
        expect(subject.total).to eq(0.0)
        amount = 2.68
        expected_string = 'Your change is $0.00'
        subject.purchase(amount)
        expect(subject.pay(amount)).to eq(expected_string)
        expect(subject.total).to eq(0.0)
      end
    end
  end

  context 'satisfies user scenarios' do
    it 'returns "Your change is $1.22" for a 3.78 purchase and 5.00 payment' do
      purchase_amount = 3.78
      payment_amount = 5.00
      expected_change = payment_amount - purchase_amount
      expected_string = "Your change is $#{format('%.2f', expected_change)}"
      expect(subject.total).to eq(0.0)
      subject.purchase(purchase_amount)
      expect(subject.pay(payment_amount)).to eq(expected_string)
    end

    it 'correctly handles multiple purchases and payments' do
      purchase_1 = 3.78
      purchase_2 = 5.22
      total = 9.00
      payment = 5.00
      expect(subject.total).to eq(0.0)
      subject.purchase(purchase_1)
      expect(subject.total).to eq(purchase_1)
      subject.purchase(purchase_2)
      expect(subject.total).to eq(total)
      expect(subject.pay(payment)).to eq('Your new total is $4.00')
      expect(subject.total).to eq(4.00)
      expect(subject.pay(payment)).to eq('Your change is $1.00')
      expect(subject.total).to eq(0.0)
    end
  end
end
