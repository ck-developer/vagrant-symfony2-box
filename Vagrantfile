# -*- mode: ruby -*-
# vi: set ft=ruby :

# General project settings
# -----------------------------
box_name = "symfony-box"
box_memory = "512"
projects_hosts = "symfony-box.local"
projects_hosts_aliases = [
  "www.symfony-box.local",
  "admin.symfony-box.local", 
]
ip_address = "192.168.10.10"

# Vagrant configuration
# -----------------------------
Vagrant.configure("2") do |config|

  config.vm.box = box_name
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.define box_name do |node|
    node.vm.hostname = projects_hosts
    node.vm.network :private_network, ip: ip_address
    node.hostmanager.aliases = projects_hosts_aliases
  end
  config.vm.provision :hostmanager
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--name", box_name]
    v.customize ["modifyvm", :id, "--memory", box_memory]
  end

  nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
  config.vm.synced_folder "./public", "/var/www", id: "vagrant-root" , :nfs => nfs_setting

  config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.options = ['--verbose']
  end
end
