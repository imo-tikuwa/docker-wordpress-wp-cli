FROM wordpress:php7.4-fpm-alpine

RUN { \
        echo "alias ll='ls -l --color=auto'"; \
    } >> /root/.bashrc

RUN apk add --no-cache mysql-client

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

COPY ./wpress/restore.wpress /tmp
COPY ./wp-install.sh /tmp/wp-install.sh

EXPOSE 9000