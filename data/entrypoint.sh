#!/bin/sh

service apache2 start
service ssh start
service mysql start
service redis-server start

/bin/bash