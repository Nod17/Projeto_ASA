FROM ubuntu/bind9:latest

RUN apt-get update \
    && apt-get install -y \
    nano \
    dnsutils \
    iputils-ping

RUN apt-get upgrade -y

#COPY db.ac.asa.br /etc/bind/
#COPY db.reverse.ac.asa.br /etc/bind/
COPY db.root /etc/bind/

COPY named.conf.options /etc/bind/
#COPY named.conf.local /etc/bind/
COPY named.conf.default-zones /etc/bind/

#Comando abaixo deve servir para que o container não caia após necessidade de restartar o bind9 dentro do container
CMD /usr/sbin/named ; tail -F /dev/null