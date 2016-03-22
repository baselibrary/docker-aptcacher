FROM baselibrary/baseimage:1.0.0
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Version
ENV APTCACHE_MAJOR   1.7
ENV APTCACHE_VERSION 1.7.8

## Packages
RUN \
  apt-get update &&\
  apt-get install -y apt-cacher=$APTCACHE_VERSION apache2 &&\
  rm -rf /var/lib/apt/lists/*

## Configurations

EXPOSE 3142

VOLUME ["/var/cache/apt-cacher"]

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]