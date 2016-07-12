# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
require 'fileutils'

CONFIGURATION_YAML = YAML.load_file('config.yaml')

Vagrant.configure(2) do |config|
	CONFIGURATION_YAML["servers"].each do |server|
		if defined?(server['enabled']) && server['enabled'] != false
			puts "Provisioning VirtualBox with hostname: ", server['hostname']
			config.vm.define server["hostname"] do |server_config|
				server_config.vm.box = server["box"]
				server_config.vm.host_name = server["hostname"]
				server_config.vm.network :private_network, ip: server["ip"]
				memory = server["ram"] ? server["ram"] : 256;

				server_config.vm.provider :virtualbox do |vb|
					vb.name = server["hostname"]
					vb.check_guest_additions = false
					vb.functional_vboxsf = false
					vb.gui = false
					vb.customize ["modifyvm", :id, "--groups", "/WSO2-Puppet-Dev"]
					vb.customize ["modifyvm", :id, "--memory", server["ram"]]
					vb.customize ["modifyvm", :id, "--cpus", server["cpu"]]
				end
			end
		end
	end
end
