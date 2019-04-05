case node['serato']['php']['major_version']
when '7.2'
    # Amazon Linux
    package_name = 'php72-fpm'
    service_name = 'php-fpm-7.2'
    # Centos
    if node['platform'] == 'centos'
        package_name = "php72-php-fpm"
        service_name = 'php72-php-fpm'
    end
else # 7.1
    # Amazon Linux
    package_name = 'php71-fpm'
    service_name = 'php-fpm-7.1'
    # Centos
    if node['platform'] == 'centos'
        package_name = "php71-php-fpm"
        service_name = 'php71-php-fpm'
    end
end

package package_name do
	action :upgrade
end

service "php-fpm" do
	service_name service_name
	supports :start => true, :stop => true, :restart => true, :reload => true
	action [ :enable ]
end

# # disable php-fpm www pool
# php_fpm_pool "www" do
#     enable false
# end