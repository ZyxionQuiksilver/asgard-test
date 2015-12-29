#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "nginx" do
	action	[:upgrade, :install]
end

service "nginx" do
	supports :restart => true, :reload => true
	action [:enable, :start]
end
