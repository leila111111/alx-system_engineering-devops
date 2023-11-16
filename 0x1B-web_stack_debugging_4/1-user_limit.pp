# Change the OS configuration so that it is possible to login with the holberton
# user and open a file without any error message.

exec {' soft/hard file':
  command => "sed -i 's/nofile \+\d\+/nofile 6000/g' /etc/security/limits.conf",
  path    => ['/bin', '/usr/bin'],
}
