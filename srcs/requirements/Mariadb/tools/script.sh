#!/bin/bash

sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

sleep 2

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> /tmp/db.sql
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%';" >> /tmp/db.sql
echo "SET PASSWORD FOR '${DB_USER}'@'%' = PASSWORD('${DB_PASS}');" >> /tmp/db.sql
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" >> /tmp/db.sql
echo "FLUSH PRIVILEGES;" >> /tmp/db.sql
mariadb < /tmp/db.sql

kill `pidof mariadbd`

echo "			Starting Mariadb.."

exec mariadbd
