FROM ubuntu:16.04

LABEL maintainer="Antoinette Mkwapatira <antdoesit@gmail.com>"

RUN apt-get update \
    && apt-get -y install apt-utils apache2 nano mysql-client wget curl libmcrypt-dev vim zip unzip \
    && a2enmod rewrite \
    && a2enmod headers \
    && export LANG=en_US.UTF-8 \
    && apt-get update \
    && apt-get -y install gcc make autoconf libc-dev pkg-config \
    && apt-get install -y software-properties-common \
    && apt-get install -y language-pack-en-base \
    && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get -y install php7.4 php-pear php7.4-curl php7.4-intl php7.4-gd php7.4-common php7.4-dev php7.4-xsl php7.4-mbstring php7.4-zip php7.4-bz2 php7.4-calendar php7.4-exif php7.4-json php7.4-mysql php7.4-soap php7.4-fpm php7.4-bcmath libapache2-mod-php7.4 \
    && pecl install mcrypt \
    && phpenmod mcrypt \
    && sed -i -e"s/^memory_limit\s*=\s*128M/memory_limit = 1024M/" /etc/php/7.4/apache2/php.ini \
    && rm /var/www/html/* \
    && sed -i "s/None/all/g" /etc/apache2/apache2.conf \
##install supervisor and setup supervisord.conf file
    && apt-get install -y supervisor \
    && mkdir -p /var/log/supervisor \
    && export PATH=$PATH:/var/www/html/magento2/bin

env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2
env LANG               C

WORKDIR /var/www/html

CMD ["/usr/bin/supervisord"]
