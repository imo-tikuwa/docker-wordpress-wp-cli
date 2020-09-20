FROM mysql:5.7

RUN { \
        echo "alias ll='ls -l --color=auto'"; \
    } >> /root/.bashrc

COPY ./mysql.conf.d /etc/mysql/mysql.conf.d