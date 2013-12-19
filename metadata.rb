name             'statsd_graphite-rolebook'
maintainer       'Rackspace'
maintainer_email 'ryan.richard@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures statsd_graphite-rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.6'

depends 'graphite', '~> 0.4.3'
depends 'statsd', '~> 0.1.0'
depends 'cloud_monitoring', '~> 1.0.0'
