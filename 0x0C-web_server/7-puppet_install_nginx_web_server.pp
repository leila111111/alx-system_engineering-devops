# Install Nginx web server (w/ Puppet)

include stdlib

exec { 'installation':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx',
}

file_line { 'Html':
ensure => present,
line   => 'Hello World!',
path   => '/var/www/html/index.nginx-debian.html',
}

exec { 'redirection':
provider => shell,
command  => 'sudo sed -i '/listen 80 default_server/a rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4/ permanent;' /etc/nginx/sites-available/default',
}

exec { 'start server':
provider => shell,
command  => 'sudo service nginx start',
}