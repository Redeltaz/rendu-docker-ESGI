exec = docker exec -it
app1 = laravel-app-1
app2 = laravel-app-2

install:
	for app in $(app1) $(app2) ; do \
		$(exec) $$app composer install ; \
		$(exec) $$app npm install ; \
		$(exec) $$app npm run build ; \
		$(exec) $$app php artisan key:generate ; \
		$(exec) $$app php artisan migrate:fresh ; \
	done
