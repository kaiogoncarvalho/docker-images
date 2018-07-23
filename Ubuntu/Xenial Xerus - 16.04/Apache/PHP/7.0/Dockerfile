FROM kaiocarvalhopravaler/apache:ubuntu16.04

MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update && apt-get install -y \
build-essential python-software-properties software-properties-common language-pack-en-base \
&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update \
&& apt-get install -y php7.0 php7.0-cli libapache2-mod-php7.0 php7.0-bcmath php7.0-gd php7.0-ldap php7.0-mysql \
php7.0-pgsql php7.0-pdo php7.0-mysqlnd php7.0-mbstring php7.0-mcrypt php7.0-xml php7.0-zip php7.0-curl php7.0-xdebug php7.0-mongodb

COPY Files/20-xdebug-cli.ini /etc/php/7.0/cli/conf.d/20-xdebug.ini
COPY Files/20-xdebug.ini /etc/php/7.0/apache2/conf.d/20-xdebug.ini
COPY Files/php.ini /etc/php/7.0/apache2/php.ini