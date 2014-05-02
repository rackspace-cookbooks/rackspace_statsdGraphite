#
# Cookbook Name:: rackspace_statsdGraphite
# Recipe:: monitor
#
# Copyright 2014, Rackspace US, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "cloud_monitoring"
include_recipe "cloud_monitoring::agent"

require 'fog'

service = Fog::Rackspace::Monitoring.new({
    :rackspace_username  => node['cloud_monitoring']['rackspace_username'],
    :rackspace_api_key   => node['cloud_monitoring']['rackspace_api_key'],
    :rackspace_region    => node['rackspace']['region']
})

response = service.list_entities.body

response["values"].each do |value|
  unless value["ip_addresses"].nil?
    if value["ip_addresses"]["private0_v4"].eql? node["cloud"]["local_ipv4"]
      node.set['cloud_monitoring']['label'] = value["label"]
    end
  end
end

if node['cloud_monitoring']['label'].nil?
  node.set['cloud_monitoring']['label'] = node.hostname
end

cloud_monitoring_entity node['cloud_monitoring']['label'] do
  label                 node['cloud_monitoring']['label']
  agent_id              node['cloud_monitoring']['agent']['id']
  rackspace_username    node['cloud_monitoring']['rackspace_username']
  rackspace_api_key     node['cloud_monitoring']['rackspace_api_key']
  action :create
end

template "/usr/lib/rackspace-monitoring-agent/plugins/graphite_maas.py" do
  source "graphite_maas.py.erb"
  mode 0655
  owner "root"
  group "root"
  variables({
     :statsdChecks => node['statsd']['maas_plugin']
  })
end

cloud_monitoring_check  "graphite_maas" do
  type                  'agent.plugin'
  period                30
  timeout               10
  details               'file' => 'graphite_maas.py'
  rackspace_username    node['cloud_monitoring']['rackspace_username']
  rackspace_api_key     node['cloud_monitoring']['rackspace_api_key']
  action :create
end
