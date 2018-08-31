#!/bin/sh

service apache2 start
service ssh start
service mysql start
/mysql.sh
rm /mysql.sh
service redis-server start

/bin/bash