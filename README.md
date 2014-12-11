# A Development and Testing environment for PHP

## Introduction

This project automates the setup of a development and testing environment for PHP, using Vagrant and Chef Solo.

## Requirements

* [VirtualBox](https://www.virtualbox.org) 
* [Vagrant](http://vagrantup.com)

## Setup

    $ git clone --recursive https://github.com/acfreitas/phpbox.git
    $ cd phpbox
    $ vagrant up

P.S. Use git clone --recursive for clone submodules yum, yum-mysql-community, apt, openssl and mysql.

## The Box contains

- Ubuntu 12.04 LTS 32-bit
- Git
- PHP 5.5
- PHPUnit
- MySQL

## More information
Check the [Vagrant documentation](http://vagrantup.com/v1/docs/index.html) and [Chef Solo documentation](https://docs.chef.io/chef_solo.html)