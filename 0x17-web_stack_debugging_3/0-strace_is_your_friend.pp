#fix out a 500 error returned by apache
exec { 'correcting error':
  command  => 'sudo sed -i "s/.phpp/.php/g" /var/www/html/wp-settings.php',
  provider => shell,
}
