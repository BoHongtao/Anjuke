#!/bin/bash
php_gz_file='/home/Auto-LNMP/soft/php-7.1.27.tar.gz'
nginx_gz_file='/home/Auto-LNMP/soft/openresty-1.13.6.2.tar.gz'

php_tar_dir='/home/Auto-LNMP/php-7.1.27/'
nginx_tar_dir='/home/Auto-LNMP/openresty-1.13.6.2/'

run_dir='/home/Auto-LNMP'


yum -y install aspell-devel
yum -y install bzip2-devel
yum -y install curl-devel
yum -y install db4-devel
yum -y install enchant-devel
yum -y install freetype-devel
yum -y install gmp-devel
yum -y install net-snmp-devel
yum -y install readline-devel
yum -y install unixODBC-devel
yum -y install libxslt-devel
yum -y install libXpm-devel
yum -y install libpng-devel
yum -y install libvpx-devel
yum -y install libicu-devel
yum -y install libc-client-devel
yum -y install libjpeg-devel
yum -y install libcurl-devel
yum -y install openldap
yum -y install openldap-devel
yum -y install postgresql-devel
yum -y install sqlite-devel
yum -y install pcre-devel
yum -y install mysql-devel
yum -y install pspell-devel
yum -y install cpan
yum -y install perl*
yum -y install readline-devel pcre-devel openssl-devel gcc


useradd www -d /home/www -m
groupadd www
usermod -G www www



rm -rf ${php_tar_dir}
tar -zxvf ${php_gz_file} && cd ${php_tar_dir} && ./configure  --prefix=/usr/local/php --localstatedir=/usr/local/var --enable-bcmath --enable-calendar --enable-dba --enable-exif  --enable-gd-native-ttf --enable-mbregex --enable-mbstring --enable-shmop --enable-soap --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --enable-zip  --with-gd --with-gettext --with-mhash  --with-xmlrpc --with-zlib --with-readline --without-gmp --without-snmp  --with-openssl --enable-fpm  --with-curl --with-xsl  --disable-phpdbg --enable-zend-signals --with-pgsql --with-pdo-pgsql --with-freetype-dir --with-pdo-mysql && make && make install

cp ${run_dir}/conf/php.ini /usr/local/php/lib/php.ini
ln -s /usr/local/php/bin/php /usr/bin/php
rm -rf /usr/local/php/etc/php-fpm.d
mkdir /usr/local/php/etc/php-fpm.d
rm /usr/local/php/etc/php-fpm.conf.default
mv ${run_dir}/conf/php-fpm.conf  /usr/local/php/etc


echo "******************* install php successful *****************************"

# install openResty
rm -rf ${nginx_tar_dir}
tar -zxvf ${nginx_gz_file} && cd ${nginx_tar_dir} && ./configure --prefix=/home/openresty && make && make install

cp ${run_dir}/conf/nginx.conf /home/openresty/nginx/conf/nginx.conf
mkdir /home/openresty/nginx/conf/vhosts

echo "******************* install nginx successful *****************************"
