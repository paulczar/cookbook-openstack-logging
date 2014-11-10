# Encoding: utf-8
#
# Cookbook Name:: openstack-logging
# Attributes:: default
#
# Copyright 2014, Paul Czarkowski
#

# Set java versions
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '7'
default['java']['oracle']['accept_oracle_download_terms'] = true

# kibana settings
default['kibana']['webserver'] = 'apache'

# logstash server settings
default['logstash']['instance']['server']['xms'] = '1024M'
default['logstash']['instance']['server']['xmx'] = '1024M'
default['logstash']['instance']['server']['workers'] = 2
default['logstash']['instance']['server']['config_templates_cookbook'] = 'openstack-logging'
default['logstash']['instance']['server']['config_templates'] = {
  input_redis: 'logstash_server/input_redis.conf.erb',
  filter_openstack: 'logstash_server/filter_openstack.conf.erb',
  output_elasticsearch: 'logstash_server/output_elasticsearch.conf.erb'
}
