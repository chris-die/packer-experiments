# Default PHP version
default['serato']['php']['major_version'] = '7.1'

# Path for file-based session storage
default['serato']['php']['session_save_path'] = "/var/lib/php/session"

# List of packages (installed by `php` Cookbook)
default['php']['packages'] = []

# PHP-FPM configuration
if node['platform'] == 'centos'
    default['serato']['php']['php_fpm_71_service_name'] = 'php71-php-fpm'
    default['serato']['php']['php_fpm_72_service_name'] = 'php72-php-fpm'
else
    default['serato']['php']['php_fpm_71_service_name'] = 'php-fpm-7.1'
    default['serato']['php']['php_fpm_72_service_name'] = 'php-fpm-7.2'
end

# # Defaults for the parameterized parts of the php.ini file
# default['serato']['php']['ini']['html-errors'] = "Off"
# default['serato']['php']['ini']['display-errors'] = "Off"
# default['serato']['php']['ini']['opcache']['validate-timestamps'] = "0"
# default['serato']['php']['ini']['opcache']['save-comments'] = "0"
# default['serato']['php']['ini']['opcache']['load-comments'] = "0"
# default['serato']['php']['ini']['serato']['application-environment'] = false
# default['php']['packages'] = []

# if node['platform'] == 'centos'
#   default['serato']['php']['remi-repo']['yum_url'] = "http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/"
#   default['serato']['php']['remi-repo']['yum_mirrorlist'] = "http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror"
# else
#   default['serato']['php']['remi-repo']['yum_url'] = "http://rpms.famillecollet.com/enterprise/7/remi/$basearch/"
#   default['serato']['php']['remi-repo']['yum_mirrorlist'] = "http://rpms.famillecollet.com/enterprise/7/remi/mirror"
# end

# # -----------------------------------------------------------------------------------
# # Name of AWS-provided PHP Elasticache client package
# # -----------------------------------------------------------------------------------

# default['serato']['php']['elasticache-client']['install-file-name'] = 'AmazonElastiCacheClusterClient-1.0.0-PHP56-64bit.tgz'
# default['serato']['php']['elasticache-client']['extension-file-name'] = 'amazon-elasticache-cluster-client.so'

# # -----------------------------------------------------------------------------------
# # Default settings for php-fpm install
# # -----------------------------------------------------------------------------------

# default['serato']['php-fpm']['pool_conf_dir'] = "/etc/php-fpm.d"
# default['serato']['php-fpm']['conf_file'] = "/etc/php-fpm.conf"

# # PHP 7.x installed from Remi repo uses different conf file locations
# #default['serato']['php70-fpm-remi']['pool_conf_dir'] = "/etc/opt/remi/php70/php-fpm.d"
# default['serato']['php70-fpm-remi']['conf_file'] = "/etc/opt/remi/php70/php-fpm.conf"
# default['serato']['php71-fpm-remi']['conf_file'] = "/etc/opt/remi/php71/php-fpm.conf"
# default['serato']['php72-fpm-remi']['conf_file'] = "/etc/opt/remi/php72/php-fpm.conf"

# default['serato']['php-fpm']['error_log'] =  "/dev/null" #/var/log/php-fpm/error.log"
# default['serato']['php-fpm']['log_level'] = "notice"
# default['serato']['php-fpm']['emergency_restart_threshold'] = 0
# default['serato']['php-fpm']['emergency_restart_interval'] = 0
# default['serato']['php-fpm']['process_control_timeout'] = 0

# if node['platform'] == 'centos'
#   default['serato']['php-fpm']['service_name'] = 'php-fpm'
#   default['serato']['php-fpm-7']['service_name'] = 'php70-php-fpm'
#   default['serato']['php-fpm-71']['service_name'] = 'php71-php-fpm'
#   default['serato']['php-fpm-72']['service_name'] = 'php72-php-fpm'
#   default['serato']['php-fpm']['pid'] = ''
# else
#   default['serato']['php-fpm']['service_name'] = 'php-fpm-5.6'
#   default['serato']['php-fpm-7']['service_name'] = 'php-fpm-7.0'
#   default['serato']['php-fpm-71']['service_name'] = 'php-fpm-7.1'
#   default['serato']['php-fpm-72']['service_name'] = 'php-fpm-7.2'
#   default['serato']['php-fpm']['pid'] = ''
# end

# # -----------------------------------------------------------------------------------
# # Default settings for nginx install
# # -----------------------------------------------------------------------------------

# default['serato']['nginx']['www-root'] = "/srv/www"
# default['serato']['nginx']['static-files-expires-ttl'] = "30d"

# if node['platform'] == 'centos'
#   default['nginx']['package_name'] = "nginx16"
# end

# default['serato']['nginx']['cors-template-path'] = "#{node['nginx']['dir']}/cors.conf"

# # -----------------------------------------------------------------------------------
# # Default settings for healthcheck virtual host
# # -----------------------------------------------------------------------------------
# default['serato']['nginx']['healthcheck-virtualhost']['server-name'] = ''
# default['serato']['nginx']['healthcheck-virtualhost']['port'] = 81
# default['serato']['nginx']['healthcheck-virtualhost']['root-path'] = ''


# # -----------------------------------------------------------------------------------
# # Settings for sysinfo.json
# # -----------------------------------------------------------------------------------

# default['serato']['sysinfo']['path'] = false
# default['serato']['sysinfo']['file-name'] = "sysinfo.json"

# # -----------------------------------------------------------------------------------
# # Default settings for web apps
# # -----------------------------------------------------------------------------------

# # UNIX user (and group) to run web apps as.
# # (ie. this is the user that nginx and the php-fpm pool run as)
# default['serato']['web-app']['user'] = "www-run"
# default['serato']['web-app']['group'] = "www-run"
# # Path that exists outside of any specific applications and is readable and writeable by www-run
# # FYI, OpsWorks creates this directory for us automatically
# default['serato']['web-app']['shared-path'] = "/srv/www/shared"
# # Prefix of name of file that contains most recent git commit for a web app
# default['serato']['web-app']['git-commit-file-name-prefix'] = "git_commit_"

# # -----------------------------------------------------------------------------------
# # Default settings for CLI apps
# # -----------------------------------------------------------------------------------

# default['serato']['cli-app']['app-root'] = "/opt/serato"
# default['serato']['cli-app']['data-root'] = '/var/serato/cli'
# default['serato']['cli-app']['user'] = "cli-run"
# default['serato']['cli-app']['group'] = "cli-run"
  
# # -----------------------------------------------------------------------------------
# # Default settings for MySQL server
# # -----------------------------------------------------------------------------------

# default['serato']['mysql']['prefix-dir'] = '/usr'
# default['serato']['mysql']['server']['host'] = 'localhost'
# # Commented values should always be passed in at Chef runtime
# # default['serato']['mysql']['server']['root-user']
# # default['serato']['mysql']['server']['root-password']
# # default['serato']['mysql']['server']['app-user-name']
# # default['serato']['mysql']['server']['app-user-password']
# # default['serato']['mysql']['database']['name']
# default['serato']['mysql']['server']['read-host'] = '';
# default['serato']['mysql']['server']['port'] = 3306;
# default['serato']['mysql']['server']['app-user-grants'] = 'SELECT, UPDATE, INSERT, DELETE, EXECUTE, CREATE TEMPORARY TABLES'

# # Path to gzipped dump file
# default['serato']['mysql']['import-dumpfile']['file-path'] = ''
# # SQL statements to run after all data has been imported
# default['serato']['mysql']['post-import-sql'] = []

# # -----------------------------------------------------------------------------------
# # Default settings for Redis cluster
# # -----------------------------------------------------------------------------------

# # Commented values should always be passed in at Chef runtime
# # default['serato']['redis']['master-node']['host']
# default['serato']['redis']['port'] = 6379;

# # -----------------------------------------------------------------------------------
# # Default settings for Composer
# # -----------------------------------------------------------------------------------

# default['serato']['composer']['cwd'] = ''
# default['serato']['composer']['no-dev'] = true
  
# # -----------------------------------------------------------------------------------
# # Default settings for PHPMyAdmin install
# # -----------------------------------------------------------------------------------

# default['serato']['phpmyadmin']['version'] = '4.8.3'
# default['serato']['phpmyadmin']['checksum'] = 'fdf1cd8dfa66378c3aed9b4922812716fb22d242aeab8f8c0e7174b75d888374'
# default['serato']['phpmyadmin']['mirror'] = 'https://files.phpmyadmin.net/phpMyAdmin'

# default['serato']['phpmyadmin']['default-host'] = ''
# default['serato']['phpmyadmin']['hosts'] = []
# default['serato']['phpmyadmin']['listen-port'] = 80
# default['serato']['phpmyadmin']['servers'] = []

# default['serato']['phpmyadmin']['user'] = node['serato']['web-app']['user']
# default['serato']['phpmyadmin']['group'] = node['serato']['web-app']['group']

# default['serato']['phpmyadmin']['home-dir'] = 'phpmyadmin'

# default['serato']['phpmyadmin']['upload-dir'] = '/var/lib/php/uploads'
# default['serato']['phpmyadmin']['save-dir'] = '/var/lib/php/uploads'

# default['serato']['phpmyadmin']['blowfish_secret'] = '7654588cf9f0f92f01a6aa361d02c0cf038'
# default['serato']['phpmyadmin']['maxrows'] = 100
# default['serato']['phpmyadmin']['protect_binary'] = 'blob'
# default['serato']['phpmyadmin']['default_lang'] = 'en'
# default['serato']['phpmyadmin']['default_display'] = 'horizontal'
# default['serato']['phpmyadmin']['query_history'] = true
# default['serato']['phpmyadmin']['query_history_size'] = 100

# # -----------------------------------------------------------------------------------
# # AWS config details (for dev environment only)
# # -----------------------------------------------------------------------------------
# # Access key and secret for IAM user io.serato.dev
# default['serato']['aws-dev-config']['access-key'] = ''
# default['serato']['aws-dev-config']['secret-key'] = ''
# default['serato']['aws-dev-config']['region'] = 'us-east-1'

# # -----------------------------------------------------------------------------------
# # Misc
# # -----------------------------------------------------------------------------------
# # ie. Where is the stack running? This is intended to be used primarily for displaying
# # the name of the AWS region that a stack is running in.
# default['serato']['hosting-region'] = "local-dev"

# # -----------------------------------------------------------------------------------
# # SQS queue names
# # -----------------------------------------------------------------------------------
# # Note: these are the default names that, typically, apply only to dev environments
# # Staging and Production systems will override these via custom Chef JSON.
# #
# # ** Queue names used for the Serato User Profile app
# #
# # Name of `User Profile Events` queue.
# default['serato']['sqs-queue-name']['user-profile-events'] = 'SeratoUserProfile-Events-test-Dev'
# # Name of `User Profiles Updated` queue.
# default['serato']['sqs-queue-name']['user-profiles-updated'] = 'SeratoUserProfile-ProfilesUpdated-test-Dev'
# # Name of `Mailchimp Batch Status` queue.
# default['serato']['sqs-queue-name']['mailchimp-batch-status'] = 'SeratoUserProfile-MailchimpBatchStatus-test-Dev'
# # Name of `User Profile AskNicely` queue.
# default['serato']['sqs-queue-name']['user-profile-asknicely'] = 'SeratoUserProfile-AskNicely-test-Dev'

# # -----------------------------------------------------------------------------------
# # Emails / SES
# # -----------------------------------------------------------------------------------

# default['serato']['app']['disable-email-delivery'] = false
