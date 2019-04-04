# Create new user group
group node['serato']['utils']['web_app_group'] do
    action [ :create, :manage ]
end
  
# Create new user
user node['serato']['utils']['web_app_user'] do
    action [ :create, :manage ]
    gid node['serato']['utils']['web_app_group']
    system true
    shell '/bin/bash'
    home "/home/#{node['serato']['utils']['web_app_user']}"
end
