#!/bin/bash

if [ -z $1 ];then
	echo "No IP setting for primary dns"
	echo "No IP setting for secondary dns"
	echo "No setting value for reverse network"
else
	echo "Ok - 1"
	if [ -z $2 ];then
		echo "No IP setting for secondary dns"
		echo "No setting value for reverse network"
	else
		echo "Ok - 2"
		if [ -z $3 ];then
			echo "No setting value for reverse network"
		else
			echo "Ok - 3"
			docker build -t ubuntu .
			cd secondary
			sed -i "s/reverserede/$3/" named.conf.default-zones
			sed -i "s/primary/$1/" named.conf.default-zones
			wrk2=$(pwd)
			docker run -d --name ns2 --hostname dns-ns2 -p $2:53:53/udp -p $2:53:53/tcp -v "$wrk2"/:/etc/bind --dns $2 ubuntu
			echo "Name container to dns secondary => ns2 | With IP $2"
		fi
	fi
fi