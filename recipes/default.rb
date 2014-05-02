#
# Cookbook Name:: rackspace_statsdGraphite
# Recipe:: default
#
# Copyright 2014, Rackspace US, Inc.
#
# All rights reserved - Do Not Redistribute
#

recipes = %w()

if node['platform_family'] == 'rhel'
  recipes.push('rackspace_yum')
  recipes.push('rackspace_statsdGraphite::rhel')
end

recipes = %w(
  graphite
  rackspace_statsd
)

unless node['graphite']['whisper_disk'] == ""
	recipes.unshift("rackspace_statsdGraphite::storage")
end

# critical recipes
recipes.each do | recipe |
  include_recipe recipe
end
