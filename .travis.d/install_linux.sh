#!/bin/bash

PACKER_VERSION=1.5.5
VBOX_VERSION=6.1

sudo apt upgrade -y
sudo apt install -y software-properties-common
sudo apt-add-repository --yes ppa:ansible/ansible
wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
sudo apt update

sudo apt install -y linux-headers-"$(uname -r)" virtualbox-"${VBOX_VERSION}" ansible
wget https://releases.hashicorp.com/packer/"${PACKER_VERSION}"/packer_"${PACKER_VERSION}"_linux_amd64.zip
unzip packer_"${PACKER_VERSION}"_linux_amd64.zip
sudo mv packer /usr/local/bin