require 'rspec'
require_relative '../../lib/tablet'

describe Tablet do
  let(:brand) { 'Apple' }
  let(:os) { 'iOS' }
  let(:version) { 7.1 }
  let(:subject) { Tablet.new(brand, os, version) }

  context do
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

  context 'App Management' do
    let(:default_apps) { %w(Phone Messages Contacts Calendar) }

    it 'has 4 default #apps, Phone, Messages, Contacts, Calendar' do
      apps = subject.apps
      expect(apps.length).to be(4)
      expect(apps).to contain_exactly(*default_apps)
    end

    it 'can install apps via #install_app(name)' do
      expected_apps = default_apps.push('New App')
      subject.install_app('New App')
      expect(subject.apps).to contain_exactly(*expected_apps)
    end

    it '#uninstall_app does not succeed for default apps' do
      expect(subject.uninstall_app('Calendar')).to be_falsey
    end

    it '#uninstall_app succeeds for non-default apps' do
      subject.install_app('New App')
      expect(subject.apps.length).to eq(5)
      expect(subject.uninstall_app('New App')).to be_truthy
      expect(subject.apps).to contain_exactly(*default_apps)
    end

    it '#reset_apps will reset installed apps to the default' do
      subject.install_app('new app 1')
      subject.install_app('new app 2')
      expect(subject.apps.length).to eq(6)
      subject.reset_apps
      expect(subject.apps).to contain_exactly(*default_apps)
    end
  end

  context 'Volume management' do
    it '@volume has a default value of 50' do
      expect(subject.volume).to eq(50)
    end

    it '#mute reduces volume to 0' do
      subject.mute
      expect(subject.volume).to eq(0)
    end

    it '#volume_down reduces volume by 1% with no parameter' do
      subject.volume_down
      expect(subject.volume).to eq(49)
    end

    it '#volume_down reduces volume by amount% if passed amount' do
      subject.volume_down(20)
      expect(subject.volume).to eq(30)
    end

    it 'has a minimum volume of 0' do
      subject.mute
      subject.volume_down
      expect(subject.volume).to eq(0)
    end

    it '#volume_up increases volume by 1% with no parameter' do
      subject.volume_up
      expect(subject.volume).to eq(51)
    end

    it '#volume_up increases volume by amount% if passed amount' do
      subject.volume_up(20)
      expect(subject.volume).to eq(70)
    end

    it 'has a maximum volume of 100' do
      subject.volume_up(90)
      expect(subject.volume).to eq(100)
    end
  end
end
