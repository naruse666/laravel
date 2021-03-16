EXEC := docker-compose exec
COMPOSE := docker-compose

up:
	${COMPOSE} up -d
down:
	${COMPOSE} down

laravel:
	${EXEC} php composer create-project --prefer-dist laravel/laravel . ^7.0
	${EXEC} php chmod -R 777 storage bootstrap/cache
	${EXEC} php composer require "laravelcollective/html":"6.*"

login_function:
	${EXEC} php composer require laravel/ui:2.*
	${EXEC} php php artisan ui vue --auth
	@make node

build:
	${COMPOSE} build --no-cache

php:
	${EXEC} php bash

nginx:
	${EXEC} nginx ash

sql:
	${EXEC} db bash -c 'mysql -u$$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'

logs:
	${COMPOSE} logs

migrate:
	${EXEC} php php artisan migrate

refresh:
	${EXEC} php php artisan migrate:refresh
	@make seed

seed:
	${EXEC} php php artisan db:seed --class=DatabaseSeeder

tinker:
	${EXEC} php php artisan tinker

composer_update:
	${EXEC} php composer update

node:
	${COMPOSE} run node npm install
	${COMPOSE} run node npm run dev
