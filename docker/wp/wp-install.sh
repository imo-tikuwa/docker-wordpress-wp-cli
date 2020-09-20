#!/bin/bash

set -ex;

wp --allow-root core download --version=latest --locale=ja --path=/var/www/html --force
wp --allow-root core config --dbhost=db --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --path=/var/www/html
wp --allow-root core install --title='テスト' --admin_user='admin' --admin_password='password' --admin_email='imo-tikuwa@example.com' --url='http://localhost' --path=/var/www/html
wp --allow-root plugin uninstall akismet hello --path=/var/www/html
wp --allow-root plugin install wp-multibyte-patch --activate --path=/var/www/html
wp --allow-root plugin install all-in-one-wp-migration --activate --path=/var/www/html
