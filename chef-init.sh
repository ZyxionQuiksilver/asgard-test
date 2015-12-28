#!/bin/bash
cd ~
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/x86_64/chef_12.6.0-1_amd64.deb
sudo dpkg -i chef_12.6.0-1_amd64.deb
cd ~/.chef/
git clone https://github.com/ZyxionQuiksilver/asgard-test.git
sudo chef-client -z -j 
