

default['graphite']['whisper_disk'] = ''
default['graphite']['whisper_filesystem'] = 'ext4'
#options to format fs with. example "-b 1024 -L foo "
default['graphite']['whisper_fs_options'] = ''

#populate hash with url monitors. See https://github.com/rackops/code-snippets/tree/master/GraphiteMaasPlugin for more info
default['statsd']['maas_plugin'] = {}
