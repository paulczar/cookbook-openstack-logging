openstack-logging Cookbook
==========================

This cookbook is a very opninionated central logging solution for Openstack infrastructure.

Attributes
----------

Attributes are self documented in `attributes/*`

Usage
-----

The documented/default architecture is to have n+1 large systems running the whole ELK stack.

#### openstack-logging::elk

Installs Elasticsearch, Kibana, Logstash, and sets up logstash to listen on TCP port 10514, filter for logstash apps, output to elasticsearch via http.

Contributing
------------

you know what to do.

License and Authors
-------------------

Paul Czarkowski - `@pczarkowski`

Copyright 2014, Paul Czarkowski

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
