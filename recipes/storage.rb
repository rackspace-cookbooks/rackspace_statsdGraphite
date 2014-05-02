#
# Cookbook Name:: rackspace_statsdGraphite
# Recipe:: storage
#
# Copyright 2014, Rackspace US, Inc.
#
# All rights reserved - Do Not Redistribute
#

device = node['graphite']['whisper_disk']
filesystem = node['graphite']['whisper_filesystem']
options = node['graphite']['whisper_fs_options']

if node['filesystem']['#{device}'].nil?
  execute "formatting #{filesystem} on #{device}" do
    command "mkfs -t #{filesystem} #{options} #{device}"
      not_if do
        # wait for the device
        loop do
          if File.blockdev?(device)
            Chef::Log.info("device #{device} ready")
            break
          else
            Chef::Log.info("device #{device} not ready - waiting")
            sleep 10
          end
      end
        # check volume filesystem
        system("blkid -s TYPE -o value #{device}")
    end
  end

    directory "/mnt/storage" do
    	owner node['graphite']['user_account']
    	group node['graphite']['group_account']
    	mode "0755"
    	action :create
    end

    Chef::Log.info("mounting #{device} as /mnt/storage")

    mount "/mnt/storage" do
  	    device device
  	  	fstype filesystem
  	    action [:mount, :enable]
    end

    directory "/mnt/storage/graphite" do
    	owner node['graphite']['user_account']
    	group node['graphite']['group_account']
    	mode "0755"
    	action :create
    end

    node.set['graphite']['storage_dir'] = "/mnt/storage/graphite"

else
    Chef::Log.info("device #{device} already has filesystem #{node['#{device}']['fs_type']}...skipping mkfs and mount")
end
