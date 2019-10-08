Dekalee Backoffice (docker)
=======================

This docker image wraps all required components for our php / symfony backoffice at AdBack, but it might be useful for you too.

Components
----------

The following librairies, components and programs are already installed:
- php7.3-fpm
- libfreetype6
- libjpeg62-turbo-dev
- libpng-dev
- zlib1g-dev
- libzip-dev
- libxml2-dev
- libpq-dev
- g++
- php-intl
- php-gd
- php-pdo_mysql
- php-pdo_pgsql
- php-pgsql
- php-mbstring
- php-xml
- php-soap
- php-zip
- nodejs
- blackfire

Usage
-----

Simply set this docker image as your base image in your Dockerfile
```dockerfile
FROM dekalee/docker-backoffice:latest
```
and add your configuration below

