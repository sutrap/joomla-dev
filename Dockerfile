FROM joomla:3.9.24-php7.4-apache

LABEL version="1.1.0"
LABEL description="PHP Xdebug"

ENV XDEBUG_PORT 9000

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=develop,coverage,debug,profile \
    && echo "xdebug.idkey=docker" \
    && echo "xdebug.start_with_request=yes" \
    && echo "xdebug.log=/dev/stdout" \
    && echo "xdebug.log_level=0" \
    && echo "xdebug.client_port=9003" \
    && echo "xdebug.client_host=192.168.178.160" \
    && rm -rf /usr/local/etc/php/conf.d/opcache-recommended.ini

EXPOSE 9000
