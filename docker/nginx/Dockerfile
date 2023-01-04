FROM php:8.1-fpm

WORKDIR /var/www

RUN apt update -y
RUN apt install -y nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo pdo_mysql

EXPOSE 80

CMD php-fpm -D && nginx -g "daemon off;"
