#!/usr/bin/env bash

if ! [ -h /etc/nginx/sites-enabled/site.conf ];
then
    sed -E -i "s#(<ROOT>)#$ROOT#g" /etc/nginx/sites-available/site.conf
    sed -E -i "s#(<URL>)#$URL#g" /etc/nginx/sites-available/site.conf
    sed -E -i "s#(<INDEX>)#$INDEX#g" /etc/nginx/sites-available/site.conf
    sed -E -i "s#(<CONTAINER>)#$CONTAINER#g" /etc/nginx/sites-available/site.conf
    sed -E -i "s#(xdebug.idekey=)(.*)#\1$CONTAINER#g" /etc/php/7.2/mods-available/xdebug.ini
    ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf

fi

if [ -z $REMOTE_HOST ]; then
    CONNECT_BACK='1'
else
    CONNECT_BACK='0'
fi

sed -E -i "s#(xdebug.remote_connect_back=)(.*)#\1$CONNECT_BACK#g" /etc/php/7.2/mods-available/xdebug.ini
sed -E -i "s#(xdebug.remote_host=)(.*)#\1$REMOTE_HOST#g" /etc/php/7.2/mods-available/xdebug.ini


service php7.2-fpm start

nginx

#Retorna um terminal
/bin/bash