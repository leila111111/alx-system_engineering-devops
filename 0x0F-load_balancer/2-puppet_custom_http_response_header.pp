# automate the task of creating a custom HTTP header response, but with Puppet.
exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
  before   => Exec['nginx intallation'],
}

exec {'nginx intallation':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
  before   => Exec['add_header'],
}

exec { 'add_header':
  provider    => shell,
  environment => ["HOST=${hostname}"],
  command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
  before      => Exec['nginx restart'],
}

exec { 'nginx restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
