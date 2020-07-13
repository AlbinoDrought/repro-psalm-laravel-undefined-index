#!/bin/sh

set -e
set -x

cp .env.example .env
rm -f laravel.sqlite
touch laravel.sqlite
composer install
php artisan migrate
./vendor/bin/psalm --debug

