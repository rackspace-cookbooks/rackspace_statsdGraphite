statsd_graphite-rolebook Cookbook
=================================
This is a basic cookbook to set up statsd and graphite on the same server. This cookbook will also allow you to define cloud monitoring checks that will run against graphite.


Requirements
------------

### Cookbooks
- graphite
- statsd
- cloud_monitoring -  requires node data node['cloud_monitoring']['rackspace_username'] and node['cloud_monitoring']['rackspace_api_key'],

Attributes
----------
['graphite']['whisper_disk'] - disk that will be formatted/mounted for the whisper database. Modifying this will auto add the needed recipce. no Default.
['graphite']['whisper_filesystem'] - filessytem for secondary storage. Default `ext4`
['graphite']['whisper_fs_options'] - options when formatting disk
['statsd']['maas_plugin'] - placeholder for check to be defined that will query against Graphite and pass to Cloud Monitoring for alarms. See See https://github.com/rackops/code-snippets/tree/master/GraphiteMaasPlugin for more info

Usage
-----
#### statsd_graphite-rolebook::default
Just include `statsd_graphite-rolebook` in your node's `run_list`. It will auto add the statsd and graphite recipes.

If you want to enable monitoring, also include the `statsd_graphite-rolebook::monitor` in your run list

Contributing
------------
If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:  ryan.richard@rackspace.com
