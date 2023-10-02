# automate the task of creating a custom HTTP header response, but with Puppet.
exec { 'update':
  command  => 'sudo apt-get update',
  provider => shell,
}

package { 'nginx':
  ensure  => installed,
  require => Exec['update'],
}

file_line { 'host':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'add_header X-Served-By $HOSTNAME;',
  require => Package['nginx'],
}

exec { 'nginx restart':
  command  => 'sudo service nginx restart',
  provider => shell,
}
