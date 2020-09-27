# docker-wordpress-wp-cli

## setup
```
docker-compose up --build -d
docker-compose exec wp bash /tmp/wp-install.sh
```
---
wp-install.shの実行について、mysql/wordpressが出来上がるまで待つ必要がありそう。すぐに実行すると以下のようにインストールコマンド時のmysqlの接続が確立できなくてエラー出ちゃいます。
```
ERROR 2002 (HY000): Can't connect to MySQL server on 'db' (115)
```

## やり直すとき
永続化してるデータを消す必要があるかも
```
docker-compose down --rmi all --volumes && rm -fR html\* && rm -fR mysql\*
```

## memo
それぞれのコンテナ内に入るコマンドは以下の通り
```
docker-compose exec web sh
docker-compose exec wp bash
docker-compose exec db bash
```
