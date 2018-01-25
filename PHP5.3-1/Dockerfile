FROM kaioidealinvest/apache:ubuntu14:04

MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update && apt-get install -y vim curl git wget build-essential python-software-properties \
software-properties-common language-pack-en-base \
&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update \
&& apt-get install -y php5.5 php5.5-cli libapache2-mod-php5.5 php5.5-gd php5.5-ldap php5.5-mysql \
php5.5-pgsql php5.5-pdo php5.5-mysqlnd php5.5-mbstring php5.5-mcrypt php5.5-xml php5.5-zip php5.5-curl php5.5-xdebug

COPY Files/20-xdebug-cli.ini /etc/php/5.3/cli/conf.d/20-xdebug.ini
COPY Files/20-xdebug.ini /etc/php/5.3/apache2/conf.d/20-xdebug.ini
COPY Files/php.ini /etc/php/5.3/apache2/php.ini