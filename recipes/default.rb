#
# Cookbook Name:: vagrant_basebox
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
chef_gem "ruby-shadow"

user "vagrant" do 
	password "$1$6dr8jpVV$C0QUjHnZ1o0eUo6aVGpIB0"
	supports :manage_home => true
end

directory "/home/vagrant/.ssh" do
	mode 0700
	owner 'vagrant'
	group 'vagrant'
end

file "/home/vagrant/.ssh/authorized_keys" do
	content "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
	mode 0755
	owner 'vagrant'
	group 'vagrant'
end

cookbook_file "/etc/sudoers" do
	mode 0440
end

sudo 'vagrant' do
  user      "vagrant"    # or a username
  nopasswd 	true
  runas     'ALL'   # or 'app_user:tomcat'
  commands  ['ALL']
end

#include_recipe "vagrant_basebox::vbox_guest_additions"