#!/bin/sh

PWD="$(pwd | sed 's/\//\\\//g')"

sed "s/<<PWD>>/$PWD/g" < nginx.conf.tpl > nginx.conf
sed "s/<<PWD>>/$PWD/g" < php-fpm.conf.tpl > php-fpm.conf

php-fpm -y `pwd`/php-fpm.conf &
FPM_PID=$!
nginx -c `pwd`/nginx.conf &
NGINX_PID=$!

read Y
kill $FPM_PID
kill $NGINX_PID