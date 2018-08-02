FROM php:7.0-cli

ADD Files /usr/src/myapp

WORKDIR /usr/src/myapp

RUN chmod +x /usr/src/myapp/script.sh

CMD ["/bin/sh", "/usr/src/myapp/script.sh"]