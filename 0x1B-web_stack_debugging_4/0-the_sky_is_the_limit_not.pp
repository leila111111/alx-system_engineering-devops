# fix our stack so that we get to 0

exec {'replace 15 with 4096':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
}

exec {'nginx_restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
