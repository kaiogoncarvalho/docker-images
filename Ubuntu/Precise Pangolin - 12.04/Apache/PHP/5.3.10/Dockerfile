FROM kaiocarvalhopravaler/apache:ubuntu12.04

MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update && apt-get install -y php5 php5-cli php5-gd php5-ldap php5-mysql php5-pgsql php5-xdebug php5-curl

COPY ./Files/php.ini /etc/php5/apache2/
COPY ./Files/php.ini /etc/php5/cli/

ENTRYPOINT ["/usr/sbin/apache2", "-D", "FOREGROUND"]