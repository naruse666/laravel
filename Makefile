up:
	docker-compose up -d

down:
	docker-compose down

laravel:
	docker-compose exec php composer create-project --prefer-dist laravel/laravel .
	docker-compose exec php chmod -R 777 storage bootstrap/cache
	composer require "laravelcollective/html":"6.*"

build:
	docker-compose build --no-cache

php:
	docker-compose exec php bash

nginx:
	docker-compose exec nginx ash

sql:
	docker-compose exec db bash -c 'mysql -u$$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'

logs:
	docker-compose logs

migrate:
	docker-compose exec php php artisan migrate

tinker:
	docker-compose exec php php artisan tinker