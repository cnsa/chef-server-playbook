Vagrant.configure('2') do |config|
  config.vm.box = 'chef/centos-6.6'

  config.vm.provider "virtualbox" do |v|
    v.customize [
      'modifyvm', :id,
      "--ioapic", "on",
      '--memory', 4096,
      '--cpus', 4,
      '--natdnshostresolver1', 'on',
      '--natdnsproxy1', 'on'
    ]
  end

  config.vm.network :private_network, ip: "192.168.0.43"

  config.vm.provision "ansible" do |a|
    a.playbook = "playbook.yml"
    a.limit = "vagrant"
    a.inventory_path = "hosts"
  end
end
