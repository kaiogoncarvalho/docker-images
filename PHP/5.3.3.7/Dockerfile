FROM debian:squeeze

MAINTAINER Kaio Gonçalves Carvalho

ENV DEBIAN_FRONTEND=noninteractive
ENV SITE_HOST localhost
ENV SITE_DOCUMENT_ROOT /var/www
ENV VOLUME = '/var/www'
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2/
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN echo "deb http://archive.debian.org/debian/ squeeze contrib main non-free" > /etc/apt/sources.list
RUN echo "deb http://ftp.de.debian.org/debian sid main" >> /etc/apt/sources.list

RUN apt-get update

RUN apt-get  -yt sid install apache2

RUN apt-get install -y vim curl wget git

RUN apt-get install -y php5 php5-cli \
    libapache2-mod-php5 php5-gd php5-ldap php5-mysql php5-pgsql php5-xdebug php5-curl php5-mcrypt

COPY ./Files/xdebug.ini /etc/php5/apache2/conf.d/xdebug.ini
COPY ./Files/xdebug.ini /etc/php5/cli/conf.d/xdebug.ini
COPY ./Files/php.ini /etc/php5/apache2/
COPY ./Files/php.ini /etc/php5/cli/
COPY ./Files/config_apache /etc/apache2/sites-available/default

RUN a2enmod rewrite


ENTRYPOINT ["/usr/sbin/apache2", "-D", "FOREGROUND"]


