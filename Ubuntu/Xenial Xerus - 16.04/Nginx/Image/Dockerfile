FROM kaiocarvalhopravaler/ubuntu:16.04

MAINTAINER Kaio Gonçalves Carvalho

RUN apt-get update \
&& apt-get install -y  nginx

ADD Files/nginx.conf /etc/nginx/nginx.conf

CMD ["/bin/sh"]

