FROM kaiocarvalhopravaler/apache:ubuntu16.04

MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update && apt-get install -y build-essential \
python-software-properties software-properties-common language-pack-en-base \
&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update \
&& apt-get install -y php5.6 php5.6-cli libapache2-mod-php5.6 php5.6-gd php5.6-ldap php5.6-mysql \
php5.6-pgsql php5.6-pdo php5.6-mysqlnd php5.6-mbstring php5.6-mcrypt php5.6-xml php5.6-zip php5.6-curl php5.6-xdebug

RUN a2dismod mpm_prefork
RUN a2dismod mpm_worker
RUN a2dismod mpm_event
RUN a2dismod php7.0
RUN a2enmod php5.6


COPY Files/xdebug.ini /etc/php/5.6/mods-available/xdebug.ini
COPY Files/php.ini /etc/php/5.6/apache2/php.ini