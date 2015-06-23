# Vagrantfile & Puppet manifests for a base LAMP setup

## Software requirements

You need to install the following to work with our setup:

- [VirtualBox][virtualbox]
- [Vagrant][vagrant]
- vagrant-hostmanager

[virtualbox]: https://www.virtualbox.org/wiki/Downloads
[vagrant]: http://www.vagrantup.com/downloads.html

Once the first two items are installed, then install `vagrant-hostmanager` as follows:

    vagrant plugin install vagrant-hostmanager

## Getting started

You should be able to access your setup now in a web browser: [http://www.box.dev](http://www.box.dev)

## MySQL

You need to use an SSH connection.

With the information below you can connect to the MySQL server running on the virtual machine.

## Default information

* SSH Host: 192.168.200.20 (`192.168.200.1` is your machine)
* SSH User: vagrant
* SSH Pass: vagrant
* SSH Port: 2222 (default by vagrant)
* MySQL Host: 127.0.0.1
* MySQL Port: 3306
* MySQL User: dbuser
* MySQL Pass: dbpass
* MySQL DB:   dbname

### Import database

If file exists `database.sql.gz` in the dbdump directory, puppet will import the database during the first `up`.  In addition, if you delete the main database in the VM and then run `vagrant provision` again, you will get a fresh DB installed easily.

## Virtualhost

Per default the variable `YII_DEBUG` is set to true for this Apache setup, but will be false automatically on deploy.

The virtualhost is set on the `htdocs` directory.

## Mails

[MailCatcher][mailcatcher] is installed and configured into the `/etc/php5/apache2/php.ini` file.

### How it works

If mailcatcher is stopped: all emails are lost.

If mailcatcher is started: **all emails are catched**.

If you want to start MailCatcher, simply run this command (with vagrant user) : `mailcatcher --ip 0.0.0.0`

Then go to : http://www.box.dev:1080

If you need to stop the mailcatcher daemon : Click on "Quit" on the top right corner of the MailCatcher Web UI.

## Packages

Are installed:

* apache-mpm-itk (with yii2 virtualhost)
* mysql-server (with custom my.cnf)
* mysql-client
* phpmyadmin (available at [http://www.box.dev/phpmyadmin](http://www.box.dev/phpmyadmin)
* php5 (and the following modules)
    - bcmatch
    - bz2
    - calendar
    - ctype
    - curl
    - date
    - dba
    - dom
    - ereg
    - exif
    - fileinfo
    - filter
    - ftp
    - gd
    - gettext
    - hash
    - iconv
    - intl
    - json
    - libxml
    - mbstring
    - mcrypt
    - mhash
    - mysql
    - mysqli
    - openssl
    - pcre
    - pdo
    - pdo_mysql
    - phar
    - posix
    - readline
    - reflection
    - session
    - shmop
    - simplexml
    - soap
    - sockets
    - spl
    - sysvmsg
    - tidy
    - tokenizer
    - wddx
    - xdebug
    - xml
    - xmlreader
    - xmlwriter
    - zip
    - zlib
* screen (with custom .screenrc for root)
* vim
* wget
* curl
* git
* composer.phar
* mailcatcher (gem)

[mailcatcher]: http://mailcatcher.me
