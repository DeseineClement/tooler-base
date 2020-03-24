#!/bin/bash

wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install linux-headers-`uname -r` virtualbox