#!/bin/bash

PACKER_VERSION=1.5.5
VBOX_VERSION=6.1

VBOX_APT_KEYS=(
  http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc
  https://www.virtualbox.org/download/oracle_vbox.asc
)

sudo apt update
sudo apt install aptitude
sudo aptitude upgrade -y
sudo aptitude install -y software-properties-common wget
sudo apt-add-repository --yes ppa:ansible/ansible

echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
for APT_KEY in "${VBOX_APT_KEYS[@]}"; do
  wget -q -O- "${APT_KEY}" | sudo apt-key add -
done

sudo aptitude update

sudo aptitude install -y linux-headers-"$(uname -r)" virtualbox-"${VBOX_VERSION}" ansible
wget https://releases.hashicorp.com/packer/"${PACKER_VERSION}"/packer_"${PACKER_VERSION}"_linux_amd64.zip
unzip packer_"${PACKER_VERSION}"_linux_amd64.zip
sudo mv packer /usr/local/bin