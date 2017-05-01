FROM  php:5.6-cli

MAINTAINER Robert Deutz

# Install
RUN apt-get update && apt-get install -y libmcrypt-dev wget \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && cd /usr/local/bin \
    && wget -O phpunit https://phar.phpunit.de/phpunit-4.8.35.phar \
    && chmod +x phpunit \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*




