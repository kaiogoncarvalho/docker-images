#!/bin/bash
function updateXdebug()
{
    VALIDATE_VERSION=$(ls /etc/apache2/mods-enabled/ | grep php$1.conf)
    if [ ! -z $VALIDATE_VERSION ]; then
        if [ -z $REMOTE_HOST ]; then
            CONNECT_BACK='1'
        else
            CONNECT_BACK='0'
        fi

        sed -E -i "s#(xdebug.idekey=)(.*)#\1$CONTAINER#g" /etc/php/$1/mods-available/xdebug.ini
        sed -E -i "s#(xdebug.remote_connect_back=)(.*)#\1$CONNECT_BACK#g" /etc/php/$1/mods-available/xdebug.ini
        sed -E -i "s#(xdebug.remote_host=)(.*)#\1$REMOTE_HOST#g" /etc/php/$1/mods-available/xdebug.ini
    fi
}

if [ ! -d "$APACHE_RUN_DIR" ]; then
	mkdir "$APACHE_RUN_DIR"
	chown $APACHE_RUN_USER:$APACHE_RUN_GROUP "$APACHE_RUN_DIR"
fi
if [ -f "$APACHE_PID_FILE" ]; then
	rm "$APACHE_PID_FILE"
fi

array=( "5.6" "7.0" "7.1" "7.2")
for i in "${array[@]}"
do
    updateXdebug $i
done

/usr/sbin/apache2 -D FOREGROUND