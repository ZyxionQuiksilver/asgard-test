#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "php5-fpm" do
	action	:install
end

service "php5-fpm" do
	action [:enable, :start]
end
