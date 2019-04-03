#
# Cookbook:: php_web_app_server
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

node.default['php']['version'] = '7.1.24'

include_recipe 'php::default'
