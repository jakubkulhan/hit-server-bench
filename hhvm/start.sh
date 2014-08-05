#!/bin/sh

PWD="$(pwd | sed 's/\//\\\//g')"

sed "s/<<PWD>>/$PWD/g" < nginx.conf.tpl > nginx.conf

hhvm -m server -vServer.Type=fastcgi -vServer.Port=10001 -vEval.Jit=true -vEval.JitWarmupRequests=0 &
HHVM1_PID=$!
hhvm -m server -vServer.Type=fastcgi -vServer.Port=10002 -vEval.Jit=true -vEval.JitWarmupRequests=0 &
HHVM2_PID=$!
hhvm -m server -vServer.Type=fastcgi -vServer.Port=10003 -vEval.Jit=true -vEval.JitWarmupRequests=0 &
HHVM3_PID=$!
hhvm -m server -vServer.Type=fastcgi -vServer.Port=10004 -vEval.Jit=true -vEval.JitWarmupRequests=0 &
HHVM4_PID=$!
hhvm -m server -vServer.Type=fastcgi -vServer.Port=10005 -vEval.Jit=true -vEval.JitWarmupRequests=0 &
HHVM5_PID=$!
hhvm -m server -vServer.Type=fastcgi -vServer.Port=10006 -vEval.Jit=true -vEval.JitWarmupRequests=0 &
HHVM6_PID=$!
hhvm -m server -vServer.Type=fastcgi -vServer.Port=10007 -vEval.Jit=true -vEval.JitWarmupRequests=0 &
HHVM7_PID=$!
hhvm -m server -vServer.Type=fastcgi -vServer.Port=10008 -vEval.Jit=true -vEval.JitWarmupRequests=0 &
HHVM8_PID=$!
nginx -c `pwd`/nginx.conf &
NGINX_PID=$!

read Y
kill $HHVM1_PID
kill $HHVM2_PID
kill $HHVM3_PID
kill $HHVM4_PID
kill $HHVM5_PID
kill $HHVM6_PID
kill $HHVM7_PID
kill $HHVM8_PID
kill $NGINX_PID
