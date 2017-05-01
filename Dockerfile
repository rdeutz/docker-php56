FROM  php:5.6-cli

MAINTAINER Robert Deutz

# Install
RUN apt-get update \
    && apt-get install -y wget libmcrypt-dev zlib1g-dev \ 
    	libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \ 
    	memcached libmemcached-tools libmemcached-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd  \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached \
    && cd /usr/local/bin \
    && wget -O phpunit --no-check-certificate https://phar.phpunit.de/phpunit-4.8.35.phar \
    && chmod +x phpunit \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config/php.ini /usr/local/etc/php/


