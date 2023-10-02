# automate the task of creating a custom HTTP header response, but with Puppet.
exec { 'update':
  command  => 'sudo apt-get update',
  provider => shell,
}

package { 'nginx':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
}

exec { 'add_header':
  environment => ["HOST=${hostname}"],
  command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
  provider    => shell,
  before      => Exec['nginx restart'],
}

exec { 'nginx restart':
  command  => 'sudo service nginx restart',
  provider => shell,
}
