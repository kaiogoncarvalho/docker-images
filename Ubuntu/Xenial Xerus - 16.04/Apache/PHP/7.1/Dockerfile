FROM kaiocarvalhopravaler/apache:ubuntu16.04

MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update && apt-get install -y \
build-essential python-software-properties software-properties-common language-pack-en-base \
&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update \
&& apt-get install -y php7.1 php7.1-cli libapache2-mod-php7.1 php7.1-bcmath php7.1-gd php7.1-ldap php7.1-mysql \
php7.1-pgsql php7.1-pdo php7.1-mysqlnd php7.1-mbstring php7.1-mcrypt php7.1-xml php7.1-zip php7.1-curl php7.1-xdebug php7.1-mongodb \
php7.1-apcu php7.1-json php7.1-redis php7.1-opcache

RUN a2dismod mpm_prefork
RUN a2dismod mpm_worker
RUN a2dismod mpm_event
RUN a2dismod php7.0
RUN a2enmod php7.1

RUN phpenmod apcu

COPY Files/xdebug.ini /etc/php/7.1/mods-available/xdebug.ini
COPY Files/php.ini /etc/php/7.1/apache2/php.ini