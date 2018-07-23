FROM kaiocarvalhopravaler/apache:ubuntu16.04

MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update && apt-get install -y \
build-essential python-software-properties software-properties-common language-pack-en-base \
&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update \
&& apt-get install -y php7.2 php7.2-cli libapache2-mod-php7.2 php7.2-bcmath php7.2-gd php7.2-ldap php7.2-mysql \
php7.2-pgsql php7.2-pdo php7.2-mysqlnd php7.2-mbstring php7.2-xml php7.2-zip php7.2-curl php7.2-xdebug php7.2-mongodb \
php7.2-apcu php7.2-json php7.2-redis php7.2-opcache

RUN a2dismod mpm_prefork
RUN a2dismod mpm_worker
RUN a2dismod mpm_event
RUN a2dismod php7.0
RUN a2enmod php7.2

RUN phpenmod apcu

COPY Files/20-xdebug-cli.ini /etc/php/7.2/cli/conf.d/20-xdebug.ini
COPY Files/20-xdebug.ini /etc/php/7.2/apache2/conf.d/20-xdebug.ini
COPY Files/php.ini /etc/php/7.2/apache2/php.ini