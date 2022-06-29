#!/bin/bash

if [ -z $1 ];then
	echo "No IP setting for primary dns"
	echo "No IP setting for secondary dns"
else
	docker build -t ubuntu .
	cd primary
        sed -i "s/primary/$1/" db.ac.asa.br
	wrk=$(pwd)
        if [ -z $2 ];then
		echo "------------------------------------------------"
                echo "Secondary DNS IP is 127.0.0.1 - To compose files"
                echo "------------------------------------------------"
                sed -i "s/secondary/127.0.0.1/" db.ac.asa.br
                sed -i "s/secondary/127.0.0.1/" named.conf.default-zones
                docker run -d -p $1:53:53/udp -p $1:53:53/tcp --name ns1 --hostname dns-ns1 -v "$wrk"/:/etc/bind --dns $1 ubuntu
        else
                sed -i "s/secondary/$2/" db.ac.asa.br
                sed -i "s/secondary/$2/" named.conf.default-zones
                docker run -d -p $1:53:53/udp -p $1:53:53/tcp --name ns1 --hostname dns-ns1 -v "$wrk"/:/etc/bind --dns $1 ubuntu
	fi
	echo "Name container to dns primary => ns1"
fi
