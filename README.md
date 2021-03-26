# TP IPv6 pour l'option CSS

Les fichiers vagrants pour la mise en place du Labs  sur IPv6

## Les pré-requis

### Les ressources informatiques

Pour faire fonctionner ce Labs il faut prévoir au moins 2 CPU /coeurs et 4Go de Ram. L'espace disque est relativement négligeable 4Go.
La virtualisation activée sur le PC hôte

### Les applications obligatoires

* Oracle Virtualbox version 6.1 (<https://www.virtualbox.org/wiki/Downloads>)
* Oracle VM VirtualBox Extension Pack (<https://download.virtualbox.org/virtualbox/6.1.18/Oracle_VM_VirtualBox_Extension_Pack-6.1.18.vbox-extpack>)
* HashiCorp Vagrant (<https://www.vagrantup.com/>)

### Les fichiers obligatoires

* choisir le zip en haut à gauche
* cloner avec git : git clone https://github.com/chavinje/css_tp_ipv6.git

Vous trouverez les reperoires/fichiers :

* ./Vagrantfile : qui contient l'ensemble des déclarations pour la construction du Labs
* scripts/install_sys.sh : exécuté lors de la création de toute les VMs. En théorie il n'y a rien a modifier.
* scripts/install-rt(1-2).sh : script qui permet de tous configurer lors de la création ou y faire appel à partir de la VM. Ils sont prévus pour les VM rt-x
* data/* : un réperoire partagé entre les VMs et le poste hôte. Permet l'échange de fichier entre toutes les machines (capture tcpdump par exemple)

## Description du Labs

Le labs est constitué de 4 machines virtuelles Virtualbox. 
Elles représentent les 2 réseaux IPv6 nécessaires aux activités du tp

### le premier ensemble

<b>pc-1</b> <= réseau privé 56 => <b>rt-1</b> <= bridge => <b>rt-2</b> <= réseau privé 57 => <b>pc-2</b>

* rt-1 : machine virtuelle avec 2 interfaces en plus du NAT pour vagrant
  * eth0 : NAT 
  * eth1 : réseau privé hôte pour l'intéraction entre les machines du réseau 1 (réseau ipv4 192.168.56.0/24)
  * eth2 : réseau bridge pour l'intéraction avec le 2em réseau IPv6
* pc-1 : un PC simple sans configuration particulière 
  * eth0 : NAT
  * eth1 : réseau privé hôte pour l'intéraction entre les machines du réseau 1 (réseau ipv4 192.168.56.0/24)

* Les machines rt-2 et pc-2 sont identiques à par le réseau ipv4 associé qui est 192.168.57.0/24

## Utilisation des commandes vagrant

Télécharger la box modèle
    ```vagrant box add debian/contrib-stretch64```
Activer une VM uniquement (rt-1 par exemple)
    ```vagrant up rt-1```
Se connecter à une VM (rt-1 par exemple)
    ```vagrant ssh rt-1```
Arréter une VM (rt-1 par exemple)
    ```vagrant halt rt-1```
Détruire toutes les VMs (sans demande de confirmation)
    ```vagrant destroy -f```