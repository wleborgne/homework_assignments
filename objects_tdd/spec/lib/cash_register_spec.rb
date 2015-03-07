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

  context 'has a #purchase method' do
    it 'takes a floating point value and adds it to the total' do
      expect(subject.total).to eq(0.0)
      @purchase_amount = 3.14
      subject.purchase(@purchase_amount)
      expect(subject.total).to eq(@purchase_amount)
    end
  end

  context 'has a #pay method' do
    it 'takes a floating point value and returns the amount of change' do
      expect(subject.total).to eq(0.0)
      @purchase_amount = 3.14
      @payment_amount = 5.00
      @expected_change = @payment_amount - @purchase_amount
      subject.purchase(@purchase_amount)
      expect(subject.pay(@payment_amount)).to eq(@expected_change)
      expect(subject.total).to eq(@expected_change)
    end
  end
end
