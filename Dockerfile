FROM php:7.2.6

WORKDIR /v2
ENTRYPOINT /bin/bash

RUN apt-get update && apt-get install -y unzip mysql-client libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev libgmp-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install -j$(nproc) intl zip xml pdo_mysql
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-configure gmp
RUN docker-php-ext-install gmp

RUN pecl install mailparse && docker-php-ext-enable mailparse
RUN composer global require "fxp/composer-asset-plugin:^1.2.0"
