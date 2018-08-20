#!/usr/bin/env bash

if [ -z $REMOTE_HOST ]; then
    CONNECT_BACK='1'
else
    CONNECT_BACK='0'
fi

sed -E -i "s#(xdebug.idekey=)(.*)#\1$CONTAINER#g" /etc/php5/conf.d/xdebug.ini
sed -E -i "s#(xdebug.remote_connect_back=)(.*)#\1$CONNECT_BACK#g" /etc/php5/conf.d/xdebug.ini
sed -E -i "s#(xdebug.remote_host=)(.*)#\1$REMOTE_HOST#g" /etc/php5/conf.d/xdebug.ini

/usr/sbin/apache2 -D FOREGROUND