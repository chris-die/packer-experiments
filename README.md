# Packer Experiments

## Requirements

- Packer
- Vagrant >= 2.0.2
- Virtualbox (needs version requirements)
- Chef and Berkshelf (needs version requirements, gem file, install from gem file)

## Notes

- Download Vagrant box and capture name, version etc
- Vendor berkshelf dependencies
    berks vendor ./chef/cookbooks/vendor --berksfile ./chef/cookbooks/serato/vm_php_web_app_server/Berksfile --delete
- Need to re-vendor when editing local non-vm cookbooks (= bummer)

## Problems

- Can't install 'php71-php-mcrypt' for some reason
    - Why does it work in other Cookbook???
    - Or: refactor Serato Websites so that we don't need it

## Links

https://www.packer.io/docs/index.html
https://www.vagrantup.com/docs/index.html


Notes on Vagrant/Chef/Berkshelf setup
http://confluence.akld.serato.net:8090/display/DEV/Creating+a+Web+Team+Vagrant-based+development+environment+for+Mac+OS+X

https://ketzacoatl.github.io/posts/2017-06-01-use-existing-vagrant-box-in-a-packer-build.html
https://blog.codeship.com/packer-vagrant-tutorial/
