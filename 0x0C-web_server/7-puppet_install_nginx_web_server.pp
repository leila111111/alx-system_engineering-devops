# Install Nginx web server (w/ Puppet)

include stdlib

exec {'installation':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo 'Hello World!' > /var/www/html/index.nginx-debian.html ; sudo service nginx start',
}

file_line { '301':
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => '    location /redirect_me {return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;}',
}
