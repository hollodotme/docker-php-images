FROM php:8.0-rc-fpm-alpine

ARG PHPREDIS_VERSION="5.3.2"

RUN set -ex && apk add gnu-libiconv --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN set -ex \
	&& apk update && apk upgrade --available \
	&& apk add --no-cache $PHPIZE_DEPS icu-dev postgresql-dev \
	&& docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
	&& mkdir -p "/usr/src/php/ext/redis" \
    && curl  -fsSL "https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz" | tar xvz -C "/usr/src/php/ext/redis" --strip 1 \
    && echo 'redis' >> "/usr/src/php-available-exts" \
    && docker-php-ext-install redis \
    && rm -rf "/usr/src/php/ext/redis" \
	&& docker-php-ext-install intl pdo_mysql pdo_pgsql opcache

COPY opcache.ini $PHP_INI_DIR/conf.d/

RUN set -ex && apk del $PHPIZE_DEPS && rm -rf /var/cache/apk/* \
	&& apk add --no-cache file