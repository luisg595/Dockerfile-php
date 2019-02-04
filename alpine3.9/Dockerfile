FROM alpine:3.9

RUN apk update && \
	apk add nginx supervisor \
	php7 \
	php7-fpm \
	php7-zip \
	php7-mbstring \
	php7-xml \
	php7-mysqli \
	php7-json \
	php7-phar \
	php7-dom \
	php7-xmlwriter \
	php7-tokenizer \
	php7-session \
	php7-ctype \
	php7-gd \
	php7-iconv \
	php7-simplexml \
	php7-xmlreader \
	php7-pdo \
	php7-pdo_mysql && \
	mkdir /var/log/supervisord/

COPY www.conf /etc/php7/php-fpm.d/www.conf

COPY php.ini /etc/php7/php.ini

COPY nginx.conf /etc/nginx/nginx.conf

COPY supervisord.conf /etc/supervisord.conf
#http://supervisord.org/configuration.html default route start supervisord.conf

WORKDIR /www

EXPOSE 80

ENTRYPOINT ["supervisord"]
