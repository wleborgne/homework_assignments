require 'rspec'
require_relative '../../lib/cash_register'

describe CashRegister do
  it 'should be a CashRegister' do
    expect(subject).to be_a(CashRegister)
  end

  it 'has a #total method that returns 0.0 for a new CashRegister' do
    expect(subject.total).to eq(0.0)
  end
end
