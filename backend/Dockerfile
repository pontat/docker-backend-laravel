FROM php:8.0-fpm

COPY --from=composer:2.1.5 /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y zip unzip && \
    docker-php-ext-install pdo pdo_mysql && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug

COPY ./backend/php-fpm.d/zzz-www.conf /usr/local/etc/php-fpm.d/zzz-www.conf
COPY ./backend/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www