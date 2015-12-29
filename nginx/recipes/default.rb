#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file   "/etc/apt/sources.list.d/nginx.list" do
        source          "nginx.repo"
        owner           "root"
        group           "root"
        mode            "0644"
        action          :create
end

include_recipe 'apt'

package "nginx" do
	action	:install
end

service "nginx" do
	supports :restart => true, :reload => true
	action [:enable, :start]
end
