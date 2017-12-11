# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "10.100.20.38"
    provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible
    config.vm.hostname = "usterix"
    config.vm.synced_folder "public_html", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
    config.ssh.forward_agent = true
    config.ssh.username = "ubuntu"
    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision/playbook.yml"
    end
    config.vm.provider "virtualbox" do |v|
       v.memory = 2048
       v.cpus = 2
       v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    end
    # Optional NFS. Make sure to remove other synced_folder line too
    #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }
end
