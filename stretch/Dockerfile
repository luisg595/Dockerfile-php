FROM debian:9.5

RUN echo 'deb http://deb.debian.org/debian unstable main contrib non-free' > /etc/apt/sources.list

RUN apt-get update && \
	apt-get install -y curl supervisor apache2 \
	php7.2 \
	php7.2-fpm \
	php7.2-zip \
	php7.2-mbstring \
	php7.2-xml \
	php7.2-mysql \
	php-mongodb && \
	mkdir /var/log/supervisord/ && \
	mkdir /run/php/ && \
	a2enmod proxy_fcgi && \
	a2enmod rewrite

COPY www.conf /etc/php/7.2/fpm/pool.d/www.conf

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

COPY supervisord.conf /etc/supervisord.conf
#http://supervisord.org/configuration.html default route start supervisord.conf

WORKDIR /var/www/html

ENTRYPOINT ["supervisord"]
