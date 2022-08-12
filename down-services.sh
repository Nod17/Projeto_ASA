#!/bin/bash

docker-compose down

docker rm -f ns1
docker rm -f servermail
docker rm -f webmailserver

docker rmi -f dns
docker rmi -f server-mails
docker rmi -f webmail