# Add the Remi repo
yum_repository "remi" do
    description "Remi"
    baseurl node['serato']['utils']['remi']['url']
    mirrorlist node['serato']['utils']['remi']['mirrorlist']
    gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
    action :create
end

yum_repository "remi" do
    action :makecache
end
