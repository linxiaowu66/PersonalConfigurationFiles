# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  config.ssh.username = "root"
  config.ssh.password = "111111"
  config.ssh.insert_key = true

  config.vm.define "frontend" do |frontend|
    frontend.vm.box = "ubuntu/xenial64"
	config.vm.network "forwarded_port", guest: 3000, host: 3000
	config.vm.network "forwarded_port", guest: 3001, host: 3001
    config.vm.network "forwarded_port", guest: 9090, host: 9090
	config.vm.network "forwarded_port", guest: 9091, host: 9091
	config.vm.network "forwarded_port", guest: 9098, host: 9098
	config.vm.network "forwarded_port", guest: 9099, host: 9099
    frontend.vm.hostname = "front-linguang"
    frontend.vm.synced_folder "/ubuntuSync", "/home", create: true
	frontend.vm.provision "shell", path: "provision-frontend.sh"
  end

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #  vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  
end
