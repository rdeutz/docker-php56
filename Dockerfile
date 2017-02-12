FROM debian:jessie

LABEL authors="Yves Hoppe, Robert Deutz"

# Install
RUN apt-get update \
	&& DEBIAN_FRONTEND='noninteractive' apt-get install -y php5 php5-cli php5-memcache php5-memcached php5-xdebug php5-redis wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && cd /usr/local/bin \
    && wget -O phpunit --no-check-certificate https://phar.phpunit.de/phpunit-4.8.27.phar \
    && chmod +x phpunit
