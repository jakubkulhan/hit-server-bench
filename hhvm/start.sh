#!/bin/sh

PWD="$(pwd | sed 's/\//\\\//g')"

sed "s/<<PWD>>/$PWD/g" < nginx.conf.tpl > nginx.conf

hhvm -m server -vServer.Type=fastcgi -vServer.Port=10001 &
HHVM_PID=$!
nginx -c `pwd`/nginx.conf &
NGINX_PID=$!

read Y
kill $HHVM_PID
kill $NGINX_PID
