#!/bin/bash

if [ -z "$1" ]; then
	echo "usage: $0 <url>"
fi

# warm it up
ab -n 1000 "$1" &> /dev/null

cmds=(
	#"ab -n 5000 -c 1 -k $1"
	#"ab -n 5000 -c 10 -k $1"
	#"ab -n 5000 -c 50 -k $1"
	#"ab -n 5000 -c 100 -k $1"
	"wrk -t 1 -c 1 -d 10 $1"
	"wrk -t 2 -c 10 -d 10 $1"
	"wrk -t 10 -c 50 -d 10 $1"
	"wrk -t 20 -c 100 -d 10 $1"
	#"siege -c 1 -t 10s $1"
	#"siege -c 10 -t 10s $1"
	#"siege -c 50 -t 10s $1"
	#"siege -c 100 -t 10s $1"
)

IFS=$'\n'
for cmd in ${cmds[*]}; do
	echo "$ $cmd"
	eval $cmd
done
