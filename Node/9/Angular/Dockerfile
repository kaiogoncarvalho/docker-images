FROM kaiocarvalhopravaler/node:9

MAINTAINER Kaio Gonçalves Carvalho

ENV VOLUME='/var/www'
ENV DOCUMENT_ROOT='/'

ADD Files/script.sh /usr/local/script.sh

RUN chmod +x /usr/local/script.sh

ENTRYPOINT ["/bin/sh", "/usr/local/script.sh"]