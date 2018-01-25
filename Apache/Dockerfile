FROM ubuntu:16.04

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

RUN apt-get update \
&& apt-get install -y apache2

RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http

COPY Files/config_apache /etc/apache2/sites-available/default
COPY Files/site.conf /etc/apache2/sites-available/site.conf

RUN a2ensite site.conf


ENTRYPOINT ["/usr/sbin/apache2", "-D", "FOREGROUND"]