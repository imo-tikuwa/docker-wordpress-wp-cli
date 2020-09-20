FROM wordpress:php7.4-fpm-alpine

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

RUN wp --allow-root core download --version=latest --locale=ja --path=/var/www/html --force \
    && wp --allow-root core config --dbhost=db --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --path=/var/www/html

RUN wp --allow-root core install --title='ほげ' --admin_user='admin' --admin_password='password' --admin_email='imo-tikuwa@example.com' --url='http://localhost' --path=/var/www/html

RUN wp --allow-root plugin uninstall akismet hello --path=/var/www/html \
    && wp --allow-root plugin install wp-multibyte-patch --activate --path=/var/www/html \
    && wp --allow-root plugin install all-in-one-wp-migration --activate --path=/var/www/html

COPY ./wpress/restore.wpress /tmp

EXPOSE 9000