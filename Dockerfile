ARG FRANKEN_VERSION=1
ARG PHP_VERSION=8.3
ARG DEBIAN_VERSION=trixie

FROM dunglas/frankenphp:${FRANKEN_VERSION}-php${PHP_VERSION}-${DEBIAN_VERSION}

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --chmod=0755 entrypoint.sh /usr/local/bin/docker-php-entrypoint
COPY --chmod=0755 node.sh /root/node.sh
ENV SERVER_NAME=:80

RUN /root/node.sh \
 && apt-get update && apt-get install -y nodejs 7zip \
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
    mongodb \
 && apt-get clean \
 && rm /root/node.sh
