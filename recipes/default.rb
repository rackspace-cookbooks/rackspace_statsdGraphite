#
# Cookbook Name:: statsd_graphite-rolebook
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.default['graphite']['timezone'] = 'UTC'

critical_recipes = [
  "graphite",
  "statsd"
]

unless node['graphite']['whisper_disk'] == ""
	critical_recipes.unshift("statsd_graphite-rolebook::storage")
end

#Run critical recipes
critical_recipes.each do | recipe |
  include_recipe recipe
end

non_critical_recipes = [
]

#Run non-critical recipes
non_critical_recipes.each do | recipe |
  include_recipe recipe do
          ignore_failure true
  end
end