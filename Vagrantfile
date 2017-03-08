VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "frontend" do |frontend|
    config.vm.box = "ubuntu/xenial64"
    # config.vm.box_url = ""
  end

  # config.vm.network :private_network, ip: "10.0.1.7"
  # config.ssh.forward_agent = true
  # config.ssh.forward_x11 = true
  config.vm.hostname = "front-linguang"
  config.vm.synced_folder "/home", "/Ubuntu_Sync", create: true

  config.vm.network :forwarded_port, guest: 3000, host: 3000    # rails
#  config.vm.network :forwarded_port, guest: 9292, host: 9292    # rack
#  config.vm.network :forwarded_port, guest: 4567, host: 4567    # sinatra
#  config.vm.network :forwarded_port, guest: 1080, host: 1080    # mailcatcher
#  config.vm.network :forwarded_port, guest: 8888, host: 8888    # jasmine
#  config.vm.network :forwarded_port, guest: 3306, host: 3306    # mysql


  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", ENV["vm_memory"] || "2048"]
    vb.customize ["modifyvm", :id, "--cpus", ENV["vm_cpus"] || "4"]
    vb.customize ["modifyvm", :id, "--vram", "12"]

    vb.customize [
      "setextradata", :id,
      "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"
    ]
  end

  config.vm.define "frontend" do |frontend|
    config.vm.provision "shell", path: "provision-frontend.sh"
  end
end
