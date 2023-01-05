FROM php:8.1-fpm AS container-setup

# Install system dependencies
RUN apt update -y
RUN apt install -y \
    curl \
    zip \
    unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install -y nodejs

RUN apt remove -y \
    curl \
    zip \
    unzip

FROM container-setup

RUN docker-php-ext-install pdo pdo_mysql 
RUN docker-php-ext-enable pdo pdo_mysql

WORKDIR /var/www

#use different user to avoid permission problems and allow composer commands
RUN useradd -G www-data,root docker-user
RUN mkdir -p /home/docker-user/.composer
RUN chown -R docker-user:docker-user /home/docker-user

USER docker-user
