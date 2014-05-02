#
# Cookbook Name:: rackspace_statsdGraphite
# Recipe:: monitor
#
# Copyright 2014, Rackspace US, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'rackspace_cloudmonitoring'
include_recipe 'rackspace_cloudmonitoring::monitors'

rackspace_cloudmonitoring_entity node['hostname'] do
  agent_id      node['rackspace_cloudmonitoring']['config']['agent']['id']
  search_method 'ip'
  search_ip     node['ipaddress']
  ip_addresses  ip: node['ipaddress']
end

template '/usr/lib/rackspace-monitoring-agent/plugins/graphite_maas.py' do
  source 'graphite_maas.py.erb'
  mode 0655
  owner 'root'
  group 'root'
  variables(
     statsdChecks: node['statsd']['maas_plugin']
  )
end

rackspace_cloudmonitoring_check  'graphite_maas' do
  type                  'agent.plugin'
  period                30
  timeout               10
  details               'file' => 'graphite_maas.py'
  rackspace_username    node['rackspace_cloudmonitoring']['rackspace_username']
  rackspace_api_key     node['rackspace_cloudmonitoring']['rackspace_api_key']
  action :create
end
