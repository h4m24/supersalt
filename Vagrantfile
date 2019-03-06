# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.define "master" do |master|

    master.vm.network "private_network", ip: "192.168.5.11"
    master.vm.synced_folder "./salt_repo", "/srv/salt"
    master.vm.provision :salt do |salt|

      # salt.masterless = true
      salt.log_level = "error"

      salt.install_master = true
      salt.run_highstate  = false

      salt.master_config  = "config/master/master"
      salt.minion_config  = "config/master/minion"

      salt.master_key     = "keys/master/master.pem"
      salt.master_pub     = "keys/master/master.pub"

    end
  end

  config.vm.define "minion" do |minion|

    minion.vm.network "private_network", ip: "192.168.5.51"
    minion.vm.provision :salt do |salt|

      salt.masterless = false
      salt.run_highstate = false

      salt.log_level = "error"
      salt.minion_config  = "config/minion/minion"
    end

  end

  config.ssh.insert_key

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize [
     'modifyvm',                :id,
     '--memory',                '1024',
     '--cpus',                  '4',
     '--uartmode1',              'disconnected',
     '--natdnsproxy1',          'on',
     '--natdnshostresolver1',   'on',
     '--ioapic',                'on'
   ]

  end

end
