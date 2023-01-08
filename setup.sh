#!/bin/bash

for app in laravel-app-1 laravel-app-2 ;
    do 
        docker exec -it $app composer install
        docker exec -it $app npm install
        docker exec -it $app npm run build
        docker exec -it $app php artisan key:generate
        docker exec -it $app php artisan migrate:fresh
    done
