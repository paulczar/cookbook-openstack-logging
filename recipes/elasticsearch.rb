# Encoding: utf-8
#
# Cookbook Name:: openstack-logging
# Recipe:: elasticsearch
#
# Copyright 2014, Paul Czarkowski
#

include_recipe 'chef-sugar::default'
include_recipe 'java::default'

include_recipe 'elasticsearch::search_discovery' unless Chef::Config[:solo]
include_recipe 'elasticsearch::default'
include_recipe 'elasticsearch::plugins'
