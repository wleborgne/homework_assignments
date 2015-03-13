require 'rspec'
require_relative '../../lib/tablet'

describe Tablet do
  let(:brand) { 'Apple' }
  let(:os) { 'iOS' }
  let(:version) { 7.1 }
  let(:subject) { Tablet.new(brand, os, version) }
  let(:default_apps) { %w(Phone Messages Contacts Calendar) }

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
    it '#volume has a default value of 50' do
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

  context 'Screen brightness management' do
    it '#brightness has a default value of 50' do
      expect(subject.brightness).to eq(50)
    end

    it '#brightness_up increases brightness by 1% with no parameter' do
      subject.brightness_up
      expect(subject.brightness).to eq(51)
    end

    it '#brightness_up increases brightness by amount% if passed amount' do
      subject.brightness_up(20)
      expect(subject.brightness).to eq(70)
    end

    it 'has a maximum brightness of 100' do
      subject.brightness_up(80)
      expect(subject.brightness).to eq(100)
    end

    it '#brightness_down reduces brightness by 1% with no parameter' do
      subject.brightness_down
      expect(subject.brightness).to eq(49)
    end

    it '#brightness_down reduces brightness by amount% if passed amount' do
      subject.brightness_down(20)
      expect(subject.brightness).to eq(30)
    end

    it 'has a minimum brightness of 10' do
      subject.brightness_down(45)
      expect(subject.brightness).to eq(10)
    end
  end

  context 'OS upgrade' do
    it '#upgrade_os will upgrade if the new version is greater than current' do
      expect(subject.upgrade_os(10.0)).to eq('Upgrade to iOS v10.0 complete.')
      expect(subject.os_version).to eq(10.0)
    end

    it '#upgrade_os will return up-to-date message if new version = current' do
      message = 'Software is up to date.'
      expect(subject.upgrade_os(subject.os_version)).to eq(message)
      expect(subject.os_version).to eq(7.1)
    end

    it '#upgrade_os will not install lower versions' do
      message = 'Upgrade failed. Cannot install older versions of iOS'
      expect(subject.upgrade_os(4.0)).to eq(message)
      expect(subject.os_version).to eq(7.1)
    end
  end

  context 'Charging functions' do
    it '#charge reports current charge percentage, initially 50' do
      expect(subject.charge).to eq(50)
    end

    it '#start_charging begins to charge device' do
      expect(subject.start_charging).to be_truthy
    end

    it '#stop_charging stops charging process' do
      subject.start_charging
      sleep(10)
      subject.stop_charging
      expect(subject.charge).to eq(60)
    end

    it '#charge will report charge level during charging' do
      subject.start_charging
      sleep(5)
      expect(subject.charge).to eq(55)
      sleep(5)
      subject.stop_charging
      expect(subject.charge).to eq(60)
    end
  end

  context 'Regression tests' do
    it 'will not uninstall default apps as per bug #90059014' do
      subject.install_app('Phone')
      subject.uninstall_app('Phone')
      expect(subject.apps).to contain_exactly(*default_apps)
    end
  end
end
