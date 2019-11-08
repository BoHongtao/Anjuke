# Auto-LNMP

## 自动化安装php nginx mysql工具
1. 安装php版本为php7.1.27，nginx版本为openresty-1.13.6.2.tar
2. php.ini,php-fpm.conf,nginx.conf配置文件会自动创建或更新

# Command
## nginx 重载配置
`/home/openresty/nginx/sbin/nginx -c /home/openresty/nginx/conf/nginx.conf`
`/home/openresty/nginx/sbin/nginx -s reload`

## php-fpm 启动
`/usr/local/php/sbin/php-fpm -c /usr/local/php/etc/php.ini -y /usr/local/php/etc/php-fpm.conf`

## 查看进程
`ps -ef|grep php-fpm`

`ps -ef|grep nginx`

## Kill
`kill -TERM 主进程号`

