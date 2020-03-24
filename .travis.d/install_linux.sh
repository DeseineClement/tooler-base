#!/bin/bash

wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | apt-key add -
apt-get update
apt-get install linux-headers-`uname -r` virtualbox