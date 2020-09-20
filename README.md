# docker-wordpress-wp-cli

## setup
```
docker-compose up --build -d
docker-compose exec wp bash /tmp/wp-install.sh
```

## memo
それぞれのコンテナ内に入るコマンドは以下の通り
```
docker-compose exec web sh
docker-compose exec wp bash
docker-compose exec db bash
```

wp-cliによるWordPres操作
```
wp core install --title='ほげ' --admin_user='admin' --admin_password='password' --admin_email='imo-tikuwa@example.com' --url='http://localhost'
wp plugin uninstall akismet hello
wp plugin install wp-multibyte-patch --activate
```
