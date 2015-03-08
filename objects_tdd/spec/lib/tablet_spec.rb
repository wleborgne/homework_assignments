require 'rspec'
require_relative '../../lib/tablet'

describe Tablet do
  it 'should be a Tablet' do
    expect(subject).to be_a(Tablet)
  end
end
