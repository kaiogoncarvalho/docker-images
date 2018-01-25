FROM ubuntu:14.04
MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update && apt-get install -y vim apache2 curl git wget build-essential python-software-properties \
software-properties-common language-pack-en-base \
&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:eugenesan/ppa

COPY Files/config_apache /etc/apache2/sites-available/default

RUN apt-get update && apt-get install -y  php5 php5-cli php5-mcrypt \
libapache2-mod-php5 php5-gd php5-ldap php5-mysql php5-pgsql php5-xdebug php5-curl


COPY Files/php.ini /etc/php5/apache2/
COPY Files/php.ini /etc/php5/cli/

RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http


ENV DEBIAN_FRONTEND=noninteractive
ENV SITE_HOST localhost
ENV SITE_DOCUMENT_ROOT /var/www
ENV VOLUME = '/var/www'
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2/
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid


COPY Files/site.conf /etc/apache2/sites-available/site.conf

RUN a2ensite site.conf

ENTRYPOINT ["/usr/sbin/apache2", "-D", "FOREGROUND"]