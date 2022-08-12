#!/bin/bash

if [ -z $1 ];then
	echo "No IP setting for primary dns"
	echo "No IP setting for secondary dns"
	echo "No setting final value of IP primary, for reverse zone primary"
	echo "No setting final value of IP secondary, for reverse zone secondary"
	echo "No setting value for reverse network"
else
	echo "Ok - 1"
	if [ -z $2 ];then
		echo "No IP setting for secondary dns"
		echo "No setting final value of IP primary, for reverse zone primary"
		echo "No setting final value of IP secondary, for reverse zone secondary"
		echo "No setting value for reverse network"
	else
		echo "Ok - 2"
		if [ -z $3 ];then
			echo "No setting final value of IP primary, for reverse zone primary"
			echo "No setting final value of IP secondary, for reverse zone secondary"
			echo "No setting value for reverse network"
		else
			echo "Ok - 3"
			if [ -z $4 ];then
				echo "No setting final value of IP secondary, for reverse zone secondary"
				echo "No setting value for reverse network"
			else
				echo "Ok - 4"
				if [ -z $5 ];then
					echo "No setting value for reverse network"
				else
					echo "Ok - 5"
					docker build -t ubuntu .
					cd primary

					sed -i "s/primary/$1/" db.ac.asa.br
					sed -i "s/secondary/$2/" db.ac.asa.br

					sed -i "s/reverse1/$3/" db.reverse.ac.asa.br
					sed -i "s/reverse2/$4/" db.reverse.ac.asa.br

					sed -i "s/reverserede/$5/" named.conf.default-zones
					sed -i "s/secondary/$2/" named.conf.default-zones

					wrk=$(pwd)
					docker run -d -p $1:53:53/udp -p $1:53:53/tcp --name ns1 --hostname dns-ns1 -v "$wrk"/:/etc/bind --dns $1 ubuntu
					echo "Name container to dns primary => ns1 | With IP $1"
				fi
			fi
		fi
	fi
fi