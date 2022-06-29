#!/bin/bash

if [ -z $1 ];then
	echo "No IP setting for primary dns"
	echo "No IP setting for secondary dns"
else
	if [ -z $2 ];then
	echo "No IP setting for secondary dns"
	else
		docker build -t ubuntu .
		cd secondary
		wrk2=$(pwd)
       		sed -i "s/primary/$1/" named.conf.default-zones
		docker run -d --name ns2 --hostname dns-ns2 -p $2:53:53/udp -p $2:53:53/tcp -v "$wrk2"/:/etc/bind --dns $2 ubuntu
		echo "Name container to dns secondary => ns2"
	fi
fi