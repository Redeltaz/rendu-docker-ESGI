compose = docker compose exec -it
app1 = laravel-app-1
app2 = laravel-app-2

install:
	for app in $(app1) $(app2) ; do \
		$(compose) $$app composer install ; \
		$(compose) $$app npm install ; \
		$(compose) $$app npm run build ; \
		$(compose) $$app php artisan key:generate ; \
		$(compose) $$app php artisan migrate:fresh ; \
    done
