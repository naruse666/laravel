up:
	docker-compose up -d

down:
	docker-compose down

laravel:
	docker-compose exec php composer create-project --prefer-dist laravel/laravel . ^7.0
	docker-compose exec php chmod -R 777 storage bootstrap/cache
	docker-compose exec php composer require "laravelcollective/html":"6.*"

login_function:
	@node
	docker-compose exec php composer require laravel/ui:2.*
	docker-compose exec php php artisan ui vue --auth
	@node

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

composer_update:
	docker-compose exec php composer update

node:
	docker-compose run node npm install
	docker-compose run node npm run dev