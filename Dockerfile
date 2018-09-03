FROM php:7.2-fpm

MAINTAINER Nicolas Thal <nico.th4l@gmail.com>
MAINTAINER Jérémy GIGNON <jeremy@gignon.fr>

#COPY config/php.ini /usr/local/etc/php/

RUN pecl install redis \
    && docker-php-ext-enable redis

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libpq-dev \
        libxml2-dev \
        zlib1g-dev libicu-dev g++ \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring pgsql \
    && docker-php-ext-install xml soap zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN docker-php-ext-install opcache

ADD config/symfony.ini /etc/php/7.2/fpm/conf.d/

ADD config/adback.co.pool.conf /usr/local/etc/php-fpm.d/

RUN apt-get update \
    && apt-get install -y wget gnupg2 \
    && wget -O - https://packagecloud.io/gpg.key | apt-key add - \
    && echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list \
    && apt-get update \
    && apt-get install blackfire-agent \
    && apt-get install blackfire-php

EXPOSE 9001
