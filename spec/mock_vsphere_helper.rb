class MockVsphereSnapshot
  attr_accessor :name

  def RevertToSnapshot_Task
    self
  end

  def wait_for_completion
    true
  end
end

class MockVsphereVM
  attr_accessor :name, :powerState, :snapshot, :template, :toolsRunningStatus

  def initialize
    @powerState = 'poweredOff'
    @toolsRunningStatus = 'guestToolsStopped'
    @first = true
  end

  def runtime
    self
  end

  attr_reader :powerState

  def toolsRunningStatus
    prev = @toolsRunningStatus
    @toolsRunningStatus = 'guestToolsRunning'
    prev
  end

  def PowerOnVM_Task
    @powerState = 'poweredOn'
    self
  end

  def PowerOffVM_Task
    @powerState = 'poweredOff'
    self
  end

  def summary
    self
  end

  def guest
    self
  end

  def ipAddress
    @toolsRunningStatus = 'guestToolsRunning'
    "#{@name}.ip.address"
  end

  def CloneVM_Task(opts)
    clone = MockVsphereVM.new
    clone.name = opts[:name]
    clone.snapshot = snapshot
    clone.template = template
    clone.PowerOnVM_Task
    MockVsphereHelper.add_vm(opts[:name], clone)
    clone
  end

  def wait_for_completion
    true
  end

  def Destroy_Task
    true
  end
end

class MockVsphereHelper
  @@fog_file = {}
  @@vms = {}

  def initialize(arg); end

  def self.add_vm(name, vm)
    @@vms[name] = vm
  end

  def self.set_config(conf)
    @@fog_file = conf
  end

  def self.powerOn
    @@vms.each_value do |vm|
      vm.powerState = 'poweredOn'
    end
  end

  def self.powerOff
    @@vms.each_value do |vm|
      vm.powerState = 'poweredOff'
    end
  end

  def self.set_vms(hosts)
    @@vms = {}
    hosts.each do |host|
      vm = MockVsphereVM.new
      vm.name = host.name
      vm.snapshot = MockVsphereSnapshot.new
      vm.snapshot.name = host[:snapshot]
      @@vms[host.name] = vm
      template = MockVsphereVM.new
      template.name = host[:template]
      template.snapshot = MockVsphereSnapshot.new
      template.snapshot.name = host[:snapshot]
      @@vms[host[:template]] = template
    end
  end

  def self.load_config(_file)
    @@fog_file
  end

  def find_vms(keys)
    found = {}
    keys = ([] << keys)
    keys.flatten!
    keys.each do |key|
      found[key] = @@vms[key] if @@vms.has_key?(key)
    end
    found
  end

  def self.find_vm(key)
    return unless @@vms.has_key?(key)

    @@vms[key]
  end

  def find_snapshot(vm, snap)
    return unless @@vms[vm.name].snapshot.name == snap

    @@vms[vm.name].snapshot
  end

  def find_customization(_template)
    nil
  end

  def find_datastore(_dc, datastore)
    datastore
  end

  def find_pool(_dc, pool)
    pool
  end

  def find_folder(_dc, folder)
    folder
  end

  def wait_for_tasks(_tasks, _try, _attempts)
    true
  end

  def close
    true
  end
end
