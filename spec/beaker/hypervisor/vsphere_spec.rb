# frozen_string_literal: true

require 'spec_helper'

module Beaker
  describe Vsphere do
    before do
      MockVsphereHelper.set_config(fog_file_contents)
      MockVsphereHelper.set_vms(make_hosts)
      stub_const('VsphereHelper', MockVsphereHelper)
    end

    describe '#provision' do
      it 'provisions hosts' do
        MockVsphereHelper.powerOff
        vsphere = described_class.new(make_hosts, make_opts)

        vsphere.provision

        hosts = vsphere.instance_variable_get(:@hosts)
        hosts.each do |host|
          expect(MockVsphereHelper.find_vm(host.name).powerState)
        end
      end

      it 'raises an error if a vm is missing in Vsphere' do
        MockVsphereHelper.powerOff
        hosts = make_hosts
        hosts[0][:vmname] = 'unknown'
        vsphere = described_class.new(hosts, make_opts)

        expect { vsphere.provision }.to raise_error
      end

      it 'raises an error if a vm does not have a given snapshot name' do
        MockVsphereHelper.powerOff
        hosts = make_hosts
        hosts[0]['snapshot'] = 'unknown'
        vsphere = described_class.new(hosts, make_opts)

        expect { vsphere.provision }.to raise_error
      end

      it 'provisions hosts if no snapshot is provided' do
        MockVsphereHelper.powerOff
        hosts = make_hosts
        hosts[0]['snapshot'] = nil
        vsphere = described_class.new(hosts, make_opts)

        vsphere.provision

        hosts.each do |host|
          expect(MockVsphereHelper.find_vm(host.name).powerState)
        end
      end
    end

    describe '#cleanup' do
      it 'cleans up' do
        MockVsphereHelper.powerOn
        vsphere = described_class.new(make_hosts, make_opts)
        vsphere.cleanup

        hosts = vsphere.instance_variable_get(:@hosts)
        hosts.each do |host|
          expect(MockVsphereHelper.find_vm(host.name).powerState)
        end
      end

      it 'raises an error if a vm is missing in Vsphere' do
        MockVsphereHelper.powerOn
        hosts = make_hosts
        hosts[0][:vmname] = 'unknown'
        vsphere = described_class.new(hosts, make_opts)

        expect { vsphere.cleanup }.to raise_error
      end
    end
  end
end
