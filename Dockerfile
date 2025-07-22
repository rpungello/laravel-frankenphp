ARG FRANKEN_VERSION=1
ARG PHP_VERSION=8.3
ARG DEBIAN_VERSION=bookworm

FROM dunglas/frankenphp:${FRANKEN_VERSION}-php${PHP_VERSION}-${DEBIAN_VERSION}

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY entrypoint.sh /usr/local/bin/docker-php-entrypoint
ENV SERVER_NAME=:80

RUN apt-get update && apt-get install -y npm 7zip \
 && install-php-extensions \
    ftp \
    gd \
    intl \
    opcache \
    pcntl \
    imagick \
    pdo_mysql \
    redis \
    zip \
 && apt-get clean \
 && chmod +x /usr/local/bin/docker-php-entrypoint
