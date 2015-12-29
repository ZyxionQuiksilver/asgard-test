#!/bin/bash
cd ~
if [ ! -f chef_12.6.0-1_amd64.deb ] 
	then
		wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/x86_64/chef_12.6.0-1_amd64.deb
fi
sudo dpkg -i chef_12.6.0-1_amd64.deb
sudo apt-get install git -y
sudo mkdir /home/zxq/.chef/cookbooks
sudo git clone https://github.com/ZyxionQuiksilver/asgard-test.git /home/zxq/.chef/cookbooks/
#mkdir ~/.chef
#chmod 775 ~/.chef
#mkdir ~/.chef/cookbooks
#cd ~/asgard-test
#cp -r ~/asgard-test ~/.chef/cookbooks
#sudo cp -r ~/asgard-test ~/.chef/cookbooks
cd /home/zxq/.chef/cookbooks
sudo chef-client -z -j /home/zxq/.chef/cookbooks/recipes.json 
