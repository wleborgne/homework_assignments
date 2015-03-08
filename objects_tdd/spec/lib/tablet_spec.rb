require 'rspec'
require_relative '../../lib/tablet'

describe Tablet do
  let(:brand) { 'Apple' }
  let(:os) { 'iOS' }
  let(:version) { 7.1 }
  let(:subject) { Tablet.new(brand, os, version) }

  context 'The tablet' do
    it 'should be a Tablet' do
      expect(subject).to be_a(Tablet)
    end

    it 'has a #brand method to report the brand' do
      expect(subject.brand).to eq(brand)
    end

    it 'has a #os method to report the operating system' do
      expect(subject.os).to eq(os)
    end

    it 'has a #os_version method to report the operating system version' do
      expect(subject.os_version).to eq(version)
    end
  end
end
