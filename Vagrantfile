# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Machines pour le TP Ipv6
  # version 1 avec 2 machines
  #  Réseau physique <= bridge => rt-1 <= reseau privé hôte => client-1
  config.vm.define "rt-1" do |machine|
	# Utilisation de contrib-strech64
	# la version contrib pour avoir les vbox guest installées (repertoire partagé)
	# la version stretch64 (debian9) pour avoir 0,5 Go par machine
    machine.vm.box = "debian/contrib-stretch64"
    machine.vm.box_url = "debian/contrib-stretch64"
	# nom de la premiere machine qui fait le lien entre le réseau réel et le réseau privé
	  machine.vm.hostname = "rt-1"
	# Configuration des 2 interfaces 
    machine.vm.network :private_network, ip: "192.168.56.60"
	  machine.vm.network "public_network", use_dhcp_assigned_default_route: true
    # Un repertoire partagé (Attention il faut les virtualbox Additions installé sur l'hôte)
    machine.vm.synced_folder "./data", "/partage"
    machine.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--name", "rt-1"]
      v.customize ["modifyvm", :id, "--groups", "/CSS_ipv6"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
    machine.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      sleep 3
      service ssh restart
    SHELL
    machine.vm.provision "shell", path: "scripts/install_sys.sh"
    # machine.vm.provision "shell", path: "scripts/install_rt1.sh"
  end
  # Configuration pour la machine pc-1
  config.vm.define "pc-1" do |machine|
    machine.vm.box = "debian/contrib-stretch64"
    machine.vm.box_url = "debian/contrib-stretch64"
	  machine.vm.hostname = "pc-1"
    machine.vm.network :private_network, ip: "192.168.56.61"
    machine.vm.synced_folder "./data", "/partage"
    machine.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--name", "pc-1"]
      v.customize ["modifyvm", :id, "--groups", "/CSS_ipv6"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
    machine.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      sleep 3
      service ssh restart
    SHELL
    machine.vm.provision "shell", path: "scripts/install_sys.sh"
  end

# Deuxieme bloc IPv6
# Configuration du routeur rt-2
  config.vm.define "rt-2" do |machine|
      machine.vm.box = "debian/contrib-stretch64"
      machine.vm.box_url = "debian/contrib-stretch64"
      machine.vm.hostname = "rt-2"
      machine.vm.network :private_network, ip: "192.168.57.60"
      machine.vm.network "public_network", use_dhcp_assigned_default_route: true
      machine.vm.synced_folder "./data", "/partage"
      machine.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--name", "rt-2"]
        v.customize ["modifyvm", :id, "--groups", "/CSS_ipv6"]
        v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["modifyvm", :id, "--memory", 512]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      end
      machine.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        sleep 3
        service ssh restart
      SHELL
      machine.vm.provision "shell", path: "scripts/install_sys.sh"
      # machine.vm.provision "shell", path: "scripts/install_rt2.sh"
    end
### Configuration de la VM pc-2
    config.vm.define "pc-2" do |machine|
      machine.vm.box = "debian/contrib-stretch64"
      machine.vm.box_url = "debian/contrib-stretch64"
      machine.vm.hostname = "pc-2"
      machine.vm.network :private_network, ip: "192.168.57.61"
      machine.vm.synced_folder "./data", "/partage"
      machine.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--name", "pc-2"]
        v.customize ["modifyvm", :id, "--groups", "/CSS_ipv6"]
        v.customize ["modifyvm", :id, "--cpus", "1"]
        v.customize ["modifyvm", :id, "--memory", 512]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      end
      machine.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        sleep 3
        service ssh restart
      SHELL
      machine.vm.provision "shell", path: "scripts/install_sys.sh"
    end
end
