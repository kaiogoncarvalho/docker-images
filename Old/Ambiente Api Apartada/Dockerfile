FROM ubuntu:trusty-20170119

RUN apt-get update && apt-get install -y python-software-properties software-properties-common

RUN add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -y --force-yes apache2 php5.6 php5.6-cli libapache2-mod-php5.6 php5.6-gd php5.6-ldap php5.6-mysql php5.6-pgsql wget php5.6-pdo php5.6-mysqlnd php5.6-mbstring php5.6-mcrypt php5.6-xml php5.6-zip php5.6-curl vim git php-xdebug


COPY config_apache /etc/apache2/sites-available/default
COPY api.backoffice.dev.conf /etc/apache2/sites-available/
COPY 20-xdebug-cli.ini /etc/php/5.6/cli/conf.d/20-xdebug.ini
COPY 20-xdebug.ini /etc/php/5.6/apache2/conf.d/20-xdebug.ini
COPY php.ini /etc/php/5.6/apache2/php.ini

RUN mkdir /var/www/log
RUN chown www-data:www-data /var/www/log

RUN a2ensite api.backoffice.dev.conf
RUN a2enmod rewrite
RUN a2enmod autoindex

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/www/log
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid


LABEL description="WS"

VOLUME /var/www/

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]


