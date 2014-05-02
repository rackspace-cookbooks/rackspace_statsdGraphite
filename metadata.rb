name             'rackspace-statsdGraphite'
maintainer       'Rackspace'
maintainer_email 'ryan.richard@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures statsd_graphite-rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.8'

depends 'rackspace_graphite', '~> 0.4'
depends 'rackspace_statsd', '~> 1.0'

suggests 'rackspace_cloudmonitoring', '~> 1.0.0'

