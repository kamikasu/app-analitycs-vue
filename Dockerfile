FROM php:8.1-apache
RUN apt update \
    && apt install -y \
        g++ \
        make \
        zip \
        unzip \
        libcurl4-openssl-dev \
        pkg-config \
        libssl-dev \
        libssh2-1-dev \
        libzip-dev \
        supervisor \
    && pecl install \
        mongodb \
        ssh2-1.3.1 \
        redis \
    && docker-php-ext-install \
        mysqli \
        pdo \
        pdo_mysql \
        zip \
        pcntl \
    && docker-php-ext-enable \
        mongodb \
        ssh2 \
        redis
COPY php "$PHP_INI_DIR/conf.d/"
COPY apache /etc/apache2/
COPY supervisor/supervisor.conf /etc/supervisor/conf.d/
COPY --from=composer:2.3.7 /usr/bin/composer /usr/bin/composer
# Add user for laravel application
# RUN groupadd -g 1000 www
# RUN useradd -u 1000 -ms /bin/bash -g www www
# ADD https://github.com/elastic/apm-agent-php/archive/refs/tags/v1.6.1.tar.gz /srv/apm.tar.gz
# RUN mkdir -p /usr/src/php/ext \
#     && cd /srv/ && tar zxf /srv/apm.tar.gz \
#     && mv /srv/apm-agent-php-1.6.1/src/ext /usr/src/php/ext/apm-agent \
#     && docker-php-ext-install apm-agent \
#     && docker-php-ext-enable elastic_apm
RUN a2enmod rewrite
# USER www-data
WORKDIR /var/www/html/
COPY --chown=www-data:www-data . .
RUN composer install --ignore-platform-reqs
# RUN php artisan config:cache \
#     && php artisan route:cache  \
#     && php artisan view:cache
# COPY conect /conect
CMD sh -c "service supervisor start && apache2-foreground"