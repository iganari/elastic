#!/bin/bash

BASEPATH=$(cd `dirname $0`; pwd)

### install nginx
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum -y install nginx

### install php 5.6
yum -y install epel-release
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum -y install --enablerepo=remi-php56,remi,epel vim-enhanced php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof php-fpm php-pdo php-mcrypt php-pecl-memcached php-pecl-msgpack

### setting php 
mv  /etc/php.ini /etc/php.ini.bk  
ln -s ${BASEPATH}/opsfiles/php.ini /etc/ 
# sed -i -e 's/;date.timezone =/date.timezone = "Asia\/Tokyo"/' /etc/php.ini | grep date.timezone

### setting php-fpm
sed -i -e 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sed -i -e 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf

sleep 1

service   php-fpm restart
chkconfig php-fpm on

service   nginx restart
chkconfig nginx on


exit
