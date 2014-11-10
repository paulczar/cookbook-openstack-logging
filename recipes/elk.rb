# Encoding: utf-8
#
# Cookbook Name:: openstack-logging
# Recipe:: elk
#
# Copyright 2014, Paul Czarkowski
#

node.set['kibana']['es_server'] = '127.0.0.1'
node.set['logstash']['instance']['server']['es_server'] = '127.0.0.1'

include_recipe 'openstack-logging::elasticsearch'
include_recipe 'openstack-logging::logstash_server'
include_recipe 'openstack-logging::kibana'
