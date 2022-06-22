# Outra forma de configuração testada

* Comandos que eu usei:
    * docker build -t b9 .
    * docker run --name bind9 -d -p 0.0.0.0:53:53/udp -p 0.0.0.0:53:53/tcp --dns 172.17.0.2 b9

- Inclusive no momento estou usando este container como DNS e acessando sites e o próprio domínio definido
- Vou subir para o repositório usando ele hehehe