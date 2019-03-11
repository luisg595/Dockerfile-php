FROM debian:9.8

RUN echo 'deb http://deb.debian.org/debian unstable main contrib non-free' > /etc/apt/sources.list

RUN apt-get update && \
	apt-get install -y supervisor apache2 \
	php7.3 \
	php7.3-fpm \
	php7.3-zip \
	php7.3-mbstring \
	php7.3-xml \
	php7.3-mysql \
	php-mongodb && \
	mkdir /var/log/supervisord/ && \
	mkdir /run/php/ && \
	a2enmod proxy_fcgi && \
	a2enmod rewrite

COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

COPY supervisord.conf /etc/supervisord.conf
#http://supervisord.org/configuration.html default route start supervisord.conf

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["supervisord"]
