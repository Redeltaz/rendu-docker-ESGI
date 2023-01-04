FROM php:8.1 AS container-setup

WORKDIR /app

RUN apt update -y
RUN apt install -y \
        zip \
        unzip \
        iputils-ping

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install -y nodejs

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# remove useless packages after install
RUN apt remove -y \
        zip \
        unzip

FROM container-setup AS app-setup

RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo pdo_mysql

CMD php artisan serve
