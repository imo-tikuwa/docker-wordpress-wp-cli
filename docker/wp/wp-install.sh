#!/bin/bash

set -ex;

# WP_INSTALL_PATHがサブディレクトリの場合はホストPCと共有してるディレクトリを削除しようとしてエラーが出る
rm -fR /var/www/html/*

mkdir -p $WP_INSTALL_PATH
wp --allow-root core download --version=latest --locale=ja --path=$WP_INSTALL_PATH --force
wp --allow-root core config --dbhost=db --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --path=$WP_INSTALL_PATH
wp --allow-root core install --title=$WP_BLOG_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --url=$WP_HTTP_ROOT --path=$WP_INSTALL_PATH
wp --allow-root plugin uninstall akismet hello --path=$WP_INSTALL_PATH
wp --allow-root plugin install wp-multibyte-patch --activate --path=$WP_INSTALL_PATH
wp --allow-root plugin install all-in-one-wp-migration --activate --path=$WP_INSTALL_PATH

# wp-cliからのall-in-one-wp-migrationを介したリストアは有償のエクステンションが必要だった模様^^;
# if [ -f /tmp/restore.wpress ] then
#     mv /tmp/restore.wpress $WP_INSTALL_PATH/wp-content/ai1wm-backups
#     wp --allow-root ai1wm restore restore.wpress
# fi