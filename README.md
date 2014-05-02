rackspace_statsdGraphite
=================================
This is a basic cookbook to set up statsd and graphite on the same server. This cookbook will also allow you to define cloud monitoring checks that will run against graphite.


Requirements
------------

### Cookbooks
- graphite
- rackspace_statsd
- WIP - rackspace_cloudmonitoring -  requires node data node['cloud_monitoring']['rackspace_username'] and node['cloud_monitoring']['rackspace_api_key'],

Attributes
----------
- ['graphite']['whisper_disk'] - disk that will be formatted/mounted for the whisper database. Modifying this will auto add the needed recipce. no Default.
- ['graphite']['whisper_filesystem'] - filessytem for secondary storage. Default `ext4`
- ['graphite']['whisper_fs_options'] - options when formatting disk
- ['statsd']['maas_plugin'] - placeholder for check to be defined that will query against Graphite and pass to Cloud Monitoring for alarms. See See https://github.com/rackops/code-snippets/tree/master/GraphiteMaasPlugin for more info

Usage
-----
#### rackspace-statsdGraphite::default
Just include `rackspace-statsdGraphite` in your node's `run_list`. It will auto add the statsd and graphite recipes.

TODO:
-----
If you want to enable monitoring, also include the `rackspace-statsdGraphite::monitor` in your run list

License and Authors
-------------------
Authors:  ryan.richard@rackspace.com
