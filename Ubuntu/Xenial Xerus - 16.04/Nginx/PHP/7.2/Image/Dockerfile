FROM kaiocarvalhopravaler/nginx:ubuntu16.04

MAINTAINER Kaio Gonçalves Carvalho

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
build-essential python-software-properties software-properties-common language-pack-en-base \
&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update \
&& apt-get install -y  vim curl wget git nano iputils-ping

RUN apt-get update \
&& apt-get install -y php7.2 php7.2-cli \
php7.2-bcmath php7.2-gd php7.2-ldap php7.2-mysql php7.2-fpm \
php7.2-pgsql php7.2-pdo php7.2-mysqlnd php7.2-mbstring \
php7.2-xml php7.2-zip php7.2-curl php7.2-xdebug php7.2-mongodb

ADD Files/site.conf /etc/nginx/sites-available/site.conf
ADD Files/script.sh /usr/local/script.sh

COPY Files/xdebug.ini /etc/php/7.2/mods-available/xdebug.ini
COPY Files/php.ini /etc/php/7.2/fpm/php.ini


RUN chmod +x /usr/local/script.sh

CMD ["/bin/sh", "/usr/local/script.sh"]

