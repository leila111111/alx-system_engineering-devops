# using Puppet to make changes to our configuration file.
include stdlib

file_line { 'use the private key':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
}
file_line { 'refuse to authenticate using a password':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
}

