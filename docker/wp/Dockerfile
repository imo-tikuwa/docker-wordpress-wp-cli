FROM wordpress:php7.4-fpm-alpine

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp
    # && wp --allow-root

EXPOSE 9000