#
# Cookbook Name:: statsd_graphite-rolebook
# Recipe:: default
#
# Copyright 2014, Rackspace US, Inc.
#
# All rights reserved - Do Not Redistribute
#

node.default['graphite']['timezone'] = 'UTC'

critical_recipes = [
  "graphite",
  "rackspace_statsd"
]

unless node['graphite']['whisper_disk'] == ""
	critical_recipes.unshift("rackspace_statsdGraphite::storage")
end

#Run critical recipes
critical_recipes.each do | recipe |
  include_recipe recipe
end
