# Encoding: utf-8
name             'openstack-logging'
maintainer       'Paul Czarkowski'
maintainer_email 'username.taken@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures openstack-logging'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(ubuntu debian).each do |os|
  supports os
end

%w(java logstash kibana elasticsearch apt chef-sugar).each do |ckbk|
  depends ckbk
end
