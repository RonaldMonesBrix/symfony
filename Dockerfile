FROM ubuntu:18.04
MAINTAINER BrixCRM

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y --no-install-recommends software-properties-common wget curl gnupg nano ssh sudo rsync ant

RUN	add-apt-repository ppa:ondrej/php
RUN	apt-get update
RUN	apt-get install -y apache2 mysql-client mysql-server php7.1 libapache2-mod-php7.1  php7.1-bcmath php7.1-curl php7.1-gd php7.1-gmp php7.1-imap php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-xml php7.1-zip php7.1-mysql php7.1-redis php7.1-soap php7.1-opcache php7.1-xdebug composer redis-server ssh

COPY data/index.php /var/www/html/index.php
COPY data/symfony.conf /etc/apache2/sites-available/symfony.conf
COPY data/symfony /etc/sudoers.d/symfony

RUN a2dissite 000-default
RUN a2ensite symfony
RUN a2enmod ssl
RUN a2enmod rewrite

RUN adduser brix --disabled-password --gecos GECOS
RUN usermod -a -G adm brix
RUN chown brix:brix /var/www/html -R

COPY data/redis.conf /etc/redis/brix.conf
RUN echo "include /etc/redis/brix.conf" >> /etc/redis/redis.conf

RUN mkdir /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
EXPOSE 80 443 22
COPY data/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]