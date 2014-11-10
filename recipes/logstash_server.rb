# Encoding: utf-8
#
# Cookbook Name:: openstack-logging
# Recipe:: elasticsearch
#
# Copyright 2014, Paul Czarkowski
#

include_recipe 'chef-sugar::default'
include_recipe 'java::default'

include_recipe 'logstash::default'

if node['logstash']['instance']['server']['es_server']
  es_server = node['logstash']['instance']['server']['es_server']
else
  if Chef::Config[:solo]
    es_server = '127.0.0.1'
  else
    es_server = search_for_nodes(node['elasticsearch']['discovery']['search_query'],
                                 node['elasticsearch']['discovery']['node_attribute']).first
  end
end

name = 'server'

logstash_instance name

logstash_service name do
  action :enable
end

logstash_config name do
  variables(
    elasticsearch_ip: es_server
  )
end

logstash_service name do
  action :start
end

logstash_curator name do
  only_if { node['logstash']['curator_node'] }
end
