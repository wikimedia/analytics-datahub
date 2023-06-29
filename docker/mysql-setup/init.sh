#!/bin/bash

: ${MYSQL_PORT:=3306}

/datahub/dockerize -wait tcp://$MYSQL_HOST:$MYSQL_PORT -timeout 240s
sed -e "s/DATAHUB_DB_NAME/${DATAHUB_DB_NAME}/g" /datahub/init.sql | tee -a /tmp/init-final.sql
mysql -u $MYSQL_USERNAME -p"$MYSQL_PASSWORD" -h $MYSQL_HOST -P $MYSQL_PORT < /tmp/init-final.sql
