include_recipe 'install_php::default'
include_recipe 'install_php::install_phpfpm'
include_recipe 'utils::create_aws_credentials_file'
