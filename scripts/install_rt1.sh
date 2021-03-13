#!/bin/bash

## Install system for rt-1 vm.

IP=$(hostname -I | awk '{print $2}')

echo "START - Configuration for rt-1 vm - "$IP

echo "=> [1]: Installing required packages..."
DEBIAN_FRONTEND=noninteractive
apt-get install -o Dpkg::Progress-Fancy="0" -q -y \
	tcpdump \
	radvd \
    > /tmp/install_sys.log 2>&1

echo "=> [2]: Configuration of /etc/sysctl.conf (temporary address et forwarding) ..."
echo "net.ipv6.conf.all.use_tempaddr=2" >> /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p

echo "=> [2]: Configure /etc/network/interface (eth1 and eth2) ..."
# A vous d'essayer

echo "=> [3]: Configure radvd daemon (router advertisement)"
# A vous d'automatiser ;-) 

echo "END - Configuration for rt-1 vm - "$IP
