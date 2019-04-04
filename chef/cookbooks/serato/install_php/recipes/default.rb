include_recipe 'utils::create_web_app_user'

case node['serato']['php']['major_version']
when '7.2'
  include_recipe 'install_php::install_72'
else
  include_recipe 'install_php::install_71'
end

include_recipe 'php::default'

# Create the 'session.save_path' directory
directory node['serato']['php']['session_save_path'] do
  owner node['serato']['utils']['web_app_user']
  group node['serato']['utils']['web_app_group']
  mode 00764
  recursive true
  action :create
end
