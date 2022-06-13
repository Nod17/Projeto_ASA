FROM ubuntu/bind9:latest

RUN apt-get update \
    && apt-get install -y \
    nano \
    dnsutils \
    iputils-ping
    
RUN apt-get upgrade -y

COPY db.direto /etc/bind/
COPY db.indireto /etc/bind/
COPY db.root /etc/bind/

COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY named.conf.default-zones /etc/bind/

#WORKDIR /etc/
#RUN rm resolv.conf
#COPY resolv.conf /etc/

#RUN echo nameserver 172.17.0.2 > /etc/resolv.conf

#CMD echo nameserver 172.17.0.2 > /etc/resolv.conf

CMD /usr/sbin/named ; tail -F /dev/null