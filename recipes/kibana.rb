# Encoding: utf-8
#
# Cookbook Name:: openstack-logging
# Recipe:: kibana
#
# Copyright 2014, Paul Czarkowski
#

include_recipe 'chef-sugar::default'

if node['kibana']['es_server']
  es_server = node['kibana']['es_server']
else
  if Chef::Config[:solo]
    es_server = '127.0.0.1'
  else
    es_server = search_for_nodes(node['elasticsearch']['discovery']['search_query'],
                                 node['elasticsearch']['discovery']['node_attribute']).first
  end
end

include_recipe 'kibana::default'

webserver = node['kibana']['webserver']
kibana_user = node[webserver]['user']

kibana_install 'kibana' do
  user kibana_user
  group kibana_user
  install_dir node['kibana']['install_dir']
  install_type node['kibana']['install_type']
end

kibana_web 'kibana' do
  type webserver
  docroot "#{node['kibana']['install_dir']}/current"
  es_server es_server
  not_if { node['kibana']['webserver'].empty? }
end
