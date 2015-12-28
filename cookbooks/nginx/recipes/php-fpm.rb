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
	supports :restart => true, :reload => true
	action [:enable, :start]
end

cookbook_file 	"/usr/share/nginx/html/phpinfo.php" do
	source 		"phpinfo.php"
	owner 		"root"
	group 		"root"
	mode 		"0644"
	action		:create
	notifies	:reload, "service[nginx]", :immediately
end

cookbook_file 	"/etc/nginx/sites-available/default" do
	source 		"default"
	owner 		"root"
	group 		"root"
	mode 		"0644"
	action		:create
	notifies	:reload, "service[nginx]", :immediately
end

cookbook_file	"/etc/php5/fpm/php.ini" do
	source		"php.ini"
	owner		"root"
	group		"root"
	mode		"0644"
	action		:create
	notifies	:reload, "service[php5-fpm]", :immediately
end

cookbook_file	"/etc/php5/fpm/pool.d/www.conf" do
	source		"www.conf"
	owner		"root"
	group		"root"
	mode		"0644"
	action		:create
	notifies	:reload, "service[php5-fpm]", :immediately
end
