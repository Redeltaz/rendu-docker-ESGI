FROM php:8.1

WORKDIR /app

COPY ./app1 .

RUN apt update -y
RUN apt install -y \
        zip \
        unzip

# nodejs version of apt is to low so we setup version 18
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install -y nodejs

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN npm install
RUN composer install
RUN npm run build
RUN php artisan key:generate
