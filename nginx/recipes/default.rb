#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#cookbook_file   "/etc/apt/sources.list.d/nginx.list" do
#        source          "nginx.repo"
#        owner           "root"
#        group           "root"
#        mode            "0644"
#        action          :create
#end

#include_recipe "apt"

#apt_repository "nginx-stable" do
#	uri 	"http://ppa.launchpad.net/nginx/stable/ubuntu"
#	components ["main"]
#	distribution "trusty"
#	key "C300EE8C"
#	keyserver "keyserver.ubuntu.com"
#	action :add
#	deb_src :true	
#end

apt_repository "nginx" do
        uri "http://nginx.org/packages/mainline/ubuntu"
        distribution node['lsb']['codename']
        components ['nginx']
        key 'http://nginx.org/keys/nginx_signing.key'
        action :add
        deb_src true
end

package "nginx" do
	#notifies :run, 'execute[apt-get update]', :immediately
	options 'Y'
	action	[:upgrade, :install]
end

service "nginx" do
	supports :restart => true, :reload => true
	action [:enable, :start]
end
