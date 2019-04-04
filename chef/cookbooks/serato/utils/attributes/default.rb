# Name and group of user that web requests run as
default['serato']['utils']['web_app_user'] = "www-run"
default['serato']['utils']['web_app_group'] = "www-run"

# Settings for Remi respository
if node['platform'] == 'centos'
  default['serato']['utils']['remi']['url'] = "http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/"
  default['serato']['utils']['remi']['mirrorlist'] = "http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror"
else
  default['serato']['utils']['remi']['url'] = "http://rpms.famillecollet.com/enterprise/7/remi/$basearch/"
  default['serato']['utils']['remi']['mirrorlist'] = "http://rpms.famillecollet.com/enterprise/7/remi/mirror"
end
