FROM  php:5.6-cli

MAINTAINER Robert Deutz

# Install
RUN apt-get update \
	&& apt-get install -y php5-memcache php5-memcached php5-redis php5-xdebug wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && cd /usr/local/bin \
    && wget -O phpunit https://phar.phpunit.de/phpunit-4.8.27.phar \
    && chmod +x phpunit
