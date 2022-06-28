#!/bin/bash

if [ -z $1 ];then
	echo "No IP setting for primary dns"
else
	docker build -t ubuntu .
	cd primary
        sed -i "s/primary/$1/" db.ac.asa.br
	wrk=$(pwd)
        if [ -z $2 ];then
		echo "--------------------------------"
                echo "IP Secondary DNS is => 127.0.0.1"
                echo "--------------------------------"
                sed -i "s/secondary/127.0.0.1/" db.ac.asa.br
                sed -i "s/secondary/127.0.0.1/" named.conf.default-zones
                docker run -d -p 53:53/udp -p 53:53/tcp --name ns1 --hostname dns-ns1 -v "$wrk"/:/etc/bind --dns $1 ubuntu
        else
                sed -i "s/secondary/$2/" db.ac.asa.br
                sed -i "s/secondary/$2/" named.conf.default-zones
                docker run -d -p 53:53/udp -p 53:53/tcp --name ns1 --hostname dns-ns1 -v "$wrk"/:/etc/bind --dns $1 ubuntu
	fi
	echo "Name container to dns primary => ns1"
fi

if [ -z $1 ];then
	echo "No primary dns so don't upgrade secondary"
else
	cd ..
	cd secondary
	wrk2=$(pwd)
       	sed -i "s/primary/$1/" named.conf.default-zones
	if [ -z $2 ];then
		docker run -d --name ns2 --hostname dns-ns2 -v "$wrk2"/:/etc/bind --dns 127.0.0.1 ubuntu
	else
		docker run -d --name ns2 --hostname dns-ns2 -v "$wrk2"/:/etc/bind --dns $2 ubuntu
	fi
	echo "Name container to dns secondary => ns2"
fi
