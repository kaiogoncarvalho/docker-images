FROM kaioidealinvest/apache:ubuntu16.04

MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update && apt-get install -y vim curl git wget build-essential python-software-properties \
software-properties-common language-pack-en-base \
&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php5-oldstable

RUN apt-get update \
&& apt-get install -y php5 php5-cli libapache2-mod-php5 php5-gd php5-ldap php5-mysql \
php5-pgsql php5-pdo php5-mysqlnd php5-mbstring php5-mcrypt php5-xml php5-zip php5-curl php5-xdebug

COPY Files/20-xdebug-cli.ini /etc/php/5.4/cli/conf.d/20-xdebug.ini
COPY Files/20-xdebug.ini /etc/php/5.4/apache2/conf.d/20-xdebug.ini
COPY Files/php.ini /etc/php/5.4/apache2/php.ini