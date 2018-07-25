#!/usr/bin/env bash

if  [ -f /etc/nginx/sites-available/site.conf ];
then
    sed -E -i "s#(<ROOT>)#$ROOT#g" /etc/nginx/sites-available/site.conf
    sed -E -i "s#(<URL>)#$URL#g" /etc/nginx/sites-available/site.conf
    ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
fi

service php7.2-fpm start

nginx

#Retorna um terminal
/bin/bash