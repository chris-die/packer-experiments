# Use the Remi repo for dev environments

if node['platform'] == 'centos'
  # Add remi repo
  include_recipe 'utils::add_remi_repo'
  
  # Specify PHP 7.0 package names from Remi repo
  node.default['php']['packages'].push( 'php72', 'php72-php-devel', 'php72-php-cli', 'php72-php-mbstring', 'php72-php-pear', 'php72-php-bcmath', 'php72-php-opcache', 'php72-php-intl', 'php72-php-pecl-zip', 'php72-php-pecl-xdebug' )
  
  # Packages from Remi install binaries with wacko names.
  # So create symlinks to normal expected name
  link "/usr/bin/php" do
    link_type :symbolic
    action :create
    to "/usr/bin/php72"
  end
  link "/usr/bin/pear" do
    link_type :symbolic
    action :create
    to "/usr/bin/php72-pear"
  end
  # Also, Remi packages use a different location for .ini files
  node.default['php']['ext_conf_dir'] = '/etc/opt/remi/php72/php.d'

else
  # Package names from amzn-main repo
  # Note: no equivalent of php72-php-pecl-xdebug available from amzn-main, which is fine because we only want it on dev systems
  node.default['php']['packages'].push( 'php72', 'php72-devel', 'php72-cli', 'php72-mbstring', 'php7-pear', 'php72-bcmath', 'php72-opcache', 'php72-intl', 'php72-zip', 'php72-pecl-igbinary' )
  node.default['php']['pear'] = 'pear7'
  node.default['php']['pecl'] = 'pecl7'
end
