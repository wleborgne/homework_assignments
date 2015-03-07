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
      @amount = 3.14
      subject.purchase(@amount)
      expect(subject.total).to eq(@amount)
    end
  end
end
