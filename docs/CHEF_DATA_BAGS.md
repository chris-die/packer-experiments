# Chef Solo and Data Bags

Creating and editing Data Bags with Chef Solo is complicated by the fact that `knife`, the primary tool for working with Data Bags, is intended to be used with Chef Server and not Chef Solo.

But there are 3rd party tools that making using Data Bags with Chef Solo simpler and easier. Before adding and using 3rd party tools you must first configure `knife`.

Note: The steps described here to create and edit Data Bags are only required in a development environment, and only when changes or additions need to be made to data contained in Data Bags. These tools are not required in a runtime system running Packer builds, or in a development environment that need only work with existing data contained in Data Bags.

## Configuring Knife

`knife` is installed as a part of the ChefDK. Before you use `knife` you must configure it:

```bash
knife configure
```

Click through the options and accept the defaults. They're unimportant because we're not using `knife` to interact with a Chef Server.

The configure process will created a file called `credentials` in the `~/.chef` directory.

Additionally, `knife` expects a PEM file to exist in the `~/.chef` directory, named with username value provided during the configure step (this instruction is printed to the console after running configure).

Ordinarily this would be a private key for SSH access to a Chef Server. We don't need this obviously, but we still need a PEM file as specified or else `knife` won't run. Use ssh-keygen to generate a new PEM file specifically for this purpose, name it correctly, and copy it to the directory.

## Knife Solo Data Bag

Once `knife` is configured you can install [Knife Solo Data Bag](http://thbishop.com/knife-solo_data_bag/).

[Knife Solo Data Bag](http://thbishop.com/knife-solo_data_bag/) is a 3rd party Ruby Gem that extends the functionality of `knife` by adding Data Bag functionality specifically for use with Chef Solo.

### Install Knife Solo Data Bag

```bash
chef gem install knife-solo_data_bag
```

You can confirm the installation by running:

```bash
knife solo data bag
```

This should display a small subset of `knife` sub-commands, like this:

```bash
** SOLO DATA BAG COMMANDS **
knife solo data bag create BAG [ITEM] (options)
knife solo data bag edit BAG ITEM (options)
knife solo data bag list (options)
knife solo data bag show BAG [ITEM] (options)
```

If instead you see a complete list of all `knife` commands and the `solo` sub-commands are not shown the installation failed.

### Set you EDITOR environment variable

Editing Data Bags with `knife` requires correctly setting the `EDITOR` environment variable. `knife` pipes Data Bag content into the specified editor and, if required, encrypts or decrypts it automatically.

```bash
export EDITOR=<vim|nano>
```

## Creating and editing Data Bags using Knife Solo Data Bag

The [documentation page](http://thbishop.com/knife-solo_data_bag/) for Knife Solo Data Bag describes the commands clearly enough.

Just bear in mind that, by default, `knife` will use the directory `~/.chef/data_bags`. Use the `--data-bag-path` option to instruct `knife` to use the `chef/data_bags` direcrory contained within this repo.

## Using Data Bags in Chef recipes

Using Data Bags created with Knife Solo Data Bag in your Chef recipes follows the same steps as per any other Data Bags. See the [Chef documentation on Data Bags](https://docs.chef.io/data_bags.html) for more information.
