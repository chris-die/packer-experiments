# Use the Remi repo for dev environments

if node['platform'] == 'centos'
  # Add remi repo
  include_recipe 'utils::add_remi_repo'
  
  # Specify PHP 7.1 package names from Remi repo
  # 'php71-php-mcrypt'
  node.default['php']['packages'].push( 'php71', 'php71-php-devel', 'php71-php-cli', 'php71-php-pear', 'php71-php-bcmath', 'php71-php-opcache', 'php71-php-intl', 'php71-php-pecl-zip', 'php71-php-mbstring', 'php71-php-pecl-xdebug' )
  
  # Packages from Remi install binaries with wacko names.
  # So create symlinks to normal expected name
  link "/usr/bin/php" do
    link_type :symbolic
    action :create
    to "/usr/bin/php71"
  end
  link "/usr/bin/pear" do
    link_type :symbolic
    action :create
    to "/usr/bin/php71-pear"
  end
  # Also, Remi packages use a different location for .ini files
  node.default['php']['ext_conf_dir'] = '/etc/opt/remi/php71/php.d'
else
  # Package names from amzn-main repo
  # Note: no equivalent of php71-php-pecl-xdebug available from amzn-main, which is fine because we only want it on dev systems
  node.default['php']['packages'].push( 'php71', 'php71-devel', 'php71-cli', 'php7-pear', 'php71-bcmath', 'php71-mcrypt', 'php71-opcache', 'php71-intl', 'php71-pecl-igbinary', 'php71-mbstring' )
  node.default['php']['pear'] = 'pear7'
  node.default['php']['pecl'] = 'pecl7'
end
