#!/bin/sh

PWD="$(pwd | sed 's/\//\\\//g')"

if [ -z "$PHP" ]; then
    PHP="php"
fi

sed "s/<<PWD>>/$PWD/g" < nginx.conf.tpl > nginx.conf

$PHP server.php 8081 &
PHP1_PID=$!
$PHP server.php 8082 &
PHP2_PID=$!
$PHP server.php 8083 &
PHP3_PID=$!
$PHP server.php 8084 &
PHP4_PID=$!
$PHP server.php 8085 &
PHP5_PID=$!
$PHP server.php 8086 &
PHP6_PID=$!
$PHP server.php 8087 &
PHP7_PID=$!
$PHP server.php 8088 &
PHP8_PID=$!
$PHP server.php 8089 &
PHP9_PID=$!
$PHP server.php 8090 &
PHP10_PID=$!
$PHP server.php 8091 &
PHP11_PID=$!
$PHP server.php 8092 &
PHP12_PID=$!
$PHP server.php 8093 &
PHP13_PID=$!
$PHP server.php 8094 &
PHP14_PID=$!
$PHP server.php 8095 &
PHP15_PID=$!
$PHP server.php 8096 &
PHP16_PID=$!
nginx -c `pwd`/nginx.conf &
NGINX_PID=$!

read Y
kill $PHP1_PID
kill $PHP2_PID
kill $PHP3_PID
kill $PHP4_PID
kill $PHP5_PID
kill $PHP6_PID
kill $PHP7_PID
kill $PHP8_PID
kill $PHP9_PID
kill $PHP10_PID
kill $PHP11_PID
kill $PHP12_PID
kill $PHP13_PID
kill $PHP14_PID
kill $PHP15_PID
kill $PHP16_PID
kill $NGINX_PID
