FROM    php:8.0-fpm-buster
SHELL   ["/bin/bash", "-c"]
ENV     TZ=Asia/Tokyo \
  #(本)production
        APP_ENV=local \
  #(本)false
        APP_DEBUG=true \
        # locale
        LANG=en_US.UTF-8 \
        LANGUAGE=en_US:en \
        LC_ALL=en_US.UTF-8 \
        #composer env
          #root user でのインストールを許可
        COMPOSER_ALLOW_SUPERUSER=1 \ 
        COMPOSER_HOME=/composer \
        COMPOSER_MEMORY_LIMIT=-1 \
        #Laravel env
        DB_CONNECTION=mysql \
        DB_HOST=db \
        DB_DATABASE=naruse_db \
        DB_USERNAME=naruse \
        DB_PASSWORD=db_test
        
        #composer install
COPY    --from=composer:1 /usr/bin/composer /usr/bin/composer

RUN     apt-get update && \
        apt-get -y install --no-install-recommends git unzip locales libicu-dev libonig-dev libzip-dev && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        locale-gen en_US.UTF-8 && \
        localedef -f UTF-8 -i en_US en_US.UTF-8 && \
        mkdir /var/run/php-fpm && \
        mkdir /var/log/php && \
        docker-php-ext-install intl pdo_mysql zip bcmath && \
        composer config -g repos.packagist composer https://packagist.org && \
        #システムのタイムアウト値
        composer config -g process-timeout 3600

COPY    ./php_ini/dev_php.ini /usr/local/etc/php/php.ini
COPY    ./php-fpm.d/www.conf /usr/local/etc/php-fpm.d/zzz-www.conf

WORKDIR /work