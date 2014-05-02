name             'rackspace_statsdGraphite'
maintainer       'Rackspace'
maintainer_email 'ryan.richard@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures statsd_graphite-rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'graphite', '= 0.4.8'
depends 'rackspace_statsd', '~> 1.0'

suggests 'rackspace_cloudmonitoring', '~> 3.1'
