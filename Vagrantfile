# -*- mode: ruby -*-
# vi: set ft=ruby :
# Original script on https://github.com/orendon/vagrant-rails

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "phusion/ubuntu-14.04-amd64"

  # Forward rails server port to your host machine
  #
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Install linux packages
  #
  config.vm.provision :shell, path: "https://github.com/orendon/vagrant-rails/raw/master/script/vagrant_bootstrap.sh", privileged: false

  # Uncomment this line if you want to bundle install and setup/create database (optional)
  # The path: option accepts a script on your local filesystem in case you want to provide your own
  #
  config.vm.provision :shell, path: "https://github.com/orendon/vagrant-rails/raw/master/script/app_specifics.sh", privileged: false

  # Use an specific IP address on your local network
  #
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Share additional folders to the guest VM
  #
  # config.vm.synced_folder "../folder_on_your_host_machine", "/folder_on_vagrant_vm"

  # Provider-specific configuration so you can fine-tune various
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
end
