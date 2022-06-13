FROM ubuntu/bind9:latest

RUN apt-update


COPY db.direto /etc/bind/
COPY db.indireto /etc/bind/
COPY db.root /etc/bind/

COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY named.conf.default-zones /etc/bind/

COPY named.conf /etc/bind

CMD /etc/init.d/named restart ; tail -F /dev/null