# Packer Experiments

## Requirements

- Packer
- Vagrant >= 2.0.2
- Virtualbox (needs version requirements)
- Chef and Berkshelf (needs version requirements, gem file, install from gem file)

## Notes

- Download Vagrant box and capture name, version etc
- Vendor berkshelf dependencies
    berks vendor ./chef/cookbooks --berksfile ./chef/cookbooks/vm_php_web_app_server/Berksfile


## Links

https://www.packer.io/docs/index.html
https://www.vagrantup.com/docs/index.html


Notes on Vagrant/Chef/Berkshelf setup
http://confluence.akld.serato.net:8090/display/DEV/Creating+a+Web+Team+Vagrant-based+development+environment+for+Mac+OS+X

https://ketzacoatl.github.io/posts/2017-06-01-use-existing-vagrant-box-in-a-packer-build.html
https://blog.codeship.com/packer-vagrant-tutorial/
