FROM alpine:3.8

RUN apk update && \
	apk add nginx curl supervisor \
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
	php7-mongodb \
	php7-pdo

COPY nginx.conf /etc/nginx/nginx.conf

COPY supervisord.conf /etc/supervisord.conf
#http://supervisord.org/configuration.html default route start supervisord.conf

WORKDIR /var/www/html

ENTRYPOINT ["supervisord"]
