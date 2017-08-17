#
# Cookbook:: mongo
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'name' do

	keyserver "hkp://keyserver.ubuntu.com:80"
	key "EA312927"
	components ["multiverse"]
	distribution "xenial/mongodb-org/3.2"
	uri "http://repo.mongodb.org/apt/ubuntu"

end

package 'mongodb-org'

template "/lib/systemd/system/mongod.service" do

	source 'mongod.service.erb'
	owner 'root'
	group 'root'
	mode '755'
	notifies :restart, 'service[mongod]'

end

template "/etc/mongod.conf" do

	source 'mongod.conf.erb'
	owner 'root'
	group 'root'
	mode '755'
	notifies :restart, 'service[mongod]'

end

service 'mongod' do
	supports :restart => true, :reload => true, :start => true
	action [:enable, :start]
end