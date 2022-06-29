#!/bin/bash

op=8
while test $op != 0; do
	echo "------------------------------------------------------"
	echo "-------------------- Admin Docker --------------------"
	echo "------------------------------------------------------"
	cat text_admin.txt
	echo "Option> " ; read op
	echo
	case $op in
	0)
		echo "Stopedd";;
	1)
		docker ps;;
	2)
		docker ps -a;;
	3)
		echo "1 - ns1 | 2 - ns2 | 3 - all"
		read ns
		echo "1 - stop | 2 - restart | 3 - start"
		read func
		case $ns in
		1)
			case $func in
			1)
				docker exec ns1 /etc/init.d/named stop;;
			2)
				docker exec ns1 /etc/init.d/named restart;;
			3)
                                docker exec ns1 /etc/init.d/named start;;
			*)
				echo "Invalid Option"
			esac;;
		2)
			case $func in
			1)
                                docker exec ns2 /etc/init.d/named stop;;
                        2)
                                docker exec ns2 /etc/init.d/named restart;;
                        3)
                                docker exec ns2 /etc/init.d/named start;;
                        *)
                	        echo "Invlaid option"
			esac;;
		3)
			case $func in
			1)
                        	docker exec ns1 /etc/init.d/named stop
				docker exec ns2 /etc/init.d/named stop;;
                        2)
                                docker exec ns1 /etc/init.d/named restart
				docker exec ns2 /etc/init.d/named restart;;
                        3)
                                docker exec ns1 /etc/init.d/named start
				docker exec ns2 /etc/init.d/named start;;
                        *)
                                echo "Invlaid option"
			esac;;
		*)
			echo "Invalid Option..."
		esac;;
	4)
		echo "1 - ns1 | 2 - ns2 | 3 - all" ; read nss
		case $nss in
		1)
			docker rm -f ns1;;
		2)
			docker rm -f ns2;;
		3)
			docker rm -f ns1
			docker rm -f ns2;;
		*)
			echo "Invalid Option"
		esac;;
	5)
		echo "Name dns>" ; read ns
		docker exec $ns named -g;;

	6)
		echo "Name of container> " ; read name
		docker inspect $name;;
	7)
		echo "Name of image> " ; read named
		docker rmi -f $named;;
	8)
		docker volume prune -f;;

	*)
		echo "Invalid option"
	esac
done