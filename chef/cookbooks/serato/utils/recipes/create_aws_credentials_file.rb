# Note: for dev environment use only
# Test and production systems should always use IAM roles for permissions

node.default['iam_creds'] = data_bag_item('iam', 'io_serato_dev')

if node['platform'] == 'centos'
	['vagrant', node['serato']['utils']['web_app_user']].each do |user|
		directory "/home/#{user}/.aws" do
			owner node['serato']['utils']['web_app_user']
			group node['serato']['utils']['web_app_group']
			mode 00755
			recursive true
			action :create
		end

		template "/home/#{user}/.aws/credentials" do
			source "aws_iam_creds.erb"
			mode 00644
			owner node['serato']['utils']['web_app_user']
			group node['serato']['utils']['web_app_group']
		end
	end
end